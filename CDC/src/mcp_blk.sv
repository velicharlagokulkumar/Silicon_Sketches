module mcp_blk #(
    parameter DW = 8
)(
    input logic aclk, 
    input logic arst_n,
    input logic asend,
    input logic [DW-1:0] adatain,
    output logic aready, // ready to receive next data

    input logic bclk, 
    input logic brst_n,
    input logic bload,
    output logic [DW-1:0] bdata,
    output logic bvalid // bdata valid (ready)
 );
 
 logic [DW-1:0] adata; // internal data bus
 logic b_ack; // acknowledge enable signal
 logic a_en; // control enable signal
 logic bq2_en; // control - sync output
 logic aq2_ack; // feedback - sync output

 sync2 async (.clk(aclk), .rst_n(arst_n), .d(b_ack), .q(aq2_ack));
 sync2 bsync (.clk(bclk), .rst_n(brst_n), .d(a_en), .q(bq2_en));
 
 a_mcp_send alogic (
    .aclk(aclk), 
    .arst_n(arst_n),
    .adatain(adatain),
    .asend(asend),
    .aq2_ack(aq2_ack),
    .adata(adata),
    .a_en(a_en),
    .aready(aready)
);
 
b_mcp_recv blogic (
    .bclk(bclk), 
    .brst_n(brst_n),
    .adata(adata),
    .bload(bload),
    .bq2_en(bq2_en),
    .bdata(bdata),
    .bvalid_out(bvalid),
    .b_ack(b_ack)
 );

endmodule