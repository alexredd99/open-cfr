
//instance of ICAPE3 
module icap_inst(
  output wire AVAIL,
  output wire [31 :0] O,
  output wire PRDONE,
  input wire CLK,
  input wire CSIB,
  input wire [31 : 0] I,
  input wire RDWRB	
);

   ICAPE3 #(
      .DEVICE_ID(32'h03628093),     // Specifies the pre-programmed Device ID value to be used for simulation
                                    // purposes.
      .ICAP_AUTO_SWITCH("DISABLE"), // Enable switch ICAP using sync word.
      .SIM_CFG_FILE_NAME("NONE")    // Specifies the Raw Bitstream (RBT) file to be parsed by the simulation
                                    // model.
   )
   ICAPE3_inst (
      .AVAIL(AVAIL),     // 1-bit output: Availability status of ICAP.
      .O(O),             // 32-bit output: Configuration data output bus.
      .PRDONE(PRDONE),   // 1-bit output: Indicates completion of Partial Reconfiguration.
      .PRERROR(PRERROR), // 1-bit output: Indicates error during Partial Reconfiguration.
      .CLK(CLK),         // 1-bit input: Clock input.
      .CSIB(CSIB),       // 1-bit input: Active-Low ICAP enable.
      .I(I),             // 32-bit input: Configuration data input bus.
      .RDWRB(RDWRB)      // 1-bit input: Read/Write Select input.
   );

endmodule
