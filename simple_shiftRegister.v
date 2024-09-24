// Simple shift register
module day6 (
  input     wire        clk,
  input     wire        reset,
  input     wire        x_i,      // Serial input

  output   wire  [3:0]   sr_o     // Output declared as reg to store value
);

  reg [3:0] sr_ff;          // Shift register flip-flop
  reg [3:0] nxt_sr;         // Next state of the shift register

  // Sequential logic for the shift register
  always @(posedge clk or posedge reset) begin
    if (reset)
      sr_ff <= 4'h0;        // Reset shift register to 0
    else
      sr_ff <= nxt_sr;      // Update shift register with next state
  end

  // Combinational logic for the next state
  always @(*) begin
    nxt_sr = {sr_ff[2:0], x_i}; // Shift left and insert x_i at the LSB
  end

  // Connect output directly to the flip-flop value
  assign sr_o = sr_ff;

endmodule
