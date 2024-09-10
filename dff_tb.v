module day15_tb ();

  reg clk;
  reg reset;
  reg d_i;                     // Declare input for day2
  wire q_norst_o, q_syncrst_o, q_asyncrst_o;  // Outputs for day2
  

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
    reset = 1'b1;
    d_i = 1'b0;
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    d_i = 1'b1;
    @(posedge clk);
    @(posedge clk);
    @(negedge clk);
    reset = 1'b1;
    @(posedge clk);
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    @(posedge clk);
    $finish();  // End the simulation
  end

endmodule
