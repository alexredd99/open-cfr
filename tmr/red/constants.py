import pyverilog.vparser.ast as vast

AXI4_LITE_PARAMS = [
  "data_width",
  "addr_width"
]

AXI4_FULL_PARAMS = [
  "id_width",
  "awuser_width",
  "aruser_width",
  "wuser_width",
  "ruser_width",
  "buser_width",
  "data_width",
  "addr_width"
]

def NEW_INPUT(): return vast.Ioport(vast.Input(None))
def NEW_OUTPUT(): return vast.Ioport(vast.Output(None))

AXI4_GLOBAL_SIGNALS = ["aclk", "aresetn"]

AXI4_FULL_ADDRESS_WRITE_SM_SIGNALS = ["awready"]
AXI4_FULL_ADDRESS_WRITE_MS_SIGNALS = ["awid", "awaddr", "awlen", "awsize", "awburst", 
                                 "awlock","awcache", "awprot", "awqos", "awregion", 
                                 "awuser", "awvalid"]

AXI4_FULL_DATA_WRITE_SM_SIGNALS = ["wready"]
AXI4_FULL_DATA_WRITE_MS_SIGNALS = ["wdata","wstrb","wlast","wuser","wvalid"]
AXI4_FULL_WRITE_RESPONSE_SM_SIGNALS = ["bid","bresp","buser","bvalid"]
AXI4_FULL_WRITE_RESPONSE_MS_SIGNALS = ["bready"]
AXI4_FULL_ADDRESS_READ_SM_SIGNALS = ["arready"]
AXI4_FULL_ADDRESS_READ_MS_SIGNALS = ["arid", "araddr", "arlen", "arsize", "arburst", 
                                 "arlock", "arcache", "arprot", "arqos", "arregion", 
                                 "aruser", "arvalid"]
AXI4_FULL_READ_DATA_SM_SIGNALS = ["rid", "rdata", "rresp", "rlast", "ruser", "rvalid"]
AXI4_FULL_READ_DATA_MS_SIGNALS = ["rready"]


AXI4_LITE_ADDRESS_WRITE_SM_SIGNALS = ["awready"]
AXI4_LITE_ADDRESS_WRITE_MS_SIGNALS = ["awaddr", "awvalid"]
AXI4_LITE_DATA_WRITE_SM_SIGNALS = ["wready"]
AXI4_LITE_DATA_WRITE_MS_SIGNALS = ["wdata","wvalid"]
AXI4_LITE_WRITE_RESPONSE_SM_SIGNALS = ["bresp", "bvalid"]
AXI4_LITE_WRITE_RESPONSE_MS_SIGNALS = ["bready"]
AXI4_LITE_ADDRESS_READ_SM_SIGNALS = ["arready"]
AXI4_LITE_ADDRESS_READ_MS_SIGNALS = ["araddr", "arvalid"]
AXI4_LITE_READ_DATA_SM_SIGNALS = ["rdata", "rresp", "rvalid"]
AXI4_LITE_READ_DATA_MS_SIGNALS = ["rready"]

AXI4_FULL_ALL_SIGNALS = [
  #*AXI4_GLOBAL_SIGNALS,
  *AXI4_FULL_ADDRESS_WRITE_MS_SIGNALS,
  *AXI4_FULL_ADDRESS_WRITE_SM_SIGNALS,
  *AXI4_FULL_DATA_WRITE_MS_SIGNALS,
  *AXI4_FULL_DATA_WRITE_SM_SIGNALS,
  *AXI4_FULL_WRITE_RESPONSE_MS_SIGNALS,
  *AXI4_FULL_WRITE_RESPONSE_SM_SIGNALS,
  *AXI4_FULL_ADDRESS_READ_MS_SIGNALS,
  *AXI4_FULL_ADDRESS_READ_SM_SIGNALS,
  *AXI4_FULL_READ_DATA_MS_SIGNALS,
  *AXI4_FULL_READ_DATA_SM_SIGNALS,
]

AXI4_LITE_ALL_SIGNALS = [
  #*AXI4_GLOBAL_SIGNALS,
  *AXI4_LITE_ADDRESS_WRITE_MS_SIGNALS,
  *AXI4_LITE_ADDRESS_WRITE_SM_SIGNALS,
  *AXI4_LITE_DATA_WRITE_MS_SIGNALS,
  *AXI4_LITE_DATA_WRITE_SM_SIGNALS,
  *AXI4_LITE_WRITE_RESPONSE_MS_SIGNALS,
  *AXI4_LITE_WRITE_RESPONSE_SM_SIGNALS,
  *AXI4_LITE_ADDRESS_READ_MS_SIGNALS,
  *AXI4_LITE_ADDRESS_READ_SM_SIGNALS,
  *AXI4_LITE_READ_DATA_MS_SIGNALS,
  *AXI4_LITE_READ_DATA_SM_SIGNALS,
]

def gen_axi4lite_s_ports():
  ports = {}

  #for signal in AXI4_GLOBAL_SIGNALS: ports[signal] = NEW_INPUT()

  for signal in AXI4_LITE_ADDRESS_WRITE_MS_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_LITE_ADDRESS_WRITE_SM_SIGNALS: ports[signal] = NEW_OUTPUT()

  for signal in AXI4_LITE_DATA_WRITE_MS_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_LITE_DATA_WRITE_SM_SIGNALS: ports[signal] = NEW_OUTPUT()
  
  for signal in AXI4_LITE_WRITE_RESPONSE_MS_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_LITE_WRITE_RESPONSE_SM_SIGNALS: ports[signal] = NEW_OUTPUT()
  
  for signal in AXI4_LITE_ADDRESS_READ_MS_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_LITE_ADDRESS_READ_SM_SIGNALS: ports[signal] = NEW_OUTPUT()

  for signal in AXI4_LITE_READ_DATA_MS_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_LITE_READ_DATA_SM_SIGNALS: ports[signal] = NEW_OUTPUT()

  return ports

def gen_axi4lite_m_ports():
  ports = {}

  #for signal in AXI4_GLOBAL_SIGNALS: ports[signal] = NEW_INPUT()

  for signal in AXI4_LITE_ADDRESS_WRITE_SM_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_LITE_ADDRESS_WRITE_MS_SIGNALS: ports[signal] = NEW_OUTPUT()

  for signal in AXI4_LITE_DATA_WRITE_SM_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_LITE_DATA_WRITE_MS_SIGNALS: ports[signal] = NEW_OUTPUT()
  
  for signal in AXI4_LITE_WRITE_RESPONSE_SM_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_LITE_WRITE_RESPONSE_MS_SIGNALS: ports[signal] = NEW_OUTPUT()
  
  for signal in AXI4_LITE_ADDRESS_READ_SM_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_LITE_ADDRESS_READ_MS_SIGNALS: ports[signal] = NEW_OUTPUT()

  for signal in AXI4_LITE_READ_DATA_SM_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_LITE_READ_DATA_MS_SIGNALS: ports[signal] = NEW_OUTPUT()

  return ports

def gen_axi4full_s_ports():
  ports = {}

  #for signal in AXI4_GLOBAL_SIGNALS: ports[signal] = NEW_INPUT()

  for signal in AXI4_FULL_ADDRESS_WRITE_MS_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_FULL_ADDRESS_WRITE_SM_SIGNALS: ports[signal] = NEW_OUTPUT()

  for signal in AXI4_FULL_DATA_WRITE_MS_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_FULL_DATA_WRITE_SM_SIGNALS: ports[signal] = NEW_OUTPUT()
  
  for signal in AXI4_FULL_WRITE_RESPONSE_MS_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_FULL_WRITE_RESPONSE_SM_SIGNALS: ports[signal] = NEW_OUTPUT()
  
  for signal in AXI4_FULL_ADDRESS_READ_MS_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_FULL_ADDRESS_READ_SM_SIGNALS: ports[signal] = NEW_OUTPUT()

  for signal in AXI4_FULL_READ_DATA_MS_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_FULL_READ_DATA_SM_SIGNALS: ports[signal] = NEW_OUTPUT()

  return ports

def gen_axi4full_m_ports():
  ports = {}

  #for signal in AXI4_GLOBAL_SIGNALS: ports[signal] = NEW_INPUT()

  for signal in AXI4_FULL_ADDRESS_WRITE_SM_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_FULL_ADDRESS_WRITE_MS_SIGNALS: ports[signal] = NEW_OUTPUT()

  for signal in AXI4_FULL_DATA_WRITE_SM_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_FULL_DATA_WRITE_MS_SIGNALS: ports[signal] = NEW_OUTPUT()
  
  for signal in AXI4_FULL_WRITE_RESPONSE_SM_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_FULL_WRITE_RESPONSE_MS_SIGNALS: ports[signal] = NEW_OUTPUT()
  
  for signal in AXI4_FULL_ADDRESS_READ_SM_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_FULL_ADDRESS_READ_MS_SIGNALS: ports[signal] = NEW_OUTPUT()

  for signal in AXI4_FULL_READ_DATA_SM_SIGNALS: ports[signal] = NEW_INPUT()
  for signal in AXI4_FULL_READ_DATA_MS_SIGNALS: ports[signal] = NEW_OUTPUT()

  return ports


def NEW_PARAM_WIDTH(): 
  return vast.Width(vast.Minus(vast.Identifier(None), vast.IntConst('1')), vast.IntConst('0'))

def NEW_CONST_WIDTH(width: int):
  return vast.Width(vast.IntConst(str(width - 1)), vast.IntConst("0"))

def gen_axi4lite_widths():
  widths = {
    "data_width":   NEW_PARAM_WIDTH(),
    "addr_width":   NEW_PARAM_WIDTH(),
    "rresp":        NEW_CONST_WIDTH(2),
    "bresp":        NEW_CONST_WIDTH(2),
  }

  return widths

def gen_axi4full_widths():
  widths = {
    "id_width":     NEW_PARAM_WIDTH(),
    "awuser_width": NEW_PARAM_WIDTH(),
    "aruser_width": NEW_PARAM_WIDTH(),
    "wuser_width":  NEW_PARAM_WIDTH(),
    "ruser_width":  NEW_PARAM_WIDTH(),
    "buser_width":  NEW_PARAM_WIDTH(),
    "data_width":   NEW_PARAM_WIDTH(),
    "addr_width":   NEW_PARAM_WIDTH(),
    "awlen":        NEW_CONST_WIDTH(8),
    "awsize":       NEW_CONST_WIDTH(3),
    "awburst":      NEW_CONST_WIDTH(2),
    "awcache":      NEW_CONST_WIDTH(4),
    "awprot":       NEW_CONST_WIDTH(3),
    "awqos":        NEW_CONST_WIDTH(4),
    "awregion":     NEW_CONST_WIDTH(4),
    "rresp":        NEW_CONST_WIDTH(2),
    "bresp":        NEW_CONST_WIDTH(2),
    "arlen":        NEW_CONST_WIDTH(8),
    "arsize":       NEW_CONST_WIDTH(3),
    "arburst":      NEW_CONST_WIDTH(2),
    "arcache":      NEW_CONST_WIDTH(4),
    "arprot":       NEW_CONST_WIDTH(3),
    "arqos":        NEW_CONST_WIDTH(4),
    "arqos":        NEW_CONST_WIDTH(4),
    "arregion":     NEW_CONST_WIDTH(4),
  }

  # [(data_width/8) - 1 : 0]
  widths["data_strobe"] = \
      vast.Width(
          vast.Minus(
            vast.Divide(
              widths["data_width"].msb.left,
              vast.IntConst('8')
            ), 
            vast.IntConst('1')
          ), 
          vast.IntConst('0'))
  
  return widths