module day3_tb ();

  reg    clk;
  reg    reset;
  reg    a_i;

  wire   rising_edge_o;
  wire   falling_edge_o;

  // Instantiate the day3 module
  day3 DAY3 (
    .clk(clk),
    .reset(reset),
    .a_i(a_i),
    .rising_edge_o(rising_edge_o),
    .falling_edge_o(falling_edge_o)
  );

  // Clock generation
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  // Stimulus
  initial begin
    reset = 1'b1;  // Assert reset initially
    a_i = 1'b1;    // Initialize a_i
    @(posedge clk);
    reset = 1'b0;  // De-assert reset after 1 clock cycle
    @(posedge clk);

    // Apply random stimulus for 32 clock cycles
    repeat (32) begin
      a_i = $random % 2;  // Generate random value for a_i (0 or 1)
      @(posedge clk);
    end

    $finish;  // End the simulation
  end

endmodule
