
//Instance of the ICAPE2 for pynq
module icap_inst(
  input wire CLK,
  input wire CSIB,
  input wire [31:0] I,
  input wire RDWRB,
  output wire [31 : 0] O
    );

   ICAPE2 #(
      .DEVICE_ID(32'h3651093),     // Specifies the pre-programmed Device ID value to be used for simulation
                                  // purposes.
      .ICAP_WIDTH("X32"),         // Specifies the input and output data width.
      .SIM_CFG_FILE_NAME("NONE")  // Specifies the Raw Bitstream (RBT) file to be parsed by the simulation
                                  // model.
   )
   ICAPE2_inst (
      .O(O),         // 32-bit output: Configuration data output bus
      .CLK(CLK),     // 1-bit input: Clock Input
      .CSIB(CSIB),   // 1-bit input: Active-Low ICAP Enable
      .I(I),         // 32-bit input: Configuration data input bus
      .RDWRB(RDWRB)  // 1-bit input: Read/Write Select input
   );

endmodule

