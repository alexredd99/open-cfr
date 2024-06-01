
module TMR_DATA #
(
  // Parameters of AXI Subordinate Bus Interface S00_AXI,
  parameter C_S_AXI_ID_WIDTH = 1,
  parameter C_S_AXI_AWUSER_WIDTH = 0,
  parameter C_S_AXI_ARUSER_WIDTH = 0,
  parameter C_S_AXI_WUSER_WIDTH = 0,
  parameter C_S_AXI_RUSER_WIDTH = 0,
  parameter C_S_AXI_BUSER_WIDTH = 0,
  parameter C_S_AXI_DATA_WIDTH = 64,
  parameter C_S_AXI_ADDR_WIDTH = 32,
  // Parameters of AXI Manager Bus Interface M00_AXI,
  parameter C_M_AXI_ID_WIDTH = 1,
  parameter C_M_AXI_AWUSER_WIDTH = 0,
  parameter C_M_AXI_ARUSER_WIDTH = 0,
  parameter C_M_AXI_WUSER_WIDTH = 0,
  parameter C_M_AXI_RUSER_WIDTH = 0,
  parameter C_M_AXI_BUSER_WIDTH = 0,
  parameter C_M_AXI_DATA_WIDTH = 64,
  parameter C_M_AXI_ADDR_WIDTH = 32
)
(
  input axi_aclk,
  input axi_resetn,
  // Ports of AXI Subordinate Bus Interface S00_AXI,
  input [C_S_AXI_ID_WIDTH-1:0] s00_axi_awid,
  input [C_S_AXI_ADDR_WIDTH-1:0] s00_axi_awaddr,
  input [7:0] s00_axi_awlen,
  input [2:0] s00_axi_awsize,
  input [1:0] s00_axi_awburst,
  input s00_axi_awlock,
  input [3:0] s00_axi_awcache,
  input [2:0] s00_axi_awprot,
  input [3:0] s00_axi_awqos,
  input [3:0] s00_axi_awregion,
  input [C_S_AXI_AWUSER_WIDTH-1:0] s00_axi_awuser,
  input s00_axi_awvalid,
  output s00_axi_awready,
  input [C_S_AXI_DATA_WIDTH-1:0] s00_axi_wdata,
  input [C_S_AXI_DATA_WIDTH/8-1:0] s00_axi_wstrb,
  input s00_axi_wlast,
  input [C_S_AXI_WUSER_WIDTH-1:0] s00_axi_wuser,
  input s00_axi_wvalid,
  output s00_axi_wready,
  input s00_axi_bready,
  output [C_S_AXI_ID_WIDTH-1:0] s00_axi_bid,
  output [1:0] s00_axi_bresp,
  output [C_S_AXI_BUSER_WIDTH-1:0] s00_axi_buser,
  output s00_axi_bvalid,
  input [C_S_AXI_ID_WIDTH-1:0] s00_axi_arid,
  input [C_S_AXI_ADDR_WIDTH-1:0] s00_axi_araddr,
  input [7:0] s00_axi_arlen,
  input [2:0] s00_axi_arsize,
  input [1:0] s00_axi_arburst,
  input s00_axi_arlock,
  input [3:0] s00_axi_arcache,
  input [2:0] s00_axi_arprot,
  input [3:0] s00_axi_arqos,
  input [3:0] s00_axi_arregion,
  input [C_S_AXI_ARUSER_WIDTH-1:0] s00_axi_aruser,
  input s00_axi_arvalid,
  output s00_axi_arready,
  input s00_axi_rready,
  output [C_S_AXI_ID_WIDTH-1:0] s00_axi_rid,
  output [C_S_AXI_DATA_WIDTH-1:0] s00_axi_rdata,
  output [1:0] s00_axi_rresp,
  output s00_axi_rlast,
  output [C_S_AXI_RUSER_WIDTH-1:0] s00_axi_ruser,
  output s00_axi_rvalid,
  // Ports of AXI Subordinate Bus Interface S00_AXI,
  input [C_S_AXI_ID_WIDTH-1:0] s01_axi_awid,
  input [C_S_AXI_ADDR_WIDTH-1:0] s01_axi_awaddr,
  input [7:0] s01_axi_awlen,
  input [2:0] s01_axi_awsize,
  input [1:0] s01_axi_awburst,
  input s01_axi_awlock,
  input [3:0] s01_axi_awcache,
  input [2:0] s01_axi_awprot,
  input [3:0] s01_axi_awqos,
  input [3:0] s01_axi_awregion,
  input [C_S_AXI_AWUSER_WIDTH-1:0] s01_axi_awuser,
  input s01_axi_awvalid,
  output s01_axi_awready,
  input [C_S_AXI_DATA_WIDTH-1:0] s01_axi_wdata,
  input [C_S_AXI_DATA_WIDTH/8-1:0] s01_axi_wstrb,
  input s01_axi_wlast,
  input [C_S_AXI_WUSER_WIDTH-1:0] s01_axi_wuser,
  input s01_axi_wvalid,
  output s01_axi_wready,
  input s01_axi_bready,
  output [C_S_AXI_ID_WIDTH-1:0] s01_axi_bid,
  output [1:0] s01_axi_bresp,
  output [C_S_AXI_BUSER_WIDTH-1:0] s01_axi_buser,
  output s01_axi_bvalid,
  input [C_S_AXI_ID_WIDTH-1:0] s01_axi_arid,
  input [C_S_AXI_ADDR_WIDTH-1:0] s01_axi_araddr,
  input [7:0] s01_axi_arlen,
  input [2:0] s01_axi_arsize,
  input [1:0] s01_axi_arburst,
  input s01_axi_arlock,
  input [3:0] s01_axi_arcache,
  input [2:0] s01_axi_arprot,
  input [3:0] s01_axi_arqos,
  input [3:0] s01_axi_arregion,
  input [C_S_AXI_ARUSER_WIDTH-1:0] s01_axi_aruser,
  input s01_axi_arvalid,
  output s01_axi_arready,
  input s01_axi_rready,
  output [C_S_AXI_ID_WIDTH-1:0] s01_axi_rid,
  output [C_S_AXI_DATA_WIDTH-1:0] s01_axi_rdata,
  output [1:0] s01_axi_rresp,
  output s01_axi_rlast,
  output [C_S_AXI_RUSER_WIDTH-1:0] s01_axi_ruser,
  output s01_axi_rvalid,
  // Ports of AXI Subordinate Bus Interface S00_AXI,
  input [C_S_AXI_ID_WIDTH-1:0] s02_axi_awid,
  input [C_S_AXI_ADDR_WIDTH-1:0] s02_axi_awaddr,
  input [7:0] s02_axi_awlen,
  input [2:0] s02_axi_awsize,
  input [1:0] s02_axi_awburst,
  input s02_axi_awlock,
  input [3:0] s02_axi_awcache,
  input [2:0] s02_axi_awprot,
  input [3:0] s02_axi_awqos,
  input [3:0] s02_axi_awregion,
  input [C_S_AXI_AWUSER_WIDTH-1:0] s02_axi_awuser,
  input s02_axi_awvalid,
  output s02_axi_awready,
  input [C_S_AXI_DATA_WIDTH-1:0] s02_axi_wdata,
  input [C_S_AXI_DATA_WIDTH/8-1:0] s02_axi_wstrb,
  input s02_axi_wlast,
  input [C_S_AXI_WUSER_WIDTH-1:0] s02_axi_wuser,
  input s02_axi_wvalid,
  output s02_axi_wready,
  input s02_axi_bready,
  output [C_S_AXI_ID_WIDTH-1:0] s02_axi_bid,
  output [1:0] s02_axi_bresp,
  output [C_S_AXI_BUSER_WIDTH-1:0] s02_axi_buser,
  output s02_axi_bvalid,
  input [C_S_AXI_ID_WIDTH-1:0] s02_axi_arid,
  input [C_S_AXI_ADDR_WIDTH-1:0] s02_axi_araddr,
  input [7:0] s02_axi_arlen,
  input [2:0] s02_axi_arsize,
  input [1:0] s02_axi_arburst,
  input s02_axi_arlock,
  input [3:0] s02_axi_arcache,
  input [2:0] s02_axi_arprot,
  input [3:0] s02_axi_arqos,
  input [3:0] s02_axi_arregion,
  input [C_S_AXI_ARUSER_WIDTH-1:0] s02_axi_aruser,
  input s02_axi_arvalid,
  output s02_axi_arready,
  input s02_axi_rready,
  output [C_S_AXI_ID_WIDTH-1:0] s02_axi_rid,
  output [C_S_AXI_DATA_WIDTH-1:0] s02_axi_rdata,
  output [1:0] s02_axi_rresp,
  output s02_axi_rlast,
  output [C_S_AXI_RUSER_WIDTH-1:0] s02_axi_ruser,
  output s02_axi_rvalid,
  // Ports of AXI Manager Bus Interface M00_AXI,
  input m00_axi_awready,
  output [C_M_AXI_ID_WIDTH-1:0] m00_axi_awid,
  output [C_M_AXI_ADDR_WIDTH-1:0] m00_axi_awaddr,
  output [7:0] m00_axi_awlen,
  output [2:0] m00_axi_awsize,
  output [1:0] m00_axi_awburst,
  output m00_axi_awlock,
  output [3:0] m00_axi_awcache,
  output [2:0] m00_axi_awprot,
  output [3:0] m00_axi_awqos,
  output [3:0] m00_axi_awregion,
  output [C_M_AXI_AWUSER_WIDTH-1:0] m00_axi_awuser,
  output m00_axi_awvalid,
  input m00_axi_wready,
  output [C_M_AXI_DATA_WIDTH-1:0] m00_axi_wdata,
  output [C_M_AXI_DATA_WIDTH/8-1:0] m00_axi_wstrb,
  output m00_axi_wlast,
  output [C_M_AXI_WUSER_WIDTH-1:0] m00_axi_wuser,
  output m00_axi_wvalid,
  input [C_M_AXI_ID_WIDTH-1:0] m00_axi_bid,
  input [1:0] m00_axi_bresp,
  input [C_M_AXI_BUSER_WIDTH-1:0] m00_axi_buser,
  input m00_axi_bvalid,
  output m00_axi_bready,
  input m00_axi_arready,
  output [C_M_AXI_ID_WIDTH-1:0] m00_axi_arid,
  output [C_M_AXI_ADDR_WIDTH-1:0] m00_axi_araddr,
  output [7:0] m00_axi_arlen,
  output [2:0] m00_axi_arsize,
  output [1:0] m00_axi_arburst,
  output m00_axi_arlock,
  output [3:0] m00_axi_arcache,
  output [2:0] m00_axi_arprot,
  output [3:0] m00_axi_arqos,
  output [3:0] m00_axi_arregion,
  output [C_M_AXI_ARUSER_WIDTH-1:0] m00_axi_aruser,
  output m00_axi_arvalid,
  input [C_M_AXI_ID_WIDTH-1:0] m00_axi_rid,
  input [C_M_AXI_DATA_WIDTH-1:0] m00_axi_rdata,
  input [1:0] m00_axi_rresp,
  input m00_axi_rlast,
  input [C_M_AXI_RUSER_WIDTH-1:0] m00_axi_ruser,
  input m00_axi_rvalid,
  output m00_axi_rready,
  output fault0,
  output fault1,
  output fault2
);

  // Pass back response signals
  assign { s00_axi_awready, s01_axi_awready, s02_axi_awready } = { 3{ m00_axi_awready } };
  assign { s00_axi_wready, s01_axi_wready, s02_axi_wready } = { 3{ m00_axi_wready } };
  assign { s00_axi_bid, s01_axi_bid, s02_axi_bid } = { 3{ m00_axi_bid } };
  assign { s00_axi_bresp, s01_axi_bresp, s02_axi_bresp } = { 3{ m00_axi_bresp } };
  assign { s00_axi_buser, s01_axi_buser, s02_axi_buser } = { 3{ m00_axi_buser } };
  assign { s00_axi_bvalid, s01_axi_bvalid, s02_axi_bvalid } = { 3{ m00_axi_bvalid } };
  assign { s00_axi_arready, s01_axi_arready, s02_axi_arready } = { 3{ m00_axi_arready } };
  assign { s00_axi_rid, s01_axi_rid, s02_axi_rid } = { 3{ m00_axi_rid } };
  assign { s00_axi_rdata, s01_axi_rdata, s02_axi_rdata } = { 3{ m00_axi_rdata } };
  assign { s00_axi_rresp, s01_axi_rresp, s02_axi_rresp } = { 3{ m00_axi_rresp } };
  assign { s00_axi_rlast, s01_axi_rlast, s02_axi_rlast } = { 3{ m00_axi_rlast } };
  assign { s00_axi_ruser, s01_axi_ruser, s02_axi_ruser } = { 3{ m00_axi_ruser } };
  assign { s00_axi_rvalid, s01_axi_rvalid, s02_axi_rvalid } = { 3{ m00_axi_rvalid } };
  // Voting logic
  assign m00_axi_awid = s00_axi_awid & s01_axi_awid | s01_axi_awid & s02_axi_awid | s00_axi_awid & s02_axi_awid;
  assign m00_axi_awaddr = s00_axi_awaddr & s01_axi_awaddr | s01_axi_awaddr & s02_axi_awaddr | s00_axi_awaddr & s02_axi_awaddr;
  assign m00_axi_awlen = s00_axi_awlen & s01_axi_awlen | s01_axi_awlen & s02_axi_awlen | s00_axi_awlen & s02_axi_awlen;
  assign m00_axi_awsize = s00_axi_awsize & s01_axi_awsize | s01_axi_awsize & s02_axi_awsize | s00_axi_awsize & s02_axi_awsize;
  assign m00_axi_awburst = s00_axi_awburst & s01_axi_awburst | s01_axi_awburst & s02_axi_awburst | s00_axi_awburst & s02_axi_awburst;
  assign m00_axi_awlock = s00_axi_awlock & s01_axi_awlock | s01_axi_awlock & s02_axi_awlock | s00_axi_awlock & s02_axi_awlock;
  assign m00_axi_awcache = s00_axi_awcache & s01_axi_awcache | s01_axi_awcache & s02_axi_awcache | s00_axi_awcache & s02_axi_awcache;
  assign m00_axi_awprot = s00_axi_awprot & s01_axi_awprot | s01_axi_awprot & s02_axi_awprot | s00_axi_awprot & s02_axi_awprot;
  assign m00_axi_awqos = s00_axi_awqos & s01_axi_awqos | s01_axi_awqos & s02_axi_awqos | s00_axi_awqos & s02_axi_awqos;
  assign m00_axi_awregion = s00_axi_awregion & s01_axi_awregion | s01_axi_awregion & s02_axi_awregion | s00_axi_awregion & s02_axi_awregion;
  assign m00_axi_awuser = s00_axi_awuser & s01_axi_awuser | s01_axi_awuser & s02_axi_awuser | s00_axi_awuser & s02_axi_awuser;
  assign m00_axi_awvalid = s00_axi_awvalid & s01_axi_awvalid | s01_axi_awvalid & s02_axi_awvalid | s00_axi_awvalid & s02_axi_awvalid;
  assign m00_axi_wdata = s00_axi_wdata & s01_axi_wdata | s01_axi_wdata & s02_axi_wdata | s00_axi_wdata & s02_axi_wdata;
  assign m00_axi_wstrb = s00_axi_wstrb & s01_axi_wstrb | s01_axi_wstrb & s02_axi_wstrb | s00_axi_wstrb & s02_axi_wstrb;
  assign m00_axi_wlast = s00_axi_wlast & s01_axi_wlast | s01_axi_wlast & s02_axi_wlast | s00_axi_wlast & s02_axi_wlast;
  assign m00_axi_wuser = s00_axi_wuser & s01_axi_wuser | s01_axi_wuser & s02_axi_wuser | s00_axi_wuser & s02_axi_wuser;
  assign m00_axi_wvalid = s00_axi_wvalid & s01_axi_wvalid | s01_axi_wvalid & s02_axi_wvalid | s00_axi_wvalid & s02_axi_wvalid;
  assign m00_axi_bready = s00_axi_bready & s01_axi_bready | s01_axi_bready & s02_axi_bready | s00_axi_bready & s02_axi_bready;
  assign m00_axi_arid = s00_axi_arid & s01_axi_arid | s01_axi_arid & s02_axi_arid | s00_axi_arid & s02_axi_arid;
  assign m00_axi_araddr = s00_axi_araddr & s01_axi_araddr | s01_axi_araddr & s02_axi_araddr | s00_axi_araddr & s02_axi_araddr;
  assign m00_axi_arlen = s00_axi_arlen & s01_axi_arlen | s01_axi_arlen & s02_axi_arlen | s00_axi_arlen & s02_axi_arlen;
  assign m00_axi_arsize = s00_axi_arsize & s01_axi_arsize | s01_axi_arsize & s02_axi_arsize | s00_axi_arsize & s02_axi_arsize;
  assign m00_axi_arburst = s00_axi_arburst & s01_axi_arburst | s01_axi_arburst & s02_axi_arburst | s00_axi_arburst & s02_axi_arburst;
  assign m00_axi_arlock = s00_axi_arlock & s01_axi_arlock | s01_axi_arlock & s02_axi_arlock | s00_axi_arlock & s02_axi_arlock;
  assign m00_axi_arcache = s00_axi_arcache & s01_axi_arcache | s01_axi_arcache & s02_axi_arcache | s00_axi_arcache & s02_axi_arcache;
  assign m00_axi_arprot = s00_axi_arprot & s01_axi_arprot | s01_axi_arprot & s02_axi_arprot | s00_axi_arprot & s02_axi_arprot;
  assign m00_axi_arqos = s00_axi_arqos & s01_axi_arqos | s01_axi_arqos & s02_axi_arqos | s00_axi_arqos & s02_axi_arqos;
  assign m00_axi_arregion = s00_axi_arregion & s01_axi_arregion | s01_axi_arregion & s02_axi_arregion | s00_axi_arregion & s02_axi_arregion;
  assign m00_axi_aruser = s00_axi_aruser & s01_axi_aruser | s01_axi_aruser & s02_axi_aruser | s00_axi_aruser & s02_axi_aruser;
  assign m00_axi_arvalid = s00_axi_arvalid & s01_axi_arvalid | s01_axi_arvalid & s02_axi_arvalid | s00_axi_arvalid & s02_axi_arvalid;
  assign m00_axi_rready = s00_axi_rready & s01_axi_rready | s01_axi_rready & s02_axi_rready | s00_axi_rready & s02_axi_rready;
  // Fault detection logic
  wire fault0_awid;
  wire fault1_awid;
  wire fault2_awid;
  assign fault0_awid = (s00_axi_awid ^ s01_axi_awid) & ((s00_axi_awid ^ s02_axi_awid) & ~(s01_axi_awid ^ s02_axi_awid));
  assign fault1_awid = (s01_axi_awid ^ s00_axi_awid) & ((s01_axi_awid ^ s02_axi_awid) & ~(s00_axi_awid ^ s02_axi_awid));
  assign fault2_awid = (s02_axi_awid ^ s00_axi_awid) & ((s02_axi_awid ^ s01_axi_awid) & ~(s00_axi_awid ^ s01_axi_awid));
  wire fault0_awaddr;
  wire fault1_awaddr;
  wire fault2_awaddr;
  assign fault0_awaddr = (s00_axi_awaddr ^ s01_axi_awaddr) & ((s00_axi_awaddr ^ s02_axi_awaddr) & ~(s01_axi_awaddr ^ s02_axi_awaddr));
  assign fault1_awaddr = (s01_axi_awaddr ^ s00_axi_awaddr) & ((s01_axi_awaddr ^ s02_axi_awaddr) & ~(s00_axi_awaddr ^ s02_axi_awaddr));
  assign fault2_awaddr = (s02_axi_awaddr ^ s00_axi_awaddr) & ((s02_axi_awaddr ^ s01_axi_awaddr) & ~(s00_axi_awaddr ^ s01_axi_awaddr));
  wire fault0_awlen;
  wire fault1_awlen;
  wire fault2_awlen;
  assign fault0_awlen = (s00_axi_awlen ^ s01_axi_awlen) & ((s00_axi_awlen ^ s02_axi_awlen) & ~(s01_axi_awlen ^ s02_axi_awlen));
  assign fault1_awlen = (s01_axi_awlen ^ s00_axi_awlen) & ((s01_axi_awlen ^ s02_axi_awlen) & ~(s00_axi_awlen ^ s02_axi_awlen));
  assign fault2_awlen = (s02_axi_awlen ^ s00_axi_awlen) & ((s02_axi_awlen ^ s01_axi_awlen) & ~(s00_axi_awlen ^ s01_axi_awlen));
  wire fault0_awsize;
  wire fault1_awsize;
  wire fault2_awsize;
  assign fault0_awsize = (s00_axi_awsize ^ s01_axi_awsize) & ((s00_axi_awsize ^ s02_axi_awsize) & ~(s01_axi_awsize ^ s02_axi_awsize));
  assign fault1_awsize = (s01_axi_awsize ^ s00_axi_awsize) & ((s01_axi_awsize ^ s02_axi_awsize) & ~(s00_axi_awsize ^ s02_axi_awsize));
  assign fault2_awsize = (s02_axi_awsize ^ s00_axi_awsize) & ((s02_axi_awsize ^ s01_axi_awsize) & ~(s00_axi_awsize ^ s01_axi_awsize));
  wire fault0_awburst;
  wire fault1_awburst;
  wire fault2_awburst;
  assign fault0_awburst = (s00_axi_awburst ^ s01_axi_awburst) & ((s00_axi_awburst ^ s02_axi_awburst) & ~(s01_axi_awburst ^ s02_axi_awburst));
  assign fault1_awburst = (s01_axi_awburst ^ s00_axi_awburst) & ((s01_axi_awburst ^ s02_axi_awburst) & ~(s00_axi_awburst ^ s02_axi_awburst));
  assign fault2_awburst = (s02_axi_awburst ^ s00_axi_awburst) & ((s02_axi_awburst ^ s01_axi_awburst) & ~(s00_axi_awburst ^ s01_axi_awburst));
  wire fault0_awlock;
  wire fault1_awlock;
  wire fault2_awlock;
  assign fault0_awlock = (s00_axi_awlock ^ s01_axi_awlock) & ((s00_axi_awlock ^ s02_axi_awlock) & ~(s01_axi_awlock ^ s02_axi_awlock));
  assign fault1_awlock = (s01_axi_awlock ^ s00_axi_awlock) & ((s01_axi_awlock ^ s02_axi_awlock) & ~(s00_axi_awlock ^ s02_axi_awlock));
  assign fault2_awlock = (s02_axi_awlock ^ s00_axi_awlock) & ((s02_axi_awlock ^ s01_axi_awlock) & ~(s00_axi_awlock ^ s01_axi_awlock));
  wire fault0_awcache;
  wire fault1_awcache;
  wire fault2_awcache;
  assign fault0_awcache = (s00_axi_awcache ^ s01_axi_awcache) & ((s00_axi_awcache ^ s02_axi_awcache) & ~(s01_axi_awcache ^ s02_axi_awcache));
  assign fault1_awcache = (s01_axi_awcache ^ s00_axi_awcache) & ((s01_axi_awcache ^ s02_axi_awcache) & ~(s00_axi_awcache ^ s02_axi_awcache));
  assign fault2_awcache = (s02_axi_awcache ^ s00_axi_awcache) & ((s02_axi_awcache ^ s01_axi_awcache) & ~(s00_axi_awcache ^ s01_axi_awcache));
  wire fault0_awprot;
  wire fault1_awprot;
  wire fault2_awprot;
  assign fault0_awprot = (s00_axi_awprot ^ s01_axi_awprot) & ((s00_axi_awprot ^ s02_axi_awprot) & ~(s01_axi_awprot ^ s02_axi_awprot));
  assign fault1_awprot = (s01_axi_awprot ^ s00_axi_awprot) & ((s01_axi_awprot ^ s02_axi_awprot) & ~(s00_axi_awprot ^ s02_axi_awprot));
  assign fault2_awprot = (s02_axi_awprot ^ s00_axi_awprot) & ((s02_axi_awprot ^ s01_axi_awprot) & ~(s00_axi_awprot ^ s01_axi_awprot));
  wire fault0_awqos;
  wire fault1_awqos;
  wire fault2_awqos;
  assign fault0_awqos = (s00_axi_awqos ^ s01_axi_awqos) & ((s00_axi_awqos ^ s02_axi_awqos) & ~(s01_axi_awqos ^ s02_axi_awqos));
  assign fault1_awqos = (s01_axi_awqos ^ s00_axi_awqos) & ((s01_axi_awqos ^ s02_axi_awqos) & ~(s00_axi_awqos ^ s02_axi_awqos));
  assign fault2_awqos = (s02_axi_awqos ^ s00_axi_awqos) & ((s02_axi_awqos ^ s01_axi_awqos) & ~(s00_axi_awqos ^ s01_axi_awqos));
  wire fault0_awregion;
  wire fault1_awregion;
  wire fault2_awregion;
  assign fault0_awregion = (s00_axi_awregion ^ s01_axi_awregion) & ((s00_axi_awregion ^ s02_axi_awregion) & ~(s01_axi_awregion ^ s02_axi_awregion));
  assign fault1_awregion = (s01_axi_awregion ^ s00_axi_awregion) & ((s01_axi_awregion ^ s02_axi_awregion) & ~(s00_axi_awregion ^ s02_axi_awregion));
  assign fault2_awregion = (s02_axi_awregion ^ s00_axi_awregion) & ((s02_axi_awregion ^ s01_axi_awregion) & ~(s00_axi_awregion ^ s01_axi_awregion));
  wire fault0_awuser;
  wire fault1_awuser;
  wire fault2_awuser;
  assign fault0_awuser = (s00_axi_awuser ^ s01_axi_awuser) & ((s00_axi_awuser ^ s02_axi_awuser) & ~(s01_axi_awuser ^ s02_axi_awuser));
  assign fault1_awuser = (s01_axi_awuser ^ s00_axi_awuser) & ((s01_axi_awuser ^ s02_axi_awuser) & ~(s00_axi_awuser ^ s02_axi_awuser));
  assign fault2_awuser = (s02_axi_awuser ^ s00_axi_awuser) & ((s02_axi_awuser ^ s01_axi_awuser) & ~(s00_axi_awuser ^ s01_axi_awuser));
  wire fault0_awvalid;
  wire fault1_awvalid;
  wire fault2_awvalid;
  assign fault0_awvalid = (s00_axi_awvalid ^ s01_axi_awvalid) & ((s00_axi_awvalid ^ s02_axi_awvalid) & ~(s01_axi_awvalid ^ s02_axi_awvalid));
  assign fault1_awvalid = (s01_axi_awvalid ^ s00_axi_awvalid) & ((s01_axi_awvalid ^ s02_axi_awvalid) & ~(s00_axi_awvalid ^ s02_axi_awvalid));
  assign fault2_awvalid = (s02_axi_awvalid ^ s00_axi_awvalid) & ((s02_axi_awvalid ^ s01_axi_awvalid) & ~(s00_axi_awvalid ^ s01_axi_awvalid));
  wire fault0_wdata;
  wire fault1_wdata;
  wire fault2_wdata;
  assign fault0_wdata = (s00_axi_wdata ^ s01_axi_wdata) & ((s00_axi_wdata ^ s02_axi_wdata) & ~(s01_axi_wdata ^ s02_axi_wdata));
  assign fault1_wdata = (s01_axi_wdata ^ s00_axi_wdata) & ((s01_axi_wdata ^ s02_axi_wdata) & ~(s00_axi_wdata ^ s02_axi_wdata));
  assign fault2_wdata = (s02_axi_wdata ^ s00_axi_wdata) & ((s02_axi_wdata ^ s01_axi_wdata) & ~(s00_axi_wdata ^ s01_axi_wdata));
  wire fault0_wstrb;
  wire fault1_wstrb;
  wire fault2_wstrb;
  assign fault0_wstrb = (s00_axi_wstrb ^ s01_axi_wstrb) & ((s00_axi_wstrb ^ s02_axi_wstrb) & ~(s01_axi_wstrb ^ s02_axi_wstrb));
  assign fault1_wstrb = (s01_axi_wstrb ^ s00_axi_wstrb) & ((s01_axi_wstrb ^ s02_axi_wstrb) & ~(s00_axi_wstrb ^ s02_axi_wstrb));
  assign fault2_wstrb = (s02_axi_wstrb ^ s00_axi_wstrb) & ((s02_axi_wstrb ^ s01_axi_wstrb) & ~(s00_axi_wstrb ^ s01_axi_wstrb));
  wire fault0_wlast;
  wire fault1_wlast;
  wire fault2_wlast;
  assign fault0_wlast = (s00_axi_wlast ^ s01_axi_wlast) & ((s00_axi_wlast ^ s02_axi_wlast) & ~(s01_axi_wlast ^ s02_axi_wlast));
  assign fault1_wlast = (s01_axi_wlast ^ s00_axi_wlast) & ((s01_axi_wlast ^ s02_axi_wlast) & ~(s00_axi_wlast ^ s02_axi_wlast));
  assign fault2_wlast = (s02_axi_wlast ^ s00_axi_wlast) & ((s02_axi_wlast ^ s01_axi_wlast) & ~(s00_axi_wlast ^ s01_axi_wlast));
  wire fault0_wuser;
  wire fault1_wuser;
  wire fault2_wuser;
  assign fault0_wuser = (s00_axi_wuser ^ s01_axi_wuser) & ((s00_axi_wuser ^ s02_axi_wuser) & ~(s01_axi_wuser ^ s02_axi_wuser));
  assign fault1_wuser = (s01_axi_wuser ^ s00_axi_wuser) & ((s01_axi_wuser ^ s02_axi_wuser) & ~(s00_axi_wuser ^ s02_axi_wuser));
  assign fault2_wuser = (s02_axi_wuser ^ s00_axi_wuser) & ((s02_axi_wuser ^ s01_axi_wuser) & ~(s00_axi_wuser ^ s01_axi_wuser));
  wire fault0_wvalid;
  wire fault1_wvalid;
  wire fault2_wvalid;
  assign fault0_wvalid = (s00_axi_wvalid ^ s01_axi_wvalid) & ((s00_axi_wvalid ^ s02_axi_wvalid) & ~(s01_axi_wvalid ^ s02_axi_wvalid));
  assign fault1_wvalid = (s01_axi_wvalid ^ s00_axi_wvalid) & ((s01_axi_wvalid ^ s02_axi_wvalid) & ~(s00_axi_wvalid ^ s02_axi_wvalid));
  assign fault2_wvalid = (s02_axi_wvalid ^ s00_axi_wvalid) & ((s02_axi_wvalid ^ s01_axi_wvalid) & ~(s00_axi_wvalid ^ s01_axi_wvalid));
  wire fault0_bready;
  wire fault1_bready;
  wire fault2_bready;
  assign fault0_bready = (s00_axi_bready ^ s01_axi_bready) & ((s00_axi_bready ^ s02_axi_bready) & ~(s01_axi_bready ^ s02_axi_bready));
  assign fault1_bready = (s01_axi_bready ^ s00_axi_bready) & ((s01_axi_bready ^ s02_axi_bready) & ~(s00_axi_bready ^ s02_axi_bready));
  assign fault2_bready = (s02_axi_bready ^ s00_axi_bready) & ((s02_axi_bready ^ s01_axi_bready) & ~(s00_axi_bready ^ s01_axi_bready));
  wire fault0_arid;
  wire fault1_arid;
  wire fault2_arid;
  assign fault0_arid = (s00_axi_arid ^ s01_axi_arid) & ((s00_axi_arid ^ s02_axi_arid) & ~(s01_axi_arid ^ s02_axi_arid));
  assign fault1_arid = (s01_axi_arid ^ s00_axi_arid) & ((s01_axi_arid ^ s02_axi_arid) & ~(s00_axi_arid ^ s02_axi_arid));
  assign fault2_arid = (s02_axi_arid ^ s00_axi_arid) & ((s02_axi_arid ^ s01_axi_arid) & ~(s00_axi_arid ^ s01_axi_arid));
  wire fault0_araddr;
  wire fault1_araddr;
  wire fault2_araddr;
  assign fault0_araddr = (s00_axi_araddr ^ s01_axi_araddr) & ((s00_axi_araddr ^ s02_axi_araddr) & ~(s01_axi_araddr ^ s02_axi_araddr));
  assign fault1_araddr = (s01_axi_araddr ^ s00_axi_araddr) & ((s01_axi_araddr ^ s02_axi_araddr) & ~(s00_axi_araddr ^ s02_axi_araddr));
  assign fault2_araddr = (s02_axi_araddr ^ s00_axi_araddr) & ((s02_axi_araddr ^ s01_axi_araddr) & ~(s00_axi_araddr ^ s01_axi_araddr));
  wire fault0_arlen;
  wire fault1_arlen;
  wire fault2_arlen;
  assign fault0_arlen = (s00_axi_arlen ^ s01_axi_arlen) & ((s00_axi_arlen ^ s02_axi_arlen) & ~(s01_axi_arlen ^ s02_axi_arlen));
  assign fault1_arlen = (s01_axi_arlen ^ s00_axi_arlen) & ((s01_axi_arlen ^ s02_axi_arlen) & ~(s00_axi_arlen ^ s02_axi_arlen));
  assign fault2_arlen = (s02_axi_arlen ^ s00_axi_arlen) & ((s02_axi_arlen ^ s01_axi_arlen) & ~(s00_axi_arlen ^ s01_axi_arlen));
  wire fault0_arsize;
  wire fault1_arsize;
  wire fault2_arsize;
  assign fault0_arsize = (s00_axi_arsize ^ s01_axi_arsize) & ((s00_axi_arsize ^ s02_axi_arsize) & ~(s01_axi_arsize ^ s02_axi_arsize));
  assign fault1_arsize = (s01_axi_arsize ^ s00_axi_arsize) & ((s01_axi_arsize ^ s02_axi_arsize) & ~(s00_axi_arsize ^ s02_axi_arsize));
  assign fault2_arsize = (s02_axi_arsize ^ s00_axi_arsize) & ((s02_axi_arsize ^ s01_axi_arsize) & ~(s00_axi_arsize ^ s01_axi_arsize));
  wire fault0_arburst;
  wire fault1_arburst;
  wire fault2_arburst;
  assign fault0_arburst = (s00_axi_arburst ^ s01_axi_arburst) & ((s00_axi_arburst ^ s02_axi_arburst) & ~(s01_axi_arburst ^ s02_axi_arburst));
  assign fault1_arburst = (s01_axi_arburst ^ s00_axi_arburst) & ((s01_axi_arburst ^ s02_axi_arburst) & ~(s00_axi_arburst ^ s02_axi_arburst));
  assign fault2_arburst = (s02_axi_arburst ^ s00_axi_arburst) & ((s02_axi_arburst ^ s01_axi_arburst) & ~(s00_axi_arburst ^ s01_axi_arburst));
  wire fault0_arlock;
  wire fault1_arlock;
  wire fault2_arlock;
  assign fault0_arlock = (s00_axi_arlock ^ s01_axi_arlock) & ((s00_axi_arlock ^ s02_axi_arlock) & ~(s01_axi_arlock ^ s02_axi_arlock));
  assign fault1_arlock = (s01_axi_arlock ^ s00_axi_arlock) & ((s01_axi_arlock ^ s02_axi_arlock) & ~(s00_axi_arlock ^ s02_axi_arlock));
  assign fault2_arlock = (s02_axi_arlock ^ s00_axi_arlock) & ((s02_axi_arlock ^ s01_axi_arlock) & ~(s00_axi_arlock ^ s01_axi_arlock));
  wire fault0_arcache;
  wire fault1_arcache;
  wire fault2_arcache;
  assign fault0_arcache = (s00_axi_arcache ^ s01_axi_arcache) & ((s00_axi_arcache ^ s02_axi_arcache) & ~(s01_axi_arcache ^ s02_axi_arcache));
  assign fault1_arcache = (s01_axi_arcache ^ s00_axi_arcache) & ((s01_axi_arcache ^ s02_axi_arcache) & ~(s00_axi_arcache ^ s02_axi_arcache));
  assign fault2_arcache = (s02_axi_arcache ^ s00_axi_arcache) & ((s02_axi_arcache ^ s01_axi_arcache) & ~(s00_axi_arcache ^ s01_axi_arcache));
  wire fault0_arprot;
  wire fault1_arprot;
  wire fault2_arprot;
  assign fault0_arprot = (s00_axi_arprot ^ s01_axi_arprot) & ((s00_axi_arprot ^ s02_axi_arprot) & ~(s01_axi_arprot ^ s02_axi_arprot));
  assign fault1_arprot = (s01_axi_arprot ^ s00_axi_arprot) & ((s01_axi_arprot ^ s02_axi_arprot) & ~(s00_axi_arprot ^ s02_axi_arprot));
  assign fault2_arprot = (s02_axi_arprot ^ s00_axi_arprot) & ((s02_axi_arprot ^ s01_axi_arprot) & ~(s00_axi_arprot ^ s01_axi_arprot));
  wire fault0_arqos;
  wire fault1_arqos;
  wire fault2_arqos;
  assign fault0_arqos = (s00_axi_arqos ^ s01_axi_arqos) & ((s00_axi_arqos ^ s02_axi_arqos) & ~(s01_axi_arqos ^ s02_axi_arqos));
  assign fault1_arqos = (s01_axi_arqos ^ s00_axi_arqos) & ((s01_axi_arqos ^ s02_axi_arqos) & ~(s00_axi_arqos ^ s02_axi_arqos));
  assign fault2_arqos = (s02_axi_arqos ^ s00_axi_arqos) & ((s02_axi_arqos ^ s01_axi_arqos) & ~(s00_axi_arqos ^ s01_axi_arqos));
  wire fault0_arregion;
  wire fault1_arregion;
  wire fault2_arregion;
  assign fault0_arregion = (s00_axi_arregion ^ s01_axi_arregion) & ((s00_axi_arregion ^ s02_axi_arregion) & ~(s01_axi_arregion ^ s02_axi_arregion));
  assign fault1_arregion = (s01_axi_arregion ^ s00_axi_arregion) & ((s01_axi_arregion ^ s02_axi_arregion) & ~(s00_axi_arregion ^ s02_axi_arregion));
  assign fault2_arregion = (s02_axi_arregion ^ s00_axi_arregion) & ((s02_axi_arregion ^ s01_axi_arregion) & ~(s00_axi_arregion ^ s01_axi_arregion));
  wire fault0_aruser;
  wire fault1_aruser;
  wire fault2_aruser;
  assign fault0_aruser = (s00_axi_aruser ^ s01_axi_aruser) & ((s00_axi_aruser ^ s02_axi_aruser) & ~(s01_axi_aruser ^ s02_axi_aruser));
  assign fault1_aruser = (s01_axi_aruser ^ s00_axi_aruser) & ((s01_axi_aruser ^ s02_axi_aruser) & ~(s00_axi_aruser ^ s02_axi_aruser));
  assign fault2_aruser = (s02_axi_aruser ^ s00_axi_aruser) & ((s02_axi_aruser ^ s01_axi_aruser) & ~(s00_axi_aruser ^ s01_axi_aruser));
  wire fault0_arvalid;
  wire fault1_arvalid;
  wire fault2_arvalid;
  assign fault0_arvalid = (s00_axi_arvalid ^ s01_axi_arvalid) & ((s00_axi_arvalid ^ s02_axi_arvalid) & ~(s01_axi_arvalid ^ s02_axi_arvalid));
  assign fault1_arvalid = (s01_axi_arvalid ^ s00_axi_arvalid) & ((s01_axi_arvalid ^ s02_axi_arvalid) & ~(s00_axi_arvalid ^ s02_axi_arvalid));
  assign fault2_arvalid = (s02_axi_arvalid ^ s00_axi_arvalid) & ((s02_axi_arvalid ^ s01_axi_arvalid) & ~(s00_axi_arvalid ^ s01_axi_arvalid));
  wire fault0_rready;
  wire fault1_rready;
  wire fault2_rready;
  assign fault0_rready = (s00_axi_rready ^ s01_axi_rready) & ((s00_axi_rready ^ s02_axi_rready) & ~(s01_axi_rready ^ s02_axi_rready));
  assign fault1_rready = (s01_axi_rready ^ s00_axi_rready) & ((s01_axi_rready ^ s02_axi_rready) & ~(s00_axi_rready ^ s02_axi_rready));
  assign fault2_rready = (s02_axi_rready ^ s00_axi_rready) & ((s02_axi_rready ^ s01_axi_rready) & ~(s00_axi_rready ^ s01_axi_rready));
  assign fault0 = fault0_awid | fault0_awaddr | (fault0_awlen | fault0_awsize) | (fault0_awburst | fault0_awlock | (fault0_awcache | fault0_awprot)) | (fault0_awqos | fault0_awregion | (fault0_awuser | fault0_awvalid) | (fault0_wdata | fault0_wstrb | (fault0_wlast | fault0_wuser))) | (fault0_wvalid | fault0_bready | (fault0_arid | fault0_araddr) | (fault0_arlen | fault0_arsize | (fault0_arburst | fault0_arlock)) | (fault0_arcache | fault0_arprot | (fault0_arqos | fault0_arregion) | (fault0_aruser | fault0_arvalid | fault0_rready)));
  assign fault1 = fault1_awid | fault1_awaddr | (fault1_awlen | fault1_awsize) | (fault1_awburst | fault1_awlock | (fault1_awcache | fault1_awprot)) | (fault1_awqos | fault1_awregion | (fault1_awuser | fault1_awvalid) | (fault1_wdata | fault1_wstrb | (fault1_wlast | fault1_wuser))) | (fault1_wvalid | fault1_bready | (fault1_arid | fault1_araddr) | (fault1_arlen | fault1_arsize | (fault1_arburst | fault1_arlock)) | (fault1_arcache | fault1_arprot | (fault1_arqos | fault1_arregion) | (fault1_aruser | fault1_arvalid | fault1_rready)));
  assign fault2 = fault2_awid | fault2_awaddr | (fault2_awlen | fault2_awsize) | (fault2_awburst | fault2_awlock | (fault2_awcache | fault2_awprot)) | (fault2_awqos | fault2_awregion | (fault2_awuser | fault2_awvalid) | (fault2_wdata | fault2_wstrb | (fault2_wlast | fault2_wuser))) | (fault2_wvalid | fault2_bready | (fault2_arid | fault2_araddr) | (fault2_arlen | fault2_arsize | (fault2_arburst | fault2_arlock)) | (fault2_arcache | fault2_arprot | (fault2_arqos | fault2_arregion) | (fault2_aruser | fault2_arvalid | fault2_rready)));

endmodule
