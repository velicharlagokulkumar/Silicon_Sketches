module a_send_fsm (
    input logic aclk, 
    input logic arst_n,
    input logic asend, // send adata
    input logic aack, // acknowledge receipt of adata,
    output logic aready // ready to send next data
 );
 
 enum logic {READY = '1, BUSY = '0} state, next;
 
 always_ff @(posedge aclk or negedge arst_n)
    if (!arst_n) 
        state <= READY;
    else 
        state <= next;

always_comb begin
     case (state)
        READY: if (asend) 
                    next = BUSY;
               else 
                    next = READY;
        BUSY : if (aack) 
                    next = READY;
               else 
                    next = BUSY;
    endcase
 end

assign aready = state;

endmodule