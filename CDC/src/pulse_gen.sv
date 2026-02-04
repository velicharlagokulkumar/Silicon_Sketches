module pulse_gen (
    input logic clk, 
    input logic rst_n,
    input logic d,
    output logic pulse,
    output logic q
);

always_ff @(posedge clk or negedge rst_n)
    if (!rst_n)
        q <= '0;
    else 
        q <= d;

assign pulse = q ^ d;

endmodule