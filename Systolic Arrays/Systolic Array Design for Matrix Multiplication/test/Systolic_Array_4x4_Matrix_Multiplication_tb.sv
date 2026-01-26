// `include "../src/Systolic_Array_4x4_Matrix_Multiplication.sv"

module Systolic_Array_4x4_Matrix_Multiplication_tb ();

 parameter ARRAY_SIZE = 4;
 parameter DW_IN = 8;
 parameter DW_OUT = 2 * DW_IN + $clog2(ARRAY_SIZE);

 logic clk;
 logic rst_n;
  //
 logic signed [DW_IN-1:0] A00, A10, A20, A30;
 logic signed [DW_IN-1:0] B00, B01, B02, B03;

 logic signed [DW_OUT-1:0] C00, C01, C02, C03;
 logic signed [DW_OUT-1:0] C10, C11, C12, C13;
 logic signed [DW_OUT-1:0] C20, C21, C22, C23;
 logic signed [DW_OUT-1:0] C30, C31, C32, C33;

 logic done;

always #5 clk = ~clk; 

Systolic_Array_4x4_Matrix_Multiplication #(
    .ARRAY_SIZE(ARRAY_SIZE),
    .DW_IN(DW_IN),
    .DW_OUT(DW_OUT)
) inst_systolic_array (
    .clk(clk),
    .rst_n(rst_n),
    //
    .A00(A00), .A10(A10), .A20(A20), .A30(A30),
    .B00(B00), .B01(B01), .B02(B02), .B03(B03),
    //
    .C00(C00), .C01(C01), .C02(C02), .C03(C03), 
    .C10(C10), .C11(C11), .C12(C12), .C13(C13),   
    .C20(C20), .C21(C21), .C22(C22), .C23(C23),
    .C30(C30), .C31(C31), .C32(C32), .C33(C33),

    .done(done)
);

initial begin
    clk = 0;
    rst_n = 0;
    A00 = 8'd0; A10 = 8'd0; A20 = 8'd0; A30 = 8'd0;
    B00 = 8'd0; B01 = 8'd0; B02 = 8'd0; B03 = 8'd0;
    #10;
    rst_n = 1;
    # 150 $finish;
end

/*
// Test Vector 1
initial begin
	#13 A00 = 8'hAF;
	    B00 = 8'h63;
	#10 A00 = 8'h9E;
	    B00 = 8'hA3;
	#10 A00 = 8'h6E;
	    B00 = 8'h75;
	#10 A00 = 8'h9F;
	    B00 = 8'h08;
	#10 A00 = 8'h0;
	    B00 = 8'h0;
	#10 A00 = 8'h0;
	    B00 = 8'h0;
	#10 A00 = 8'h0;	
	    B00 = 8'h0;
end

initial begin
	#13 A10 = 8'h0;
	    B01 = 8'h0;
	#10 A10 = 8'hFF;
	    B01 = 8'hD0;
	#10 A10 = 8'h51;
	    B01 = 8'h7B;
	#10 A10 = 8'hB4;
	    B01 = 8'h21;
	#10 A10 = 8'hE0;
	    B01 = 8'h5F;
	#10 A10 = 8'h0;
	    B01 = 8'h0;
	#10 A10 = 8'h0;	
	    B01 = 8'h0;
end

initial begin
	#13 A20 = 8'h0;
	    B02 = 8'h0;
	#10 A20 = 8'h0;
	    B02 = 8'h0;
	#10 A20 = 8'hFA;
	    B02 = 8'h4D;
	#10 A20 = 8'hCB;
	    B02 = 8'hA7;
	#10 A20 = 8'h40;
	    B02 = 8'h1C;
	#10 A20 = 8'h17;
	    B02 = 8'h8F;
	#10 A20 = 8'h0;	
	    B02 = 8'h0;
end

initial begin
	#13 A30 = 8'h0;
	    B03 = 8'h0;
	#10 A30 = 8'h0;
	    B03 = 8'h0;
	#10 A30 = 8'h0;
	    B03 = 8'h0;
	#10 A30 = 8'hD2;
	    B03 = 8'hC4;
	#10 A30 = 8'hAB;
	    B03 = 8'h0F;
	#10 A30 = 8'hFD;
	    B03 = 8'h88;
	#10 A30 = 8'hFB;	
	    B03 = 8'hB1;
  #10 A30 = 8'h0;	
      B03 = 8'h0;
end
*/

// Test Vector 2
initial begin
	#13  A00 = 32'd3;
	    B00 = 32'd12;
	#10 A00 = 32'd2;
	    B00 = 32'd8;
	#10 A00 = 32'd1;
	    B00 = 32'd4;
	#10 A00 = 32'd5;
	    B00 = 32'd6;
	#10 A00 = 32'd0;
	    B00 = 32'd0;
	#10 A00 = 32'd0;
	    B00 = 32'd0;
	#10 A00 = 32'd0;	
	    B00 = 32'd0;
end

initial begin
	#13 A10 = 32'd0;
	    B01 = 32'd0;
	#10 A10 = 32'd7;
	    B01 = 32'd13;
	#10 A10 = 32'd6;
	    B01 = 32'd9;
	#10 A10 = 32'd5;
	    B01 = 32'd5;
	#10 A10 = 32'd4;
	    B01 = 32'd1;
	#10 A10 = 32'd0;
	    B01 = 32'd0;
	#10 A10 = 32'd0;	
	    B01 = 32'd0;
end

initial begin
	#13  A20 = 32'd0;
	    B02 = 32'd0;
	#10 A20 = 32'd0;
	    B02 = 32'd0;
	#10 A20 = 32'd11;
	    B02 = 32'd14;
	#10 A20 = 32'd10;
	    B02 = 32'd10;
	#10 A20 = 32'd9;
	    B02 = 32'd6;
	#10 A20 = 32'd8;
	    B02 = 32'd2;
	#10 A20 = 32'd0;	
	    B02 = 32'd0;
end

initial begin
	#13  A30 = 32'd0;
	    B03 = 32'd0;
	#10 A30 = 32'd0;
	    B03 = 32'd0;
	#10 A30 = 32'd0;
	    B03 = 32'd0;
	#10 A30 = 32'd15;
	    B03 = 32'd15;
	#10 A30 = 32'd14;
	    B03 = 32'd11;
	#10 A30 = 32'd13;
	    B03 = 32'd7;
	#10 A30 = 32'd12;	
	    B03 = 32'd3;
  #10 A30 = 32'd0;	
      B03 = 32'd0;    
end

initial begin
	$dumpfile("wave_mul.vcd");
	$dumpvars(0, Systolic_Array_4x4_Matrix_Multiplication_tb);
end

endmodule