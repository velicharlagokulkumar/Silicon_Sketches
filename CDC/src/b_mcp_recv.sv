module b_mcp_recv (
    input logic bclk, 
    input logic brst_n,
    //
    input logic [7:0] adata, // unsynchronized adata
    input logic bload, // load data and acknowledge receipt
    input logic bq2_en, // synchornized enable input

    output logic [7:0] bdata,
    output logic bvalid_out, // bdata valid
    output logic b_ack // acknowledge signal
);
 
 logic b_en; // enable pulse from pulse generator
 logic bvalid;
 
 // Pulse Generator
 pulse_gen pg1 ( 
    .clk(bclk), 
    .rst_n(brst_n), 
    .d(bq2_en), 
    .pulse(b_en),
    .q()
);

 // data ready/acknowledge FSM
 b_ack_fsm fsm (
    .bclk(bclk), 
    .brst_n(brst_n),
    .b_en(b_en),
    .bload(bload),
    .bvalid(bvalid)
 );

 // load next data word
 assign bload_data = bvalid & bload;
 // toggle-flop controlled by bload_data
 always_ff @(posedge bclk or negedge brst_n)
    if ( !brst_n) 
        b_ack <= '0;
    else if (bload_data) 
        b_ack <= ~b_ack;
 
always_ff @(posedge bclk or negedge brst_n) begin
    if ( !brst_n)  begin
        bdata <= '0;
        bvalid_out <= '0;
    end else if (bload_data) begin
        bdata <= adata;
        bvalid_out <= bvalid;
    end
    else begin
        bdata <= bdata;
        bvalid_out <= '0;
    end
end

endmodule