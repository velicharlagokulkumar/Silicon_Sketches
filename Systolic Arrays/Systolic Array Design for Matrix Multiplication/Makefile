all: ./src/*.sv ./test/*_tb.sv
	iverilog -g2012 -o Systolic_Array_4x4.vvp ./test/Systolic_Array_4x4_Matrix_Multiplication_tb.sv ./src/Systolic_Array_4x4_Matrix_Multiplication.sv ./src/pe_block.sv 
	vvp Systolic_Array_4x4.vvp
	sudo gtkwave wave_mul.vcd
