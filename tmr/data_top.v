
module TMR_DATA #
(
  // Parameters of AXI Subordinate Bus Interface SXX_AXI,
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
  input s00_interrupt00,
  // Ports of AXI Subordinate Bus Interface S01_AXI,
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
  input s01_interrupt00,
  // Ports of AXI Subordinate Bus Interface S02_AXI,
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
  input s02_interrupt00,
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
  output m00_interrupt00,
  output fault00,
  output fault01,
  output fault02
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
  assign m00_axi_awid = s01_axi_awid & s02_axi_awid | (s00_axi_awid & s01_axi_awid | s00_axi_awid & s02_axi_awid);
  assign m00_axi_awaddr = s01_axi_awaddr & s02_axi_awaddr | (s00_axi_awaddr & s01_axi_awaddr | s00_axi_awaddr & s02_axi_awaddr);
  assign m00_axi_awlen = s01_axi_awlen & s02_axi_awlen | (s00_axi_awlen & s01_axi_awlen | s00_axi_awlen & s02_axi_awlen);
  assign m00_axi_awsize = s01_axi_awsize & s02_axi_awsize | (s00_axi_awsize & s01_axi_awsize | s00_axi_awsize & s02_axi_awsize);
  assign m00_axi_awburst = s01_axi_awburst & s02_axi_awburst | (s00_axi_awburst & s01_axi_awburst | s00_axi_awburst & s02_axi_awburst);
  assign m00_axi_awlock = s01_axi_awlock & s02_axi_awlock | (s00_axi_awlock & s01_axi_awlock | s00_axi_awlock & s02_axi_awlock);
  assign m00_axi_awcache = s01_axi_awcache & s02_axi_awcache | (s00_axi_awcache & s01_axi_awcache | s00_axi_awcache & s02_axi_awcache);
  assign m00_axi_awprot = s01_axi_awprot & s02_axi_awprot | (s00_axi_awprot & s01_axi_awprot | s00_axi_awprot & s02_axi_awprot);
  assign m00_axi_awqos = s01_axi_awqos & s02_axi_awqos | (s00_axi_awqos & s01_axi_awqos | s00_axi_awqos & s02_axi_awqos);
  assign m00_axi_awregion = s01_axi_awregion & s02_axi_awregion | (s00_axi_awregion & s01_axi_awregion | s00_axi_awregion & s02_axi_awregion);
  assign m00_axi_awuser = s01_axi_awuser & s02_axi_awuser | (s00_axi_awuser & s01_axi_awuser | s00_axi_awuser & s02_axi_awuser);
  assign m00_axi_awvalid = s01_axi_awvalid & s02_axi_awvalid | (s00_axi_awvalid & s01_axi_awvalid | s00_axi_awvalid & s02_axi_awvalid);
  assign m00_axi_wdata = s01_axi_wdata & s02_axi_wdata | (s00_axi_wdata & s01_axi_wdata | s00_axi_wdata & s02_axi_wdata);
  assign m00_axi_wstrb = s01_axi_wstrb & s02_axi_wstrb | (s00_axi_wstrb & s01_axi_wstrb | s00_axi_wstrb & s02_axi_wstrb);
  assign m00_axi_wlast = s01_axi_wlast & s02_axi_wlast | (s00_axi_wlast & s01_axi_wlast | s00_axi_wlast & s02_axi_wlast);
  assign m00_axi_wuser = s01_axi_wuser & s02_axi_wuser | (s00_axi_wuser & s01_axi_wuser | s00_axi_wuser & s02_axi_wuser);
  assign m00_axi_wvalid = s01_axi_wvalid & s02_axi_wvalid | (s00_axi_wvalid & s01_axi_wvalid | s00_axi_wvalid & s02_axi_wvalid);
  assign m00_axi_bready = s01_axi_bready & s02_axi_bready | (s00_axi_bready & s01_axi_bready | s00_axi_bready & s02_axi_bready);
  assign m00_axi_arid = s01_axi_arid & s02_axi_arid | (s00_axi_arid & s01_axi_arid | s00_axi_arid & s02_axi_arid);
  assign m00_axi_araddr = s01_axi_araddr & s02_axi_araddr | (s00_axi_araddr & s01_axi_araddr | s00_axi_araddr & s02_axi_araddr);
  assign m00_axi_arlen = s01_axi_arlen & s02_axi_arlen | (s00_axi_arlen & s01_axi_arlen | s00_axi_arlen & s02_axi_arlen);
  assign m00_axi_arsize = s01_axi_arsize & s02_axi_arsize | (s00_axi_arsize & s01_axi_arsize | s00_axi_arsize & s02_axi_arsize);
  assign m00_axi_arburst = s01_axi_arburst & s02_axi_arburst | (s00_axi_arburst & s01_axi_arburst | s00_axi_arburst & s02_axi_arburst);
  assign m00_axi_arlock = s01_axi_arlock & s02_axi_arlock | (s00_axi_arlock & s01_axi_arlock | s00_axi_arlock & s02_axi_arlock);
  assign m00_axi_arcache = s01_axi_arcache & s02_axi_arcache | (s00_axi_arcache & s01_axi_arcache | s00_axi_arcache & s02_axi_arcache);
  assign m00_axi_arprot = s01_axi_arprot & s02_axi_arprot | (s00_axi_arprot & s01_axi_arprot | s00_axi_arprot & s02_axi_arprot);
  assign m00_axi_arqos = s01_axi_arqos & s02_axi_arqos | (s00_axi_arqos & s01_axi_arqos | s00_axi_arqos & s02_axi_arqos);
  assign m00_axi_arregion = s01_axi_arregion & s02_axi_arregion | (s00_axi_arregion & s01_axi_arregion | s00_axi_arregion & s02_axi_arregion);
  assign m00_axi_aruser = s01_axi_aruser & s02_axi_aruser | (s00_axi_aruser & s01_axi_aruser | s00_axi_aruser & s02_axi_aruser);
  assign m00_axi_arvalid = s01_axi_arvalid & s02_axi_arvalid | (s00_axi_arvalid & s01_axi_arvalid | s00_axi_arvalid & s02_axi_arvalid);
  assign m00_axi_rready = s01_axi_rready & s02_axi_rready | (s00_axi_rready & s01_axi_rready | s00_axi_rready & s02_axi_rready);
  assign m00_interrupt00 = s01_interrupt00 & s02_interrupt00 | (s00_interrupt00 & s01_interrupt00 | s00_interrupt00 & s02_interrupt00);
  // Fault detection logic
  wire fault00_awid;
  wire fault01_awid;
  wire fault02_awid;
  assign fault00_awid = (s00_axi_awid ^ s01_axi_awid) & (s00_axi_awid ^ s02_axi_awid) & ~(s01_axi_awid ^ s02_axi_awid);
  assign fault01_awid = (s00_axi_awid ^ s01_axi_awid) & (s01_axi_awid ^ s02_axi_awid) & ~(s00_axi_awid ^ s02_axi_awid);
  assign fault02_awid = (s00_axi_awid ^ s02_axi_awid) & (s01_axi_awid ^ s02_axi_awid) & ~(s00_axi_awid ^ s01_axi_awid);
  wire fault00_awaddr;
  wire fault01_awaddr;
  wire fault02_awaddr;
  assign fault00_awaddr = (s00_axi_awaddr ^ s01_axi_awaddr) & (s00_axi_awaddr ^ s02_axi_awaddr) & ~(s01_axi_awaddr ^ s02_axi_awaddr);
  assign fault01_awaddr = (s00_axi_awaddr ^ s01_axi_awaddr) & (s01_axi_awaddr ^ s02_axi_awaddr) & ~(s00_axi_awaddr ^ s02_axi_awaddr);
  assign fault02_awaddr = (s00_axi_awaddr ^ s02_axi_awaddr) & (s01_axi_awaddr ^ s02_axi_awaddr) & ~(s00_axi_awaddr ^ s01_axi_awaddr);
  wire fault00_awlen;
  wire fault01_awlen;
  wire fault02_awlen;
  assign fault00_awlen = (s00_axi_awlen ^ s01_axi_awlen) & (s00_axi_awlen ^ s02_axi_awlen) & ~(s01_axi_awlen ^ s02_axi_awlen);
  assign fault01_awlen = (s00_axi_awlen ^ s01_axi_awlen) & (s01_axi_awlen ^ s02_axi_awlen) & ~(s00_axi_awlen ^ s02_axi_awlen);
  assign fault02_awlen = (s00_axi_awlen ^ s02_axi_awlen) & (s01_axi_awlen ^ s02_axi_awlen) & ~(s00_axi_awlen ^ s01_axi_awlen);
  wire fault00_awsize;
  wire fault01_awsize;
  wire fault02_awsize;
  assign fault00_awsize = (s00_axi_awsize ^ s01_axi_awsize) & (s00_axi_awsize ^ s02_axi_awsize) & ~(s01_axi_awsize ^ s02_axi_awsize);
  assign fault01_awsize = (s00_axi_awsize ^ s01_axi_awsize) & (s01_axi_awsize ^ s02_axi_awsize) & ~(s00_axi_awsize ^ s02_axi_awsize);
  assign fault02_awsize = (s00_axi_awsize ^ s02_axi_awsize) & (s01_axi_awsize ^ s02_axi_awsize) & ~(s00_axi_awsize ^ s01_axi_awsize);
  wire fault00_awburst;
  wire fault01_awburst;
  wire fault02_awburst;
  assign fault00_awburst = (s00_axi_awburst ^ s01_axi_awburst) & (s00_axi_awburst ^ s02_axi_awburst) & ~(s01_axi_awburst ^ s02_axi_awburst);
  assign fault01_awburst = (s00_axi_awburst ^ s01_axi_awburst) & (s01_axi_awburst ^ s02_axi_awburst) & ~(s00_axi_awburst ^ s02_axi_awburst);
  assign fault02_awburst = (s00_axi_awburst ^ s02_axi_awburst) & (s01_axi_awburst ^ s02_axi_awburst) & ~(s00_axi_awburst ^ s01_axi_awburst);
  wire fault00_awlock;
  wire fault01_awlock;
  wire fault02_awlock;
  assign fault00_awlock = (s00_axi_awlock ^ s01_axi_awlock) & (s00_axi_awlock ^ s02_axi_awlock) & ~(s01_axi_awlock ^ s02_axi_awlock);
  assign fault01_awlock = (s00_axi_awlock ^ s01_axi_awlock) & (s01_axi_awlock ^ s02_axi_awlock) & ~(s00_axi_awlock ^ s02_axi_awlock);
  assign fault02_awlock = (s00_axi_awlock ^ s02_axi_awlock) & (s01_axi_awlock ^ s02_axi_awlock) & ~(s00_axi_awlock ^ s01_axi_awlock);
  wire fault00_awcache;
  wire fault01_awcache;
  wire fault02_awcache;
  assign fault00_awcache = (s00_axi_awcache ^ s01_axi_awcache) & (s00_axi_awcache ^ s02_axi_awcache) & ~(s01_axi_awcache ^ s02_axi_awcache);
  assign fault01_awcache = (s00_axi_awcache ^ s01_axi_awcache) & (s01_axi_awcache ^ s02_axi_awcache) & ~(s00_axi_awcache ^ s02_axi_awcache);
  assign fault02_awcache = (s00_axi_awcache ^ s02_axi_awcache) & (s01_axi_awcache ^ s02_axi_awcache) & ~(s00_axi_awcache ^ s01_axi_awcache);
  wire fault00_awprot;
  wire fault01_awprot;
  wire fault02_awprot;
  assign fault00_awprot = (s00_axi_awprot ^ s01_axi_awprot) & (s00_axi_awprot ^ s02_axi_awprot) & ~(s01_axi_awprot ^ s02_axi_awprot);
  assign fault01_awprot = (s00_axi_awprot ^ s01_axi_awprot) & (s01_axi_awprot ^ s02_axi_awprot) & ~(s00_axi_awprot ^ s02_axi_awprot);
  assign fault02_awprot = (s00_axi_awprot ^ s02_axi_awprot) & (s01_axi_awprot ^ s02_axi_awprot) & ~(s00_axi_awprot ^ s01_axi_awprot);
  wire fault00_awqos;
  wire fault01_awqos;
  wire fault02_awqos;
  assign fault00_awqos = (s00_axi_awqos ^ s01_axi_awqos) & (s00_axi_awqos ^ s02_axi_awqos) & ~(s01_axi_awqos ^ s02_axi_awqos);
  assign fault01_awqos = (s00_axi_awqos ^ s01_axi_awqos) & (s01_axi_awqos ^ s02_axi_awqos) & ~(s00_axi_awqos ^ s02_axi_awqos);
  assign fault02_awqos = (s00_axi_awqos ^ s02_axi_awqos) & (s01_axi_awqos ^ s02_axi_awqos) & ~(s00_axi_awqos ^ s01_axi_awqos);
  wire fault00_awregion;
  wire fault01_awregion;
  wire fault02_awregion;
  assign fault00_awregion = (s00_axi_awregion ^ s01_axi_awregion) & (s00_axi_awregion ^ s02_axi_awregion) & ~(s01_axi_awregion ^ s02_axi_awregion);
  assign fault01_awregion = (s00_axi_awregion ^ s01_axi_awregion) & (s01_axi_awregion ^ s02_axi_awregion) & ~(s00_axi_awregion ^ s02_axi_awregion);
  assign fault02_awregion = (s00_axi_awregion ^ s02_axi_awregion) & (s01_axi_awregion ^ s02_axi_awregion) & ~(s00_axi_awregion ^ s01_axi_awregion);
  wire fault00_awuser;
  wire fault01_awuser;
  wire fault02_awuser;
  assign fault00_awuser = (s00_axi_awuser ^ s01_axi_awuser) & (s00_axi_awuser ^ s02_axi_awuser) & ~(s01_axi_awuser ^ s02_axi_awuser);
  assign fault01_awuser = (s00_axi_awuser ^ s01_axi_awuser) & (s01_axi_awuser ^ s02_axi_awuser) & ~(s00_axi_awuser ^ s02_axi_awuser);
  assign fault02_awuser = (s00_axi_awuser ^ s02_axi_awuser) & (s01_axi_awuser ^ s02_axi_awuser) & ~(s00_axi_awuser ^ s01_axi_awuser);
  wire fault00_awvalid;
  wire fault01_awvalid;
  wire fault02_awvalid;
  assign fault00_awvalid = (s00_axi_awvalid ^ s01_axi_awvalid) & (s00_axi_awvalid ^ s02_axi_awvalid) & ~(s01_axi_awvalid ^ s02_axi_awvalid);
  assign fault01_awvalid = (s00_axi_awvalid ^ s01_axi_awvalid) & (s01_axi_awvalid ^ s02_axi_awvalid) & ~(s00_axi_awvalid ^ s02_axi_awvalid);
  assign fault02_awvalid = (s00_axi_awvalid ^ s02_axi_awvalid) & (s01_axi_awvalid ^ s02_axi_awvalid) & ~(s00_axi_awvalid ^ s01_axi_awvalid);
  wire fault00_wdata;
  wire fault01_wdata;
  wire fault02_wdata;
  assign fault00_wdata = (s00_axi_wdata ^ s01_axi_wdata) & (s00_axi_wdata ^ s02_axi_wdata) & ~(s01_axi_wdata ^ s02_axi_wdata);
  assign fault01_wdata = (s00_axi_wdata ^ s01_axi_wdata) & (s01_axi_wdata ^ s02_axi_wdata) & ~(s00_axi_wdata ^ s02_axi_wdata);
  assign fault02_wdata = (s00_axi_wdata ^ s02_axi_wdata) & (s01_axi_wdata ^ s02_axi_wdata) & ~(s00_axi_wdata ^ s01_axi_wdata);
  wire fault00_wstrb;
  wire fault01_wstrb;
  wire fault02_wstrb;
  assign fault00_wstrb = (s00_axi_wstrb ^ s01_axi_wstrb) & (s00_axi_wstrb ^ s02_axi_wstrb) & ~(s01_axi_wstrb ^ s02_axi_wstrb);
  assign fault01_wstrb = (s00_axi_wstrb ^ s01_axi_wstrb) & (s01_axi_wstrb ^ s02_axi_wstrb) & ~(s00_axi_wstrb ^ s02_axi_wstrb);
  assign fault02_wstrb = (s00_axi_wstrb ^ s02_axi_wstrb) & (s01_axi_wstrb ^ s02_axi_wstrb) & ~(s00_axi_wstrb ^ s01_axi_wstrb);
  wire fault00_wlast;
  wire fault01_wlast;
  wire fault02_wlast;
  assign fault00_wlast = (s00_axi_wlast ^ s01_axi_wlast) & (s00_axi_wlast ^ s02_axi_wlast) & ~(s01_axi_wlast ^ s02_axi_wlast);
  assign fault01_wlast = (s00_axi_wlast ^ s01_axi_wlast) & (s01_axi_wlast ^ s02_axi_wlast) & ~(s00_axi_wlast ^ s02_axi_wlast);
  assign fault02_wlast = (s00_axi_wlast ^ s02_axi_wlast) & (s01_axi_wlast ^ s02_axi_wlast) & ~(s00_axi_wlast ^ s01_axi_wlast);
  wire fault00_wuser;
  wire fault01_wuser;
  wire fault02_wuser;
  assign fault00_wuser = (s00_axi_wuser ^ s01_axi_wuser) & (s00_axi_wuser ^ s02_axi_wuser) & ~(s01_axi_wuser ^ s02_axi_wuser);
  assign fault01_wuser = (s00_axi_wuser ^ s01_axi_wuser) & (s01_axi_wuser ^ s02_axi_wuser) & ~(s00_axi_wuser ^ s02_axi_wuser);
  assign fault02_wuser = (s00_axi_wuser ^ s02_axi_wuser) & (s01_axi_wuser ^ s02_axi_wuser) & ~(s00_axi_wuser ^ s01_axi_wuser);
  wire fault00_wvalid;
  wire fault01_wvalid;
  wire fault02_wvalid;
  assign fault00_wvalid = (s00_axi_wvalid ^ s01_axi_wvalid) & (s00_axi_wvalid ^ s02_axi_wvalid) & ~(s01_axi_wvalid ^ s02_axi_wvalid);
  assign fault01_wvalid = (s00_axi_wvalid ^ s01_axi_wvalid) & (s01_axi_wvalid ^ s02_axi_wvalid) & ~(s00_axi_wvalid ^ s02_axi_wvalid);
  assign fault02_wvalid = (s00_axi_wvalid ^ s02_axi_wvalid) & (s01_axi_wvalid ^ s02_axi_wvalid) & ~(s00_axi_wvalid ^ s01_axi_wvalid);
  wire fault00_bready;
  wire fault01_bready;
  wire fault02_bready;
  assign fault00_bready = (s00_axi_bready ^ s01_axi_bready) & (s00_axi_bready ^ s02_axi_bready) & ~(s01_axi_bready ^ s02_axi_bready);
  assign fault01_bready = (s00_axi_bready ^ s01_axi_bready) & (s01_axi_bready ^ s02_axi_bready) & ~(s00_axi_bready ^ s02_axi_bready);
  assign fault02_bready = (s00_axi_bready ^ s02_axi_bready) & (s01_axi_bready ^ s02_axi_bready) & ~(s00_axi_bready ^ s01_axi_bready);
  wire fault00_arid;
  wire fault01_arid;
  wire fault02_arid;
  assign fault00_arid = (s00_axi_arid ^ s01_axi_arid) & (s00_axi_arid ^ s02_axi_arid) & ~(s01_axi_arid ^ s02_axi_arid);
  assign fault01_arid = (s00_axi_arid ^ s01_axi_arid) & (s01_axi_arid ^ s02_axi_arid) & ~(s00_axi_arid ^ s02_axi_arid);
  assign fault02_arid = (s00_axi_arid ^ s02_axi_arid) & (s01_axi_arid ^ s02_axi_arid) & ~(s00_axi_arid ^ s01_axi_arid);
  wire fault00_araddr;
  wire fault01_araddr;
  wire fault02_araddr;
  assign fault00_araddr = (s00_axi_araddr ^ s01_axi_araddr) & (s00_axi_araddr ^ s02_axi_araddr) & ~(s01_axi_araddr ^ s02_axi_araddr);
  assign fault01_araddr = (s00_axi_araddr ^ s01_axi_araddr) & (s01_axi_araddr ^ s02_axi_araddr) & ~(s00_axi_araddr ^ s02_axi_araddr);
  assign fault02_araddr = (s00_axi_araddr ^ s02_axi_araddr) & (s01_axi_araddr ^ s02_axi_araddr) & ~(s00_axi_araddr ^ s01_axi_araddr);
  wire fault00_arlen;
  wire fault01_arlen;
  wire fault02_arlen;
  assign fault00_arlen = (s00_axi_arlen ^ s01_axi_arlen) & (s00_axi_arlen ^ s02_axi_arlen) & ~(s01_axi_arlen ^ s02_axi_arlen);
  assign fault01_arlen = (s00_axi_arlen ^ s01_axi_arlen) & (s01_axi_arlen ^ s02_axi_arlen) & ~(s00_axi_arlen ^ s02_axi_arlen);
  assign fault02_arlen = (s00_axi_arlen ^ s02_axi_arlen) & (s01_axi_arlen ^ s02_axi_arlen) & ~(s00_axi_arlen ^ s01_axi_arlen);
  wire fault00_arsize;
  wire fault01_arsize;
  wire fault02_arsize;
  assign fault00_arsize = (s00_axi_arsize ^ s01_axi_arsize) & (s00_axi_arsize ^ s02_axi_arsize) & ~(s01_axi_arsize ^ s02_axi_arsize);
  assign fault01_arsize = (s00_axi_arsize ^ s01_axi_arsize) & (s01_axi_arsize ^ s02_axi_arsize) & ~(s00_axi_arsize ^ s02_axi_arsize);
  assign fault02_arsize = (s00_axi_arsize ^ s02_axi_arsize) & (s01_axi_arsize ^ s02_axi_arsize) & ~(s00_axi_arsize ^ s01_axi_arsize);
  wire fault00_arburst;
  wire fault01_arburst;
  wire fault02_arburst;
  assign fault00_arburst = (s00_axi_arburst ^ s01_axi_arburst) & (s00_axi_arburst ^ s02_axi_arburst) & ~(s01_axi_arburst ^ s02_axi_arburst);
  assign fault01_arburst = (s00_axi_arburst ^ s01_axi_arburst) & (s01_axi_arburst ^ s02_axi_arburst) & ~(s00_axi_arburst ^ s02_axi_arburst);
  assign fault02_arburst = (s00_axi_arburst ^ s02_axi_arburst) & (s01_axi_arburst ^ s02_axi_arburst) & ~(s00_axi_arburst ^ s01_axi_arburst);
  wire fault00_arlock;
  wire fault01_arlock;
  wire fault02_arlock;
  assign fault00_arlock = (s00_axi_arlock ^ s01_axi_arlock) & (s00_axi_arlock ^ s02_axi_arlock) & ~(s01_axi_arlock ^ s02_axi_arlock);
  assign fault01_arlock = (s00_axi_arlock ^ s01_axi_arlock) & (s01_axi_arlock ^ s02_axi_arlock) & ~(s00_axi_arlock ^ s02_axi_arlock);
  assign fault02_arlock = (s00_axi_arlock ^ s02_axi_arlock) & (s01_axi_arlock ^ s02_axi_arlock) & ~(s00_axi_arlock ^ s01_axi_arlock);
  wire fault00_arcache;
  wire fault01_arcache;
  wire fault02_arcache;
  assign fault00_arcache = (s00_axi_arcache ^ s01_axi_arcache) & (s00_axi_arcache ^ s02_axi_arcache) & ~(s01_axi_arcache ^ s02_axi_arcache);
  assign fault01_arcache = (s00_axi_arcache ^ s01_axi_arcache) & (s01_axi_arcache ^ s02_axi_arcache) & ~(s00_axi_arcache ^ s02_axi_arcache);
  assign fault02_arcache = (s00_axi_arcache ^ s02_axi_arcache) & (s01_axi_arcache ^ s02_axi_arcache) & ~(s00_axi_arcache ^ s01_axi_arcache);
  wire fault00_arprot;
  wire fault01_arprot;
  wire fault02_arprot;
  assign fault00_arprot = (s00_axi_arprot ^ s01_axi_arprot) & (s00_axi_arprot ^ s02_axi_arprot) & ~(s01_axi_arprot ^ s02_axi_arprot);
  assign fault01_arprot = (s00_axi_arprot ^ s01_axi_arprot) & (s01_axi_arprot ^ s02_axi_arprot) & ~(s00_axi_arprot ^ s02_axi_arprot);
  assign fault02_arprot = (s00_axi_arprot ^ s02_axi_arprot) & (s01_axi_arprot ^ s02_axi_arprot) & ~(s00_axi_arprot ^ s01_axi_arprot);
  wire fault00_arqos;
  wire fault01_arqos;
  wire fault02_arqos;
  assign fault00_arqos = (s00_axi_arqos ^ s01_axi_arqos) & (s00_axi_arqos ^ s02_axi_arqos) & ~(s01_axi_arqos ^ s02_axi_arqos);
  assign fault01_arqos = (s00_axi_arqos ^ s01_axi_arqos) & (s01_axi_arqos ^ s02_axi_arqos) & ~(s00_axi_arqos ^ s02_axi_arqos);
  assign fault02_arqos = (s00_axi_arqos ^ s02_axi_arqos) & (s01_axi_arqos ^ s02_axi_arqos) & ~(s00_axi_arqos ^ s01_axi_arqos);
  wire fault00_arregion;
  wire fault01_arregion;
  wire fault02_arregion;
  assign fault00_arregion = (s00_axi_arregion ^ s01_axi_arregion) & (s00_axi_arregion ^ s02_axi_arregion) & ~(s01_axi_arregion ^ s02_axi_arregion);
  assign fault01_arregion = (s00_axi_arregion ^ s01_axi_arregion) & (s01_axi_arregion ^ s02_axi_arregion) & ~(s00_axi_arregion ^ s02_axi_arregion);
  assign fault02_arregion = (s00_axi_arregion ^ s02_axi_arregion) & (s01_axi_arregion ^ s02_axi_arregion) & ~(s00_axi_arregion ^ s01_axi_arregion);
  wire fault00_aruser;
  wire fault01_aruser;
  wire fault02_aruser;
  assign fault00_aruser = (s00_axi_aruser ^ s01_axi_aruser) & (s00_axi_aruser ^ s02_axi_aruser) & ~(s01_axi_aruser ^ s02_axi_aruser);
  assign fault01_aruser = (s00_axi_aruser ^ s01_axi_aruser) & (s01_axi_aruser ^ s02_axi_aruser) & ~(s00_axi_aruser ^ s02_axi_aruser);
  assign fault02_aruser = (s00_axi_aruser ^ s02_axi_aruser) & (s01_axi_aruser ^ s02_axi_aruser) & ~(s00_axi_aruser ^ s01_axi_aruser);
  wire fault00_arvalid;
  wire fault01_arvalid;
  wire fault02_arvalid;
  assign fault00_arvalid = (s00_axi_arvalid ^ s01_axi_arvalid) & (s00_axi_arvalid ^ s02_axi_arvalid) & ~(s01_axi_arvalid ^ s02_axi_arvalid);
  assign fault01_arvalid = (s00_axi_arvalid ^ s01_axi_arvalid) & (s01_axi_arvalid ^ s02_axi_arvalid) & ~(s00_axi_arvalid ^ s02_axi_arvalid);
  assign fault02_arvalid = (s00_axi_arvalid ^ s02_axi_arvalid) & (s01_axi_arvalid ^ s02_axi_arvalid) & ~(s00_axi_arvalid ^ s01_axi_arvalid);
  wire fault00_rready;
  wire fault01_rready;
  wire fault02_rready;
  assign fault00_rready = (s00_axi_rready ^ s01_axi_rready) & (s00_axi_rready ^ s02_axi_rready) & ~(s01_axi_rready ^ s02_axi_rready);
  assign fault01_rready = (s00_axi_rready ^ s01_axi_rready) & (s01_axi_rready ^ s02_axi_rready) & ~(s00_axi_rready ^ s02_axi_rready);
  assign fault02_rready = (s00_axi_rready ^ s02_axi_rready) & (s01_axi_rready ^ s02_axi_rready) & ~(s00_axi_rready ^ s01_axi_rready);
  wire fault00_interrupt00;
  wire fault01_interrupt00;
  wire fault02_interrupt00;
  assign fault00_interrupt00 = (s00_interrupt00 ^ s01_interrupt00) & (s00_interrupt00 ^ s02_interrupt00) & ~(s01_interrupt00 ^ s02_interrupt00);
  assign fault01_interrupt00 = (s00_interrupt00 ^ s01_interrupt00) & (s01_interrupt00 ^ s02_interrupt00) & ~(s00_interrupt00 ^ s02_interrupt00);
  assign fault02_interrupt00 = (s00_interrupt00 ^ s02_interrupt00) & (s01_interrupt00 ^ s02_interrupt00) & ~(s00_interrupt00 ^ s01_interrupt00);
  assign fault00 = fault00_awid | fault00_awaddr | (fault00_awlen | fault00_awsize) | (fault00_awburst | fault00_awlock | (fault00_awcache | fault00_awprot)) | (fault00_awqos | fault00_awregion | (fault00_awuser | fault00_awvalid) | (fault00_wdata | fault00_wstrb | (fault00_wlast | fault00_wuser))) | (fault00_wvalid | fault00_bready | (fault00_arid | fault00_araddr) | (fault00_arlen | fault00_arsize | (fault00_arburst | fault00_arlock)) | (fault00_arcache | fault00_arprot | (fault00_arqos | fault00_arregion) | (fault00_aruser | fault00_arvalid | (fault00_rready | fault00_interrupt00))));
  assign fault01 = fault01_awid | fault01_awaddr | (fault01_awlen | fault01_awsize) | (fault01_awburst | fault01_awlock | (fault01_awcache | fault01_awprot)) | (fault01_awqos | fault01_awregion | (fault01_awuser | fault01_awvalid) | (fault01_wdata | fault01_wstrb | (fault01_wlast | fault01_wuser))) | (fault01_wvalid | fault01_bready | (fault01_arid | fault01_araddr) | (fault01_arlen | fault01_arsize | (fault01_arburst | fault01_arlock)) | (fault01_arcache | fault01_arprot | (fault01_arqos | fault01_arregion) | (fault01_aruser | fault01_arvalid | (fault01_rready | fault01_interrupt00))));
  assign fault02 = fault02_awid | fault02_awaddr | (fault02_awlen | fault02_awsize) | (fault02_awburst | fault02_awlock | (fault02_awcache | fault02_awprot)) | (fault02_awqos | fault02_awregion | (fault02_awuser | fault02_awvalid) | (fault02_wdata | fault02_wstrb | (fault02_wlast | fault02_wuser))) | (fault02_wvalid | fault02_bready | (fault02_arid | fault02_araddr) | (fault02_arlen | fault02_arsize | (fault02_arburst | fault02_arlock)) | (fault02_arcache | fault02_arprot | (fault02_arqos | fault02_arregion) | (fault02_aruser | fault02_arvalid | (fault02_rready | fault02_interrupt00))));

endmodule
