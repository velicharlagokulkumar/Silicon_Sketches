module Basic_Systolic_Array_Design(
  input logic clk,
  input logic rst,
  input logic [3:0] A11, A12, A21, A22,
  input logic [3:0] B11, B12, B21, B22,
  output logic [7:0] C11, C12, C21, C22
);

always_ff @(posedge clk) begin
  if (rst) begin
    C11 <= 0;
    C12 <= 0;
    C21 <= 0;
    C22 <= 0;
  end else begin
    C11 <= A11 * B11 + A12 * B21;
    C12 <= A11 * B12 + A12 * B22;
    C21 <= A21 * B11 + A22 * B21;
    C22 <= A21 * B12 + A22 * B22;
  end
end

endmodule