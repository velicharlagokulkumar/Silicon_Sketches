module a_mcp_send (
     input logic aclk, 
     input logic arst_n,
     //
     input logic [7:0] adatain,
     input logic asend,
     input logic aq2_ack,
     //   
     output logic [7:0] adata,
     output logic a_en, 
     output logic aready
);

 logic aack; // acknowledge pulse from pulse generator
 // Pulse Generator

 pulse_gen pg1 (
    .clk(aclk), 
    .rst_n(arst_n),
    .d(aq2_ack),
    .pulse(aack), 
    .q()
);
 // data ready/acknowledge FSM
 a_send_fsm fsm (
    .aclk(aclk), 
    .arst_n(arst_n),
    .asend(asend),
    .aack(aack),
    .aready(aready)
 );

 // send next data word
 assign anxt_data = aready & asend;

 // toggle-flop controlled by anxt_data
 always_ff @(posedge aclk or negedge arst_n)
    if ( !arst_n) 
        a_en <= '0;
    else if (anxt_data) 
        a_en <= ~a_en;
 
always_ff @(posedge aclk or negedge arst_n)
    if ( !arst_n) 
        adata <= '0;
    else if (anxt_data) 
        adata <= adatain;

endmodule