// `include "pe_block.sv"

module Systolic_Array_4x4_Matrix_Multiplication #(
  parameter ARRAY_SIZE = 4,
  parameter DW_IN = 8,
  parameter DW_OUT = 2*DW_IN + $clog2(ARRAY_SIZE)
)(
  input logic clk,
  input logic rst_n,
  //
  input logic [DW_IN-1:0] A00, A10, A20, A30,
  input logic [DW_IN-1:0] B00, B01, B02, B03,
  //
  output logic [DW_OUT-1:0] C00, C01, C02, C03, 
  output logic [DW_OUT-1:0] C10, C11, C12, C13,   
  output logic [DW_OUT-1:0] C20, C21, C22, C23,
  output logic [DW_OUT-1:0] C30, C31, C32, C33,

  output logic done
);

logic signed [DW_IN-1:0] A00_d, A10_d, A20_d, A30_d;
logic signed [DW_IN-1:0] B00_d, B01_d, B02_d, B03_d;

logic signed [DW_IN-1:0] A00_2d, A10_2d, A20_2d, A30_2d;
logic signed [DW_IN-1:0] B00_2d, B01_2d, B02_2d, B03_2d;

logic signed [DW_IN-1:0] A00_3d, A10_3d, A20_3d, A30_3d;
logic signed [DW_IN-1:0] B00_3d, B01_3d, B02_3d, B03_3d;
  
logic [3:0] count;

pe_block inst_pe_00 (.clk(clk), .rst_n(rst_n), .a_in(A00), .b_in(B00), .a_out(A00_d), .b_out(B00_d), .p_out(C00));

pe_block inst_pe_01 (.clk(clk), .rst_n(rst_n), .a_in(A00_d),  .b_in(B01), .a_out(A00_2d), .b_out(B01_d), .p_out(C01));
pe_block inst_pe_02 (.clk(clk), .rst_n(rst_n), .a_in(A00_2d), .b_in(B02), .a_out(A00_3d), .b_out(B02_d), .p_out(C02));
pe_block inst_pe_03 (.clk(clk), .rst_n(rst_n), .a_in(A00_3d), .b_in(B03), .a_out(),       .b_out(B03_d), .p_out(C03));

pe_block inst_pe_10 (.clk(clk), .rst_n(rst_n), .a_in(A10), .b_in(B00_d),  .a_out(A10_d), .b_out(B00_2d), .p_out(C10));
pe_block inst_pe_20 (.clk(clk), .rst_n(rst_n), .a_in(A20), .b_in(B00_2d), .a_out(A20_d), .b_out(B00_3d), .p_out(C20));
pe_block inst_pe_30 (.clk(clk), .rst_n(rst_n), .a_in(A30), .b_in(B00_3d), .a_out(A30_d), .b_out(),       .p_out(C30));

pe_block inst_pe_11 (.clk(clk), .rst_n(rst_n), .a_in(A10_d),  .b_in(B01_d), .a_out(A10_2d), .b_out(B01_2d), .p_out(C11));
pe_block inst_pe_12 (.clk(clk), .rst_n(rst_n), .a_in(A10_2d), .b_in(B02_d), .a_out(A10_3d), .b_out(B02_2d), .p_out(C12));
pe_block inst_pe_13 (.clk(clk), .rst_n(rst_n), .a_in(A10_3d), .b_in(B03_d), .a_out(),       .b_out(B03_2d), .p_out(C13));

pe_block inst_pe_21 (.clk(clk), .rst_n(rst_n), .a_in(A20_d),  .b_in(B01_2d), .a_out(A20_2d), .b_out(B01_3d), .p_out(C21));
pe_block inst_pe_22 (.clk(clk), .rst_n(rst_n), .a_in(A20_2d), .b_in(B02_2d), .a_out(A20_3d), .b_out(B02_3d), .p_out(C22));
pe_block inst_pe_23 (.clk(clk), .rst_n(rst_n), .a_in(A20_3d), .b_in(B03_2d), .a_out(),       .b_out(B03_3d), .p_out(C23));

pe_block inst_pe_31 (.clk(clk), .rst_n(rst_n), .a_in(A30_d),  .b_in(B01_3d), .a_out(A30_2d), .b_out(),  .p_out(C31));
pe_block inst_pe_32 (.clk(clk), .rst_n(rst_n), .a_in(A30_2d), .b_in(B02_3d), .a_out(A30_3d), .b_out(),  .p_out(C32));
pe_block inst_pe_33 (.clk(clk), .rst_n(rst_n), .a_in(A30_3d), .b_in(B03_3d), .a_out(),       .b_out(),  .p_out(C33));

	always @(posedge clk) begin
		if(~rst_n) begin
			count <= 'd0;
      done <= 'd0;
		end
		else begin
			if(count == 'd9) begin
				count <= 'd0;
        done <= 'd1;
			end
			else begin
				count <= count + 1'b1;
        done <= 'd0;
			end
		end	
	end 

endmodule