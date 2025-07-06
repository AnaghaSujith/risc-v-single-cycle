module regfile(
    input clk,
    input rst,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input wr_en,
    input [31:0] rd_data,
    output [31:0] rs1_data,
    output [31:0] rs2_data
    );
    reg [31:0] registers [0:31];
    
 
//initialize the registers with some values
    always @(posedge clk) begin
        if (rst) begin
        
             registers[0] <= 32'h0;
             registers[1] <= 32'h1;
             registers[2] <= 32'h2;
             registers[3] <= 32'h3;
             registers[4] <= 32'h4;
             registers[5] <= 32'h5;
             registers[6] <= 32'h6;
             registers[7] <= 32'h7;
             registers[8] <= 32'h8;
             registers[9] <= 32'h9;
             registers[10] <= 32'h10;
             registers[11] <= 32'h11;
             registers[12] <= 32'h12;
             registers[13] <= 32'h13;
             registers[14] <= 32'h14;
             registers[15] <= 32'h15;
             registers[16] <= 32'h16;
             registers[17] <= 32'h17;
             registers[18] <= 32'h18;
             registers[19] <= 32'h19;
             registers[20] <= 32'h20;
             registers[21] <= 32'h21;
             registers[22] <= 32'h22;
             registers[23] <= 32'h23;
             registers[24] <= 32'h24;
             registers[25] <= 32'h25;
             registers[26] <= 32'h26;
             registers[27] <= 32'h27;
             registers[28] <= 32'h28;
             registers[29] <= 32'h29;
             registers[30] <= 32'h30;
             registers[31] <= 32'h31;

       end
 //register write logic
       else if (wr_en && rd!=0)
        registers[rd] <= rd_data;
    end
 //read register data
    assign rs1_data = registers[rs1];
    assign rs2_data = registers[rs2];
    
  
endmodule
