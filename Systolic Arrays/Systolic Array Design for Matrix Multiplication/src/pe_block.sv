module pe_block #(
    parameter ARRAY_SIZE = 4,
    parameter DW_IN = 8,
    parameter DW_OUT = 2*DW_IN + $clog2(ARRAY_SIZE)
)(
    input logic clk,
    input logic rst_n,

    input logic [DW_IN-1:0] a_in,
    input logic [DW_IN-1:0] b_in,

    output logic [DW_IN-1:0] a_out,
    output logic [DW_IN-1:0] b_out,

    output logic [DW_OUT-1:0] p_out
);

    logic signed [2*DW_IN-1:0] mult;
    logic signed [DW_OUT-1:0] p_acc;

    always_ff @(posedge clk) begin
        if(~rst_n) begin
            a_out <= 'd0;
            b_out <= 'd0;

            p_acc <= 'd0;
        end
        else begin
            a_out <= a_in;
            b_out <= b_in;

            p_acc <= $signed(p_acc) + $signed(mult);
        end
    end

    assign mult = $signed(a_in) * $signed(b_in);
    assign p_out = p_acc;

endmodule