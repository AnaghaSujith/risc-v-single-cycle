module data_mem(
    input clk,
    input mem_wr,
    input mem_rd,
    input [31:0] addr,
    input [31:0] wr_data,
    output reg [31:0] rd_data
    );
    
    reg [31:0] memory [255:0];
    //write operation
    always @ (posedge clk) begin
        if(mem_wr)
            memory[addr[9:2]]<=wr_data;
    end
    //read operation
    always @(*) begin
        if(mem_rd) 
            rd_data = memory[addr[9:2]];
        else
            rd_data = 0;
    end
//print statement
//    always @(posedge clk) begin
//        if (mem_wr)
//            $display("STORE: Wrote %h to addr %h", wr_data, addr);
//        if (mem_rd)
//            $display("LOAD: Read %h from addr %h", rd_data, addr);
//    end

endmodule
