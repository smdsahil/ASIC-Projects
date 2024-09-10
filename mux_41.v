// 1D Discrete Wavelet Transform (DWT) Verilog code
module DWT #
  (
   parameter N = 8, // Number of input samples (should be power of 2)
   parameter L = 3  // Number of DWT levels (should be log2(N))
  )
  (
   input  wire clk,
   input  wire reset,
   input  wire [N-1:0] x_in,
   output wire [N-1:0] y_out
  );

  reg [N-1:0] x;
  reg [N-1:0] approx;
  reg [N-1:0] detail;
  reg [N-1:0] y;

  always @(posedge clk) begin
    if (reset) begin
      x <= 0;
      y <= 0;
    end else begin
      x <= x_in;
      approx = x;
      detail = x;

      for (integer i = 0; i < N; i = i + 2)
       begin
        detail[i/2] = x[i] - x[i+1];
        approx[i/2] = x[i] + ((detail[i/2] + 1) >> 1);
      end

      y = {approx, detail};
    end
  end

  assign y_out = y;
endmodule
