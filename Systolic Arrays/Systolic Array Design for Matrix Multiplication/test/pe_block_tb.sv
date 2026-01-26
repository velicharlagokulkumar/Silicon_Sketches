module pe_block_tb();

logic clk;
logic rst_n;

logic [31:0] a_in;
logic [31:0] b_in;

logic [31:0] a_out;
logic [31:0] b_out;

logic [63:0] p_out;

pe_block inst_pe (
    .clk(clk),
    .rst_n(rst_n),
    .a_in(a_in),
    .b_in(b_in),
    .a_out(a_out),
    .b_out(b_out),
    .p_out(p_out)
);

always #5 clk = ~clk; 

initial begin
    clk = 0;
    rst_n = 0;
    a_in = 0;
    b_in = 0;
    #10;
    rst_n = 1;
    a_in = 32'd3;
    b_in = 32'd4;
    #10;
    a_in = 32'd0;
    b_in = 32'd0;
    # 100 $finish;
end

initial begin
	$dumpfile("wave.vcd");
	$dumpvars(0, pe_block_tb);
end

endmodule