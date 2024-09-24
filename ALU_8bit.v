module day4 (
  input  [7:0]   a_i,   // 8-bit input a_i
  input  [7:0]   b_i,   // 8-bit input b_i
  input  [2:0]   op_i,  // 3-bit opcode input

  output reg [7:0]   alu_o  // 8-bit output for ALU
);

  // Local parameters for ALU operations
  localparam  OP_ADD = 3'b000;
  localparam  OP_SUB = 3'b001;
  localparam  OP_SLL = 3'b010;
  localparam  OP_LSR = 3'b011;
  localparam  OP_AND = 3'b100;
  localparam  OP_OR  = 3'b101;
  localparam  OP_XOR = 3'b110;
  localparam  OP_EQL = 3'b111;

  reg carry;  // Register for carry

  // Combinational logic for ALU operations
  always @* begin  // Use @* for combinational logic
    case (op_i)
      OP_ADD: {carry, alu_o} = a_i + b_i;  // Addition with carry
      OP_SUB: alu_o = a_i - b_i;           // Subtraction
      OP_SLL: alu_o = a_i << b_i[2:0];     // Logical shift left
      OP_LSR: alu_o = a_i >> b_i[2:0];     // Logical shift right
      OP_AND: alu_o = a_i & b_i;           // Bitwise AND
      OP_OR:  alu_o = a_i | b_i;           // Bitwise OR
      OP_XOR: alu_o = a_i ^ b_i;           // Bitwise XOR
      OP_EQL: alu_o = {7'b0, (a_i == b_i)};// Equality check (1 if equal, else 0)
      default: alu_o = 8'b0;               // Default to 0 to avoid latches
    endcase
  end

endmodule
