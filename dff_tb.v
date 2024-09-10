module day15_tb ();

  reg clk;
  reg reset;
  reg d_i;                     // Declare input for day2
  wire q_norst_o, q_syncrst_o, q_asyncrst_o;  // Outputs for day2
  integer i;

  // Instantiate the module (connect the correct ports)
  day2 DUT (
    .clk(clk),
    .reset(reset),
    .d_i(d_i),
    .q_norst_o(q_norst_o),
    .q_syncrst_o(q_syncrst_o),
    .q_asyncrst_o(q_asyncrst_o)
  );

  // Clock generation
  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  // Stimulus
  initial begin
    // Initialize
    reset = 1'b0;
    d_i = 1'b1;

    // Test asynchronous reset
    $display("Asynchronous reset test:");
    @(posedge clk);           // Wait for the positive edge of clk
    reset = 1'b1;              // Assert reset at a random time (to test async behavior)
    #3;                        // Hold reset for 3 time units (between clock edges)
    $display("Reset asserted asynchronously at time %0t", $time);
    reset = 1'b0;
    #3              // Deassert reset
    @(posedge clk);            // Wait for one clock edge after deasserting reset
    
    // Test synchronous reset
    d_i = 1'b1;
    $display("Synchronous reset test:");
    @(posedge clk);            // Assert reset on clock edge (sync reset)
    reset = 1'b1;
    #3;
    @(posedge clk);            // Deassert reset on clock edge
    reset = 1'b0;
    #3;

    // Stimulus for 10 cycles
    for (i = 0; i < 10; i = i + 1) begin
      d_i = $urandom_range(0, 1);  // Random 1-bit value for d_i
      @(posedge clk);              // Wait for the next clock cycle
    end

    $finish();  // End the simulation
  end

endmodule
