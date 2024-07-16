import pyverilog.vparser.ast as vast
from .constants import *

# S = slave/subordinate, M = master/manager
class AXI4LiteInterface:
  def __init__(
    self,
    name:         str,
    data_width:   int = 64,
    addr_width:   int = 32,
    role:         str = "S",
    param_tag:    str = "",
  ):
    if role not in ["S", "M"]: raise ValueError(f'Invalid AXI4Lite role: {role}')
    
    # TODO: delete later
    self.addr_width = addr_width
    self.data_width = data_width
    
    ### Generate parameters
    self.params = {} # param_name -> vast parameter
    for param_name in AXI4_LITE_PARAMS:
      param_val = getattr(self, param_name, None)

      if param_tag != "": param_id = f'{param_tag}{param_name.upper()}'
      else:               param_id = f'C_{name.upper()}_AXI_{param_name.upper()}'

      self.params[param_name] = vast.Parameter(param_id, vast.IntConst(param_val))

    ### Generate signal widths
    self.widths = gen_axi4lite_widths()
    
    for param_name, param_val in self.params.items(): # set param widths
      self.widths[param_name].msb.left.name = param_val.name
    
    ### Generate signals
    if role == "S": self.ports = gen_axi4lite_s_ports()
    else:           self.ports = gen_axi4lite_m_ports()
    
    # Set port names
    for port_name, port_vast in self.ports.items():
      port_vast.first.name = f'{name}_axi_{port_name}'
    
    # Set port widths
    self.ports["awaddr"].first.width   = self.widths["addr_width"]
    self.ports["araddr"].first.width   = self.widths["addr_width"]
    self.ports["wdata"].first.width    = self.widths["data_width"]
    self.ports["rdata"].first.width    = self.widths["data_width"]
    self.ports["bresp"].first.width    = self.widths["bresp"]
    self.ports["rresp"].first.width    = self.widths["rresp"]
    
  def gen_paramlist(self):
    return vast.Paramlist(list(self.params.values()))

  def gen_portlist(self):
    return vast.Portlist(list(self.ports.values()))

# S = slave/subordinate, M = master/manager
class AXI4FullInterface():
  def __init__(
    self,
    name:         str,
    id_width:     int = 4, # awid, bid, arid, rid
    awuser_width: int = 32,
    aruser_width: int = 32,
    wuser_width:  int = 32,
    ruser_width:  int = 32,
    buser_width:  int = 32,
    data_width:   int = 64,
    addr_width:   int = 32,
    role:         str = "S",
    param_tag:    str = ""
  ):
    if role not in ["S", "M"]: raise ValueError(f'Invalid AXI4Full role: {role}')
    
    # TODO: delete later
    self.id_width = id_width
    self.awuser_width = awuser_width
    self.aruser_width = aruser_width
    self.wuser_width = wuser_width
    self.ruser_width = ruser_width
    self.buser_width = buser_width
    self.addr_width = addr_width
    self.data_width = data_width
    
    ### Generate parameters
    self.params = {} # param_name -> vast parameter
    for param_name in AXI4_FULL_PARAMS:
      param_val = getattr(self, param_name, None)
      if param_val == None: continue

      if param_tag != "": param_id = f'{param_tag}{param_name.upper()}'
      else:               param_id = f'C_{name.upper()}_AXI_{param_name.upper()}'

      self.params[param_name] = vast.Parameter(param_id, vast.IntConst(param_val))

    ### Generate signal widths
    self.widths = gen_axi4full_widths()
    
    for param_name, param_val in self.params.items(): # set param widths
      self.widths[param_name].msb.left.name = param_val.name
    
    ### Generate signals
    if role == "S": self.ports = gen_axi4full_s_ports()
    else:           self.ports = gen_axi4full_m_ports()
    
    # Set port names
    for port_name, port_vast in self.ports.items():
      port_vast.first.name = f'{name}_axi_{port_name}'
    
    # Set port widths
    self.ports["awid"].first.width     = self.widths["id_width"]
    self.ports["awaddr"].first.width   = self.widths["addr_width"]
    self.ports["awlen"].first.width    = self.widths["awlen"]
    self.ports["awsize"].first.width   = self.widths["awsize"]
    self.ports["awburst"].first.width  = self.widths["awburst"]
    self.ports["awcache"].first.width  = self.widths["awcache"]
    self.ports["awprot"].first.width   = self.widths["awprot"]
    self.ports["awqos"].first.width    = self.widths["awqos"]
    self.ports["awregion"].first.width = self.widths["awregion"]
    self.ports["awuser"].first.width   = self.widths["awuser_width"]
    self.ports["wdata"].first.width    = self.widths["data_width"]
    self.ports["wstrb"].first.width    = self.widths["data_strobe"]
    self.ports["wuser"].first.width    = self.widths["wuser_width"]
    self.ports["bid"].first.width      = self.widths["id_width"]
    self.ports["bresp"].first.width    = self.widths["bresp"]
    self.ports["buser"].first.width    = self.widths["buser_width"]
    self.ports["arid"].first.width     = self.widths["id_width"]
    self.ports["araddr"].first.width   = self.widths["addr_width"]
    self.ports["arlen"].first.width    = self.widths["arlen"]
    self.ports["arsize"].first.width   = self.widths["arsize"]
    self.ports["arburst"].first.width  = self.widths["arburst"]
    self.ports["arcache"].first.width  = self.widths["arcache"]
    self.ports["arprot"].first.width   = self.widths["arprot"]
    self.ports["arqos"].first.width    = self.widths["arqos"]
    self.ports["arregion"].first.width = self.widths["arregion"]
    self.ports["aruser"].first.width   = self.widths["aruser_width"]
    self.ports["rid"].first.width      = self.widths["id_width"]
    self.ports["rdata"].first.width    = self.widths["data_width"]
    self.ports["rresp"].first.width    = self.widths["rresp"]
    self.ports['ruser'].first.width    = self.widths["ruser_width"]
    
  def gen_paramlist(self):
    return vast.Paramlist(list(self.params.values()))

  def gen_portlist(self):
    return vast.Portlist(list(self.ports.values()))