module day5_tb ();

  reg clk;
  reg reset;

  wire [7:0] cnt_o;

  // Instantiate the DUT (Design Under Test)
  day5 DAY5 (
    .clk(clk),
    .reset(reset),
    .cnt_o(cnt_o)
  );

  // Clock generation
  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  // Test stimulus
  initial begin
    clk = 1'b0;               // Initialize clock
    reset = 1'b1;             // Assert reset
    @(posedge clk);           // Wait for clock edge
    @(posedge clk);           // Hold reset for two clock cycles
    reset = 1'b0;             // Deassert reset

    // Let the simulation run for 128 clock cycles
    for (integer i = 0; i < 128; i = i + 1)
      @(posedge clk);         // Wait for clock edge
    
    $finish();                // End simulation
  end

endmodule
