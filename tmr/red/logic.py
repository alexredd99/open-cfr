import pyverilog.vparser.ast as vast
from .axi import *
from .vast_helpers import *

NUM_REDUNDANT = 3

class RedConfigGenerator:
  def __init__(
    self,
    num_redundant: int = 3,
    data_width:    int = 64,
    addr_width:    int = 32,
  ):
    ## Helpers, we just want to change interface names
    gen_sub = lambda name, tag : AXI4LiteInterface(
      name         = name,
      data_width   = data_width,
      addr_width   = addr_width,
      role         = "S",
      param_tag    = tag,
    )

    gen_man = lambda name, tag : AXI4LiteInterface(
      name         = name,
      data_width   = data_width,
      addr_width   = addr_width,
      role         = "M",
      param_tag    = tag,
    )

    ## Generate interfaces
    self.config_in  = gen_sub("s00", "C_S_AXI_")
    self.config_out = [gen_man(f'm{i:02d}', "C_M_AXI_") for i in range(num_redundant)]

    self.assigns = []
    ## Pass config to IPs
    # Wire from subordinate config to N replicated managers
    self.assigns.append(vast.Identifier("// Forward config signals"))
    for signal_name in [
      *AXI4_LITE_ADDRESS_WRITE_MS_SIGNALS,
      *AXI4_LITE_DATA_WRITE_MS_SIGNALS,
      *AXI4_LITE_WRITE_RESPONSE_MS_SIGNALS,
      *AXI4_LITE_ADDRESS_READ_MS_SIGNALS,
      *AXI4_LITE_READ_DATA_MS_SIGNALS]:

      signal_ids =\
      [axi.ports[signal_name].first.name for axi in self.config_out]

      self.assigns.append(
        NEW_BROADCAST_CONCAT_ASSIGN(
          signal_ids, 
          self.config_in.ports[signal_name].first.name))
      
    ## Voting
    self.assigns.append(vast.Identifier("// Voting logic"))
    for signal_name in [
      *AXI4_LITE_ADDRESS_WRITE_SM_SIGNALS,
      *AXI4_LITE_DATA_WRITE_SM_SIGNALS,
      *AXI4_LITE_WRITE_RESPONSE_SM_SIGNALS,
      *AXI4_LITE_ADDRESS_READ_SM_SIGNALS,
      *AXI4_LITE_READ_DATA_SM_SIGNALS]:

      signal_ids =\
      [axi.ports[signal_name].first.name for axi in self.config_out]

      self.assigns.append(
        GEN_VOTING(self.config_in.ports[signal_name].first.name, signal_ids))
      
    ## Detection
    self.assigns.append(vast.Identifier("// Fault detection logic"))
    self.temp_faults = []
    for signal_name in [
      *AXI4_LITE_ADDRESS_WRITE_SM_SIGNALS,
      *AXI4_LITE_DATA_WRITE_SM_SIGNALS,
      *AXI4_LITE_WRITE_RESPONSE_SM_SIGNALS,
      *AXI4_LITE_ADDRESS_READ_SM_SIGNALS,
      *AXI4_LITE_READ_DATA_SM_SIGNALS]:
      
      curr_temp_faults =\
      [vast.Wire(f'fault{i:02d}_{signal_name}') for i in range(num_redundant)]
      
      self.assigns += curr_temp_faults

      fault_ids =\
      [axi.ports[signal_name].first.name for axi in self.config_out]

      for i, id in enumerate([vast.Identifier(x.name) for x in curr_temp_faults]):
        self.assigns.append(vast.Assign(
          vast.Lvalue(id),
          vast.Rvalue(
            GEN_DETECTION(fault_ids, fault_ids[i]))))
      
      self.temp_faults += curr_temp_faults
    
    self.fault_ports = \
    [vast.Ioport(vast.Output(f'fault{i:02d}')) for i in range(num_redundant)]
    
    for i, port in enumerate(self.fault_ports):
      self.assigns.append(vast.Assign(
        vast.Lvalue(
          vast.Identifier(port.first.name)),
        vast.Rvalue(
        GEN_MULTI_OP(vast.Or, [vast.Identifier(x.name) for x in self.temp_faults[i::num_redundant]]))))
    
  def gen_paramlist(self):
    return vast.Paramlist([
      vast.Identifier("// Parameters of AXI Subordinate Bus Interface S00_AXI"),
      self.config_in.gen_paramlist(),
      vast.Identifier("// Parameters of AXI Manager Bus Interface MXX_AXI"),
      self.config_out[0].gen_paramlist() # Only need 1 set of params for config_out
    ])

  def gen_portlist(self):
    portlist = [
      vast.Ioport(vast.Input("axi_aclk")),
      vast.Ioport(vast.Input("axi_resetn")),
      vast.Identifier("// Ports of AXI Subordinate Bus Interface S00_AXI"),
      self.config_in.gen_portlist(),
    ]

    for i, axi in enumerate(self.config_out):
      portlist += [
        vast.Identifier(f'// Ports of AXI Manager Bus Interface M{i:02d}_AXI'),
        axi.gen_portlist()
      ]

    portlist += self.fault_ports
    return vast.Portlist(portlist)
  
  def gen_logic(self):
    return self.assigns
  
class RedDataGenerator:
  def __init__(
    self,
    id_width:      int, # awid, bid, arid, rid
    awuser_width:  int,
    aruser_width:  int,
    wuser_width:   int,
    ruser_width:   int,
    buser_width:   int,
    data_width:    int = 64,
    addr_width:    int = 32,
    interrupts:    int = 0,
    num_redundant: int = 3,
  ):
    ## Helpers, we just want to change interface names
    gen_sub = lambda name, tag : AXI4FullInterface(
      name         = name,
      id_width     = id_width,
      awuser_width = awuser_width,
      aruser_width = aruser_width,
      wuser_width  = wuser_width,
      ruser_width  = ruser_width,
      buser_width  = buser_width,
      data_width   = data_width,
      addr_width   = addr_width,
      role         = "S",
      param_tag    = tag,
    )

    gen_man = lambda name, tag : AXI4FullInterface(
      name         = name,
      id_width     = id_width,
      awuser_width = awuser_width,
      aruser_width = aruser_width,
      wuser_width  = wuser_width,
      ruser_width  = ruser_width,
      buser_width  = buser_width,
      data_width   = data_width,
      addr_width   = addr_width,
      role         = "M",
      param_tag    = tag,
    )

    ## Generate interfaces
    self.data_in = [gen_sub(f's{i:02d}', "C_S_AXI_") for i in range(num_redundant)]
    self.data_out = gen_man("m00", "C_M_AXI_")
    
    ## Add interrupt signals
    INTERRUPT_SIGNALS = [f'interrupt{i:02d}' for i in range(interrupts)]

    for signal_name in INTERRUPT_SIGNALS:
      self.data_out.ports[signal_name] = vast.Ioport(vast.Output(f'm00_{signal_name}'))

    for s, axi in enumerate(self.data_in):
      for signal_name in INTERRUPT_SIGNALS:
        axi.ports[signal_name] = vast.Ioport(vast.Input(f's{s:02d}_{signal_name}'))
      
    self.assigns = []
    ## Pass back response signals
    # Wire from manager data to N replicated subordinates
    self.assigns.append(vast.Identifier("// Pass back response signals"))
    for signal_name in [
      *AXI4_FULL_ADDRESS_WRITE_SM_SIGNALS,
      *AXI4_FULL_DATA_WRITE_SM_SIGNALS,
      *AXI4_FULL_WRITE_RESPONSE_SM_SIGNALS,
      *AXI4_FULL_ADDRESS_READ_SM_SIGNALS,
      *AXI4_FULL_READ_DATA_SM_SIGNALS]:

      signal_ids =\
      [axi.ports[signal_name].first.name for axi in self.data_in]
      
      self.assigns.append(
        NEW_BROADCAST_CONCAT_ASSIGN(
          signal_ids,
          self.data_out.ports[signal_name].first.name))
  
    ## Voting
    self.assigns.append(vast.Identifier("// Voting logic"))
    for signal_name in [
      *AXI4_FULL_ADDRESS_WRITE_MS_SIGNALS,
      *AXI4_FULL_DATA_WRITE_MS_SIGNALS,
      *AXI4_FULL_WRITE_RESPONSE_MS_SIGNALS,
      *AXI4_FULL_ADDRESS_READ_MS_SIGNALS,
      *AXI4_FULL_READ_DATA_MS_SIGNALS,
      *INTERRUPT_SIGNALS]:

      signal_ids =\
      [axi.ports[signal_name].first.name for axi in self.data_in]

      self.assigns.append(
        GEN_VOTING(self.data_out.ports[signal_name].first.name, signal_ids))

    ## Detection
    self.assigns.append(vast.Identifier("// Fault detection logic"))
    self.temp_faults = []
    for signal_name in [
      *AXI4_FULL_ADDRESS_WRITE_MS_SIGNALS,
      *AXI4_FULL_DATA_WRITE_MS_SIGNALS,
      *AXI4_FULL_WRITE_RESPONSE_MS_SIGNALS,
      *AXI4_FULL_ADDRESS_READ_MS_SIGNALS,
      *AXI4_FULL_READ_DATA_MS_SIGNALS,
      *INTERRUPT_SIGNALS]:

      curr_temp_faults =\
      [vast.Wire(f'fault{i:02d}_{signal_name}') for i in range(num_redundant)]
      
      self.assigns += curr_temp_faults

      fault_ids =\
      [axi.ports[signal_name].first.name for axi in self.data_in]

      for i, id in enumerate([vast.Identifier(x.name) for x in curr_temp_faults]):
        self.assigns.append(vast.Assign(
          vast.Lvalue(id),
          vast.Rvalue(
            GEN_DETECTION(fault_ids, fault_ids[i]))))

      self.temp_faults += curr_temp_faults

    self.fault_ports = \
    [vast.Ioport(vast.Output(f'fault{i:02d}')) for i in range(num_redundant)]
    
    for i, port in enumerate(self.fault_ports):
      self.assigns.append(vast.Assign(
        vast.Lvalue(
          vast.Identifier(port.first.name)),
        vast.Rvalue(
        GEN_MULTI_OP(vast.Or, [vast.Identifier(x.name) for x in self.temp_faults[i::num_redundant]]))))
    
  def gen_paramlist(self):
    return vast.Paramlist([
      vast.Identifier("// Parameters of AXI Subordinate Bus Interface SXX_AXI"),
      self.data_in[0].gen_paramlist(),
      vast.Identifier("// Parameters of AXI Manager Bus Interface M00_AXI"),
      self.data_out.gen_paramlist(),
    ])

  def gen_portlist(self):
    portlist = [
      vast.Ioport(vast.Input("axi_aclk")),
      vast.Ioport(vast.Input("axi_resetn")),
    ]

    for i, axi in enumerate(self.data_in):
      portlist += [
        vast.Identifier(f'// Ports of AXI Subordinate Bus Interface S{i:02d}_AXI'),
        axi.gen_portlist()
      ]
    portlist += [
      vast.Identifier("// Ports of AXI Manager Bus Interface M00_AXI"),
      self.data_out.gen_portlist(),
      *self.fault_ports
    ]

    return vast.Portlist(portlist)
  
  def gen_logic(self):
    return self.assigns