module day1_tb ();

  reg [7:0] a_i;
  reg [7:0] b_i;
  reg sel_i;
  wire [7:0] y_o;
  integer i;

  // Instantiate the DUT
  day1 DAY1 (
    .a_i(a_i),
    .b_i(b_i),
    .sel_i(sel_i),
    .y_o(y_o)
  );

  initial begin
    // Initial values to avoid 'Z' state
    a_i = 8'h00;
    b_i = 8'h00;
    sel_i = 1'b0;
    #5;  // Wait for a short time

    for (i = 0; i < 10; i = i + 1) begin
      a_i   = $urandom_range(0, 8'hFF);  // Random 8-bit values for a_i
      b_i   = $urandom_range(0, 8'hFF);  // Random 8-bit values for b_i
      sel_i = $random % 2;               // Random value (0 or 1) for sel_i
      #10;                               // Increased time delay to observe changes
    end
    $finish();
  end

endmodule
