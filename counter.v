module day5 (
  input     wire        clk,
  input     wire        reset,
  output    reg  [7:0]  cnt_o
);

  reg [7:0] nxt_cnt;

  // Sequential logic to update the counter
  always @(posedge clk or posedge reset) begin
    if (reset)
      cnt_o <= 8'h1;          // Reset counter to 1
    else
      cnt_o <= nxt_cnt;       // Update counter with next count
  end

  // Combinational logic for next count
  always @(*) begin
    nxt_cnt = cnt_o + 8'h2;   // Increment counter by 2
  end

endmodule
