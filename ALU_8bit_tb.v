module day4_tb ();

  reg [7:0] a_i;
  reg [7:0] b_i;
  reg [2:0] op_i;
  wire [7:0] alu_o;

  // Instantiate the ALU module
  day4 DAY4 (
    .a_i(a_i),
    .b_i(b_i),
    .op_i(op_i),
    .alu_o(alu_o)
  );

  // Initial block to drive the stimulus
  initial begin
    for (integer j = 0; j < 3; j = j + 1) begin
      for (integer i = 0; i < 8; i = i + 1) begin
        a_i = $random % 256;  // Generate 8-bit random value for a_i
        b_i = $random % 256;  // Generate 8-bit random value for b_i
        op_i = i[2:0];        // Assign lower 3 bits of i to op_i
        #5;                   // Wait for 5 time units
      end
    end
    $finish;  // End the simulation
  end

endmodule
