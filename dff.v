module day2 (
  input  clk, 
  input  reset, 
  input  d_i,

  output reg q_norst_o,      // Declare output as reg since it's driven inside an always block
  output reg q_syncrst_o,    // Same for these signals
  output reg q_asyncrst_o
);

  // No reset
  always @(posedge clk) begin
    q_norst_o <= d_i;
  end

  // Synchronous reset
  always @(posedge clk) begin
    if (reset)
      q_syncrst_o <= 1'b0;
    else
      q_syncrst_o <= d_i;
  end

  // Asynchronous reset
  always @(posedge clk or posedge reset) begin
    if (reset)
      q_asyncrst_o <= 1'b0;
    else
      q_asyncrst_o <= d_i;
  end

endmodule
