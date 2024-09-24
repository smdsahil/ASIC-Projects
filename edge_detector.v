module day3 (
  input      wire    clk,
  input      wire    reset,
  input      wire    a_i,
  output     reg     rising_edge_o,
  output     reg     falling_edge_o
);

  reg a_ff;

  always @(posedge clk or posedge reset) begin
    if (reset)
      a_ff <= 1'b0;
    else
      a_ff <= a_i;
  end

  // Rising edge when delayed signal is 0 but current is 1
  always @(posedge clk) begin
    if (reset) begin
      rising_edge_o <= 1'b0;
      falling_edge_o <= 1'b0;
    end else begin
      rising_edge_o <= ~a_ff & a_i;
      falling_edge_o <= a_ff & ~a_i;
    end
  end

endmodule
