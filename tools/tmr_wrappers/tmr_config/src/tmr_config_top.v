
module TMR_CONFIG #
(
  // Parameters of AXI Subordinate Bus Interface S00_AXI,
  parameter C_S_AXI_DATA_WIDTH = 32,
  parameter C_S_AXI_ADDR_WIDTH = 32,
  // Parameters of AXI Manager Bus Interface M00_AXI,
  parameter C_M_AXI_DATA_WIDTH = 32,
  parameter C_M_AXI_ADDR_WIDTH = 32
)
(
  input axi_aclk,
  input axi_resetn,
  // Ports of AXI Subordinate Bus Interface S00_AXI,
  input [C_S_AXI_ADDR_WIDTH-1:0] s00_axi_awaddr,
  input s00_axi_awvalid,
  output s00_axi_awready,
  input [C_S_AXI_DATA_WIDTH-1:0] s00_axi_wdata,
  input s00_axi_wvalid,
  output s00_axi_wready,
  input s00_axi_bready,
  output [1:0] s00_axi_bresp,
  output s00_axi_bvalid,
  input [C_S_AXI_ADDR_WIDTH-1:0] s00_axi_araddr,
  input s00_axi_arvalid,
  output s00_axi_arready,
  input s00_axi_rready,
  output [C_S_AXI_DATA_WIDTH-1:0] s00_axi_rdata,
  output [1:0] s00_axi_rresp,
  output s00_axi_rvalid,
  // Ports of AXI Manager Bus Interface M00_AXI,
  input m00_axi_awready,
  output [C_M_AXI_ADDR_WIDTH-1:0] m00_axi_awaddr,
  output m00_axi_awvalid,
  input m00_axi_wready,
  output [C_M_AXI_DATA_WIDTH-1:0] m00_axi_wdata,
  output m00_axi_wvalid,
  input [1:0] m00_axi_bresp,
  input m00_axi_bvalid,
  output m00_axi_bready,
  input m00_axi_arready,
  output [C_M_AXI_ADDR_WIDTH-1:0] m00_axi_araddr,
  output m00_axi_arvalid,
  input [C_M_AXI_DATA_WIDTH-1:0] m00_axi_rdata,
  input [1:0] m00_axi_rresp,
  input m00_axi_rvalid,
  output m00_axi_rready,
  // Ports of AXI Manager Bus Interface M01_AXI,
  input m01_axi_awready,
  output [C_M_AXI_ADDR_WIDTH-1:0] m01_axi_awaddr,
  output m01_axi_awvalid,
  input m01_axi_wready,
  output [C_M_AXI_DATA_WIDTH-1:0] m01_axi_wdata,
  output m01_axi_wvalid,
  input [1:0] m01_axi_bresp,
  input m01_axi_bvalid,
  output m01_axi_bready,
  input m01_axi_arready,
  output [C_M_AXI_ADDR_WIDTH-1:0] m01_axi_araddr,
  output m01_axi_arvalid,
  input [C_M_AXI_DATA_WIDTH-1:0] m01_axi_rdata,
  input [1:0] m01_axi_rresp,
  input m01_axi_rvalid,
  output m01_axi_rready,
  // Ports of AXI Manager Bus Interface M02_AXI,
  input m02_axi_awready,
  output [C_M_AXI_ADDR_WIDTH-1:0] m02_axi_awaddr,
  output m02_axi_awvalid,
  input m02_axi_wready,
  output [C_M_AXI_DATA_WIDTH-1:0] m02_axi_wdata,
  output m02_axi_wvalid,
  input [1:0] m02_axi_bresp,
  input m02_axi_bvalid,
  output m02_axi_bready,
  input m02_axi_arready,
  output [C_M_AXI_ADDR_WIDTH-1:0] m02_axi_araddr,
  output m02_axi_arvalid,
  input [C_M_AXI_DATA_WIDTH-1:0] m02_axi_rdata,
  input [1:0] m02_axi_rresp,
  input m02_axi_rvalid,
  output m02_axi_rready,
  output fault0,
  output fault1,
  output fault2
);

  // Forward config signals
  assign { m00_axi_awaddr, m01_axi_awaddr, m02_axi_awaddr } = { 3{ s00_axi_awaddr } };
  assign { m00_axi_awvalid, m01_axi_awvalid, m02_axi_awvalid } = { 3{ s00_axi_awvalid } };
  assign { m00_axi_wdata, m01_axi_wdata, m02_axi_wdata } = { 3{ s00_axi_wdata } };
  assign { m00_axi_wvalid, m01_axi_wvalid, m02_axi_wvalid } = { 3{ s00_axi_wvalid } };
  assign { m00_axi_bready, m01_axi_bready, m02_axi_bready } = { 3{ s00_axi_bready } };
  assign { m00_axi_araddr, m01_axi_araddr, m02_axi_araddr } = { 3{ s00_axi_araddr } };
  assign { m00_axi_arvalid, m01_axi_arvalid, m02_axi_arvalid } = { 3{ s00_axi_arvalid } };
  assign { m00_axi_rready, m01_axi_rready, m02_axi_rready } = { 3{ s00_axi_rready } };
  // Voting logic
  assign s00_axi_awready = m00_axi_awready & m01_axi_awready | m01_axi_awready & m02_axi_awready | m00_axi_awready & m02_axi_awready;
  assign s00_axi_wready = m00_axi_wready & m01_axi_wready | m01_axi_wready & m02_axi_wready | m00_axi_wready & m02_axi_wready;
  assign s00_axi_bresp = m00_axi_bresp & m01_axi_bresp | m01_axi_bresp & m02_axi_bresp | m00_axi_bresp & m02_axi_bresp;
  assign s00_axi_bvalid = m00_axi_bvalid & m01_axi_bvalid | m01_axi_bvalid & m02_axi_bvalid | m00_axi_bvalid & m02_axi_bvalid;
  assign s00_axi_arready = m00_axi_arready & m01_axi_arready | m01_axi_arready & m02_axi_arready | m00_axi_arready & m02_axi_arready;
  assign s00_axi_rdata = m00_axi_rdata & m01_axi_rdata | m01_axi_rdata & m02_axi_rdata | m00_axi_rdata & m02_axi_rdata;
  assign s00_axi_rresp = m00_axi_rresp & m01_axi_rresp | m01_axi_rresp & m02_axi_rresp | m00_axi_rresp & m02_axi_rresp;
  assign s00_axi_rvalid = m00_axi_rvalid & m01_axi_rvalid | m01_axi_rvalid & m02_axi_rvalid | m00_axi_rvalid & m02_axi_rvalid;
  // Fault detection logic
  wire fault0_awready;
  wire fault1_awready;
  wire fault2_awready;
  assign fault0_awready = (m00_axi_awready ^ m01_axi_awready) & ((m00_axi_awready ^ m02_axi_awready) & ~(m01_axi_awready ^ m02_axi_awready));
  assign fault1_awready = (m01_axi_awready ^ m00_axi_awready) & ((m01_axi_awready ^ m02_axi_awready) & ~(m00_axi_awready ^ m02_axi_awready));
  assign fault2_awready = (m02_axi_awready ^ m00_axi_awready) & ((m02_axi_awready ^ m01_axi_awready) & ~(m00_axi_awready ^ m01_axi_awready));
  wire fault0_wready;
  wire fault1_wready;
  wire fault2_wready;
  assign fault0_wready = (m00_axi_wready ^ m01_axi_wready) & ((m00_axi_wready ^ m02_axi_wready) & ~(m01_axi_wready ^ m02_axi_wready));
  assign fault1_wready = (m01_axi_wready ^ m00_axi_wready) & ((m01_axi_wready ^ m02_axi_wready) & ~(m00_axi_wready ^ m02_axi_wready));
  assign fault2_wready = (m02_axi_wready ^ m00_axi_wready) & ((m02_axi_wready ^ m01_axi_wready) & ~(m00_axi_wready ^ m01_axi_wready));
  wire fault0_bresp;
  wire fault1_bresp;
  wire fault2_bresp;
  assign fault0_bresp = (m00_axi_bresp ^ m01_axi_bresp) & ((m00_axi_bresp ^ m02_axi_bresp) & ~(m01_axi_bresp ^ m02_axi_bresp));
  assign fault1_bresp = (m01_axi_bresp ^ m00_axi_bresp) & ((m01_axi_bresp ^ m02_axi_bresp) & ~(m00_axi_bresp ^ m02_axi_bresp));
  assign fault2_bresp = (m02_axi_bresp ^ m00_axi_bresp) & ((m02_axi_bresp ^ m01_axi_bresp) & ~(m00_axi_bresp ^ m01_axi_bresp));
  wire fault0_bvalid;
  wire fault1_bvalid;
  wire fault2_bvalid;
  assign fault0_bvalid = (m00_axi_bvalid ^ m01_axi_bvalid) & ((m00_axi_bvalid ^ m02_axi_bvalid) & ~(m01_axi_bvalid ^ m02_axi_bvalid));
  assign fault1_bvalid = (m01_axi_bvalid ^ m00_axi_bvalid) & ((m01_axi_bvalid ^ m02_axi_bvalid) & ~(m00_axi_bvalid ^ m02_axi_bvalid));
  assign fault2_bvalid = (m02_axi_bvalid ^ m00_axi_bvalid) & ((m02_axi_bvalid ^ m01_axi_bvalid) & ~(m00_axi_bvalid ^ m01_axi_bvalid));
  wire fault0_arready;
  wire fault1_arready;
  wire fault2_arready;
  assign fault0_arready = (m00_axi_arready ^ m01_axi_arready) & ((m00_axi_arready ^ m02_axi_arready) & ~(m01_axi_arready ^ m02_axi_arready));
  assign fault1_arready = (m01_axi_arready ^ m00_axi_arready) & ((m01_axi_arready ^ m02_axi_arready) & ~(m00_axi_arready ^ m02_axi_arready));
  assign fault2_arready = (m02_axi_arready ^ m00_axi_arready) & ((m02_axi_arready ^ m01_axi_arready) & ~(m00_axi_arready ^ m01_axi_arready));
  wire fault0_rdata;
  wire fault1_rdata;
  wire fault2_rdata;
  assign fault0_rdata = (m00_axi_rdata ^ m01_axi_rdata) & ((m00_axi_rdata ^ m02_axi_rdata) & ~(m01_axi_rdata ^ m02_axi_rdata));
  assign fault1_rdata = (m01_axi_rdata ^ m00_axi_rdata) & ((m01_axi_rdata ^ m02_axi_rdata) & ~(m00_axi_rdata ^ m02_axi_rdata));
  assign fault2_rdata = (m02_axi_rdata ^ m00_axi_rdata) & ((m02_axi_rdata ^ m01_axi_rdata) & ~(m00_axi_rdata ^ m01_axi_rdata));
  wire fault0_rresp;
  wire fault1_rresp;
  wire fault2_rresp;
  assign fault0_rresp = (m00_axi_rresp ^ m01_axi_rresp) & ((m00_axi_rresp ^ m02_axi_rresp) & ~(m01_axi_rresp ^ m02_axi_rresp));
  assign fault1_rresp = (m01_axi_rresp ^ m00_axi_rresp) & ((m01_axi_rresp ^ m02_axi_rresp) & ~(m00_axi_rresp ^ m02_axi_rresp));
  assign fault2_rresp = (m02_axi_rresp ^ m00_axi_rresp) & ((m02_axi_rresp ^ m01_axi_rresp) & ~(m00_axi_rresp ^ m01_axi_rresp));
  wire fault0_rvalid;
  wire fault1_rvalid;
  wire fault2_rvalid;
  assign fault0_rvalid = (m00_axi_rvalid ^ m01_axi_rvalid) & ((m00_axi_rvalid ^ m02_axi_rvalid) & ~(m01_axi_rvalid ^ m02_axi_rvalid));
  assign fault1_rvalid = (m01_axi_rvalid ^ m00_axi_rvalid) & ((m01_axi_rvalid ^ m02_axi_rvalid) & ~(m00_axi_rvalid ^ m02_axi_rvalid));
  assign fault2_rvalid = (m02_axi_rvalid ^ m00_axi_rvalid) & ((m02_axi_rvalid ^ m01_axi_rvalid) & ~(m00_axi_rvalid ^ m01_axi_rvalid));
  assign fault0 = fault0_awready | fault0_wready | (fault0_bresp | fault0_bvalid) | (fault0_arready | fault0_rdata | (fault0_rresp | fault0_rvalid));
  assign fault1 = fault1_awready | fault1_wready | (fault1_bresp | fault1_bvalid) | (fault1_arready | fault1_rdata | (fault1_rresp | fault1_rvalid));
  assign fault2 = fault2_awready | fault2_wready | (fault2_bresp | fault2_bvalid) | (fault2_arready | fault2_rdata | (fault2_rresp | fault2_rvalid));

endmodule
