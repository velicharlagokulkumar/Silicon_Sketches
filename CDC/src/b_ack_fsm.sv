module b_ack_fsm (
    input logic bclk, 
    input logic brst_n,

    input logic bload, // load data / send acknowledge
    input logic b_en, // enable receipt of adata

    output logic bvalid // data valid / ready to load
 );
 
 enum logic {READY = '1, WAIT = '0} state, next;
 
 always_ff @(posedge bclk or negedge brst_n)
    if (!brst_n) 
        state <= WAIT;
    else 
        state <= next;
 
always_comb begin
    case (state)
         READY: if (bload) 
                    next = WAIT;
                else next = READY;
         WAIT : if (b_en) 
                    next = READY;
                else 
                    next = WAIT;
    endcase
 end

assign bvalid = state;

endmodule