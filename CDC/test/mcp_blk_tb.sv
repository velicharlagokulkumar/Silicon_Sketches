module mcp_blk_tb();
    parameter DW = 8 ;

    logic aclk;
    logic arst_n;
    logic asend;
    logic [DW-1:0] adatain;
    logic aready; // ready to receive next data

    logic bclk; 
    logic brst_n;
    logic bload;
    logic [DW-1:0] bdata;
    logic bvalid; // bdata valid (ready)

    mcp_blk #(
        .DW(DW)
    ) inst_mcp (
        .aclk(aclk), 
        .arst_n(arst_n),
        .asend(asend),
        .adatain(adatain),
        .aready(aready), // ready to receive next data

        .bclk(bclk), 
        .brst_n(brst_n),
        .bload(bload),
        .bdata(bdata),
        .bvalid(bvalid) // bdata valid (ready)
    );

    always #5 aclk = ~aclk ;
    always #7 bclk = ~bclk ;

    initial begin
        aclk = 0 ;
        arst_n = 0 ;
        bclk = 0 ;
        brst_n = 0 ;
        asend = 0 ;
        adatain = '0 ;
        bload = 1 ;

        #20 ;
        arst_n = 1'b1 ;
        brst_n = 1'b1 ;

       fork
           send_data(8) ;
           recv_data(8) ;
       join

        #100 $finish ;
    end

    task automatic send_data (input int num_words) ;
        for (int i = 0 ; i < num_words ; i++) begin
            @(negedge aclk) ;
            adatain = $urandom_range(0,255) ;
            asend = 1'b1 ;
            @(negedge aclk) ;
            // asend = 1'b0 ;
            wait (aready == 1'b1) ;
        end
        asend = 1'b0 ;
    endtask

    task automatic recv_data (input int num_words) ;
        for (int i = 0 ; i < num_words ; i++) begin
            // wait (bvalid == 1'b1) ;
            // @(negedge bclk) ;
            bload = 1'b1 ;
            repeat (40) @(posedge bclk) ;
            bload = 1'b0 ;
            repeat (20) @(posedge bclk) ;
        end
    endtask

endmodule