// Testbench for Linear Feedback Shift Register (LFSR)
module day7_tb ();

  reg clk;               // Clock signal
  reg reset;             // Reset signal
  wire [3:0] lfsr_o;     // Output from the LFSR

  // Instantiate the LFSR module
  day7 DAY7 (
    .clk(clk),
    .reset(reset),
    .lfsr_o(lfsr_o)
  );

  // Clock generation
  initial begin
    clk = 1'b0; // Initialize clock to 0
    forever begin
      #5 clk = ~clk; // Toggle clock every 5 time units
    end
  end

  // Test stimulus
  initial begin
    reset = 1'b1; // Apply reset
    @(posedge clk); // Wait for the first clock edge
    reset = 1'b0; // Release reset

    // Run for 32 clock cycles
    for (integer i = 0; i < 32; i = i + 1) begin
      @(posedge clk); // Wait for each clock cycle
      $display("Cycle %0d: LFSR Output = %b", i, lfsr_o); // Print the output at each clock cycle
    end

    $finish(); // End the simulation
  end

endmodule
