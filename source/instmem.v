module instmem(
    input [31:0] addr,
    input rst,
    output [31:0] instr
);
    reg [7:0] Memory [63:0]; // Byte addressable memory with 64 locations

//assign the instr. code, based on PC
    assign instr = {Memory[addr+3],Memory[addr+2],Memory[addr+1],Memory[addr]};

// Initializing memory when reset is set
    always @(rst)
    begin
        if(rst == 1)
        begin
            // Setting 32-bit instruction: add t1, s0,s1 => 0x00940333 
            Memory[3] = 8'h00;
            Memory[2] = 8'h94;
            Memory[1] = 8'h03;
            Memory[0] = 8'h33;
            // Setting 32-bit instruction: sub t2, s2, s3 => 0x413903b3
            Memory[7] = 8'h41;
            Memory[6] = 8'h39;
            Memory[5] = 8'h03;
            Memory[4] = 8'hb3;
            // Setting 32-bit instruction: mul t0, s4, s5 => 0x035a02b3
            Memory[11] = 8'h03;
            Memory[10] = 8'h5a;
            Memory[9] = 8'h02;
            Memory[8] = 8'hb3;
            // Setting 32-bit instruction: xor t3, s6, s7 => 0x017b4e33
            Memory[15] = 8'h01;
            Memory[14] = 8'h7b;
            Memory[13] = 8'h4e;
            Memory[12] = 8'h33;
            // Setting 32-bit instruction: sll t4, s8, s9
            Memory[19] = 8'h01;
            Memory[18] = 8'h9c;
            Memory[17] = 8'h1e;
            Memory[16] = 8'hb3;
            // Setting 32-bit instruction: srl t5, s10, s11
            Memory[23] = 8'h01;
            Memory[22] = 8'hbd;
            Memory[21] = 8'h5f;
            Memory[20] = 8'h33;
            // Setting 32-bit instruction: and t6, a2, a3
            Memory[27] = 8'h00;
            Memory[26] = 8'hd6;
            Memory[25] = 8'h7f;
            Memory[24] = 8'hb3;
            // Setting 32-bit instruction: or a7, a4, a5
            Memory[31] = 8'h00;
            Memory[30] = 8'hf7;
            Memory[29] = 8'h68;
            Memory[28] = 8'hb3;
            // PC = 0x20 → Memory[35:32]
            Memory[35] = 8'h00;  
            Memory[34] = 8'h50;
            Memory[33] = 8'h85;
            Memory[32] = 8'h13;  
            // PC = 0x24 → Memory[39:36]
            Memory[39] = 8'h00;
            Memory[38] = 8'hF0;
            Memory[37] = 8'hC5;
            Memory[36] = 8'h93;
            // PC = 0x28 → Memory[43:40]
            Memory[43] = 8'h00;
            Memory[42] = 8'hC1;
            Memory[41] = 8'h66;
            Memory[40] = 8'h13;
            // PC = 0x2C → Memory[47:44]
            Memory[47] = 8'h00;
            Memory[46] = 8'h81;
            Memory[45] = 8'hE6;
            Memory[44] = 8'h93;
             // PC = 0x30: sw x5, 0(x0) → 0x00502023
            Memory[51] = 8'h00;
            Memory[50] = 8'h20;
            Memory[49] = 8'h50;
            Memory[48] = 8'h23;          
            // PC = 0x34: lw x6, 0(x0) → 0x00003103
            Memory[55] = 8'h00;
            Memory[54] = 8'h31;
            Memory[53] = 8'h00;
            Memory[52] = 8'h03;
            // NOP: add x0, x0, x0 => 0x00000033
            Memory[59] = 8'h00;
            Memory[58] = 8'h00;
            Memory[57] = 8'h00;
            Memory[56] = 8'h33;

        end
    end

endmodule
