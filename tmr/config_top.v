
module TMR_CONFIG #
(
  // Parameters of AXI Subordinate Bus Interface S00_AXI,
  parameter C_S_AXI_DATA_WIDTH = 32,
  parameter C_S_AXI_ADDR_WIDTH = 32,
  // Parameters of AXI Manager Bus Interface MXX_AXI,
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
  output fault00,
  output fault01,
  output fault02
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
  assign s00_axi_awready = m01_axi_awready & m02_axi_awready | (m00_axi_awready & m01_axi_awready | m00_axi_awready & m02_axi_awready);
  assign s00_axi_wready = m01_axi_wready & m02_axi_wready | (m00_axi_wready & m01_axi_wready | m00_axi_wready & m02_axi_wready);
  assign s00_axi_bresp = m01_axi_bresp & m02_axi_bresp | (m00_axi_bresp & m01_axi_bresp | m00_axi_bresp & m02_axi_bresp);
  assign s00_axi_bvalid = m01_axi_bvalid & m02_axi_bvalid | (m00_axi_bvalid & m01_axi_bvalid | m00_axi_bvalid & m02_axi_bvalid);
  assign s00_axi_arready = m01_axi_arready & m02_axi_arready | (m00_axi_arready & m01_axi_arready | m00_axi_arready & m02_axi_arready);
  assign s00_axi_rdata = m01_axi_rdata & m02_axi_rdata | (m00_axi_rdata & m01_axi_rdata | m00_axi_rdata & m02_axi_rdata);
  assign s00_axi_rresp = m01_axi_rresp & m02_axi_rresp | (m00_axi_rresp & m01_axi_rresp | m00_axi_rresp & m02_axi_rresp);
  assign s00_axi_rvalid = m01_axi_rvalid & m02_axi_rvalid | (m00_axi_rvalid & m01_axi_rvalid | m00_axi_rvalid & m02_axi_rvalid);
  // Fault detection logic
  wire fault00_awready;
  wire fault01_awready;
  wire fault02_awready;
  assign fault00_awready = (m00_axi_awready ^ m01_axi_awready) & (m00_axi_awready ^ m02_axi_awready) & ~(m01_axi_awready ^ m02_axi_awready);
  assign fault01_awready = (m00_axi_awready ^ m01_axi_awready) & (m01_axi_awready ^ m02_axi_awready) & ~(m00_axi_awready ^ m02_axi_awready);
  assign fault02_awready = (m00_axi_awready ^ m02_axi_awready) & (m01_axi_awready ^ m02_axi_awready) & ~(m00_axi_awready ^ m01_axi_awready);
  wire fault00_wready;
  wire fault01_wready;
  wire fault02_wready;
  assign fault00_wready = (m00_axi_wready ^ m01_axi_wready) & (m00_axi_wready ^ m02_axi_wready) & ~(m01_axi_wready ^ m02_axi_wready);
  assign fault01_wready = (m00_axi_wready ^ m01_axi_wready) & (m01_axi_wready ^ m02_axi_wready) & ~(m00_axi_wready ^ m02_axi_wready);
  assign fault02_wready = (m00_axi_wready ^ m02_axi_wready) & (m01_axi_wready ^ m02_axi_wready) & ~(m00_axi_wready ^ m01_axi_wready);
  wire fault00_bresp;
  wire fault01_bresp;
  wire fault02_bresp;
  assign fault00_bresp = (m00_axi_bresp ^ m01_axi_bresp) & (m00_axi_bresp ^ m02_axi_bresp) & ~(m01_axi_bresp ^ m02_axi_bresp);
  assign fault01_bresp = (m00_axi_bresp ^ m01_axi_bresp) & (m01_axi_bresp ^ m02_axi_bresp) & ~(m00_axi_bresp ^ m02_axi_bresp);
  assign fault02_bresp = (m00_axi_bresp ^ m02_axi_bresp) & (m01_axi_bresp ^ m02_axi_bresp) & ~(m00_axi_bresp ^ m01_axi_bresp);
  wire fault00_bvalid;
  wire fault01_bvalid;
  wire fault02_bvalid;
  assign fault00_bvalid = (m00_axi_bvalid ^ m01_axi_bvalid) & (m00_axi_bvalid ^ m02_axi_bvalid) & ~(m01_axi_bvalid ^ m02_axi_bvalid);
  assign fault01_bvalid = (m00_axi_bvalid ^ m01_axi_bvalid) & (m01_axi_bvalid ^ m02_axi_bvalid) & ~(m00_axi_bvalid ^ m02_axi_bvalid);
  assign fault02_bvalid = (m00_axi_bvalid ^ m02_axi_bvalid) & (m01_axi_bvalid ^ m02_axi_bvalid) & ~(m00_axi_bvalid ^ m01_axi_bvalid);
  wire fault00_arready;
  wire fault01_arready;
  wire fault02_arready;
  assign fault00_arready = (m00_axi_arready ^ m01_axi_arready) & (m00_axi_arready ^ m02_axi_arready) & ~(m01_axi_arready ^ m02_axi_arready);
  assign fault01_arready = (m00_axi_arready ^ m01_axi_arready) & (m01_axi_arready ^ m02_axi_arready) & ~(m00_axi_arready ^ m02_axi_arready);
  assign fault02_arready = (m00_axi_arready ^ m02_axi_arready) & (m01_axi_arready ^ m02_axi_arready) & ~(m00_axi_arready ^ m01_axi_arready);
  wire fault00_rdata;
  wire fault01_rdata;
  wire fault02_rdata;
  assign fault00_rdata = (m00_axi_rdata ^ m01_axi_rdata) & (m00_axi_rdata ^ m02_axi_rdata) & ~(m01_axi_rdata ^ m02_axi_rdata);
  assign fault01_rdata = (m00_axi_rdata ^ m01_axi_rdata) & (m01_axi_rdata ^ m02_axi_rdata) & ~(m00_axi_rdata ^ m02_axi_rdata);
  assign fault02_rdata = (m00_axi_rdata ^ m02_axi_rdata) & (m01_axi_rdata ^ m02_axi_rdata) & ~(m00_axi_rdata ^ m01_axi_rdata);
  wire fault00_rresp;
  wire fault01_rresp;
  wire fault02_rresp;
  assign fault00_rresp = (m00_axi_rresp ^ m01_axi_rresp) & (m00_axi_rresp ^ m02_axi_rresp) & ~(m01_axi_rresp ^ m02_axi_rresp);
  assign fault01_rresp = (m00_axi_rresp ^ m01_axi_rresp) & (m01_axi_rresp ^ m02_axi_rresp) & ~(m00_axi_rresp ^ m02_axi_rresp);
  assign fault02_rresp = (m00_axi_rresp ^ m02_axi_rresp) & (m01_axi_rresp ^ m02_axi_rresp) & ~(m00_axi_rresp ^ m01_axi_rresp);
  wire fault00_rvalid;
  wire fault01_rvalid;
  wire fault02_rvalid;
  assign fault00_rvalid = (m00_axi_rvalid ^ m01_axi_rvalid) & (m00_axi_rvalid ^ m02_axi_rvalid) & ~(m01_axi_rvalid ^ m02_axi_rvalid);
  assign fault01_rvalid = (m00_axi_rvalid ^ m01_axi_rvalid) & (m01_axi_rvalid ^ m02_axi_rvalid) & ~(m00_axi_rvalid ^ m02_axi_rvalid);
  assign fault02_rvalid = (m00_axi_rvalid ^ m02_axi_rvalid) & (m01_axi_rvalid ^ m02_axi_rvalid) & ~(m00_axi_rvalid ^ m01_axi_rvalid);
  assign fault00 = fault00_awready | fault00_wready | (fault00_bresp | fault00_bvalid) | (fault00_arready | fault00_rdata | (fault00_rresp | fault00_rvalid));
  assign fault01 = fault01_awready | fault01_wready | (fault01_bresp | fault01_bvalid) | (fault01_arready | fault01_rdata | (fault01_rresp | fault01_rvalid));
  assign fault02 = fault02_awready | fault02_wready | (fault02_bresp | fault02_bvalid) | (fault02_arready | fault02_rdata | (fault02_rresp | fault02_rvalid));

endmodule
