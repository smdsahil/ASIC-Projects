// Testbench for the simple shift register
module day6_tb ();

  reg         clk;              // Clock signal
  reg         reset;            // Reset signal
  reg         x_i;              // Serial input
  wire [3:0] sr_o;              // Output from the shift register

  // Instance of the shift register
  day6 DAY6 (
    .clk(clk),
    .reset(reset),
    .x_i(x_i),
    .sr_o(sr_o)
  );

  // Generate clock signal
  initial begin
    clk = 1'b0;                 // Initialize clock
    forever begin
      #5 clk = ~clk;            // Toggle clock every 5 time units
    end
  end

  // Stimulus
  initial begin
    reset = 1'b1;              // Assert reset
    x_i = 1'b0;                // Initialize input
    @(posedge clk);            // Wait for the rising edge of clk
    reset = 1'b0;              // Deassert reset
    @(posedge clk);            // Wait for the next rising edge

    // Generate random serial input for 16 clock cycles
    for (integer i = 0; i < 16; i = i + 1) begin
      x_i = $random % 2;       // Randomly assign 0 or 1 to x_i
      @(posedge clk);          // Wait for the rising edge of clk
    end
    
    $finish();                 // End the simulation
  end

endmodule
