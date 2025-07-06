`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 22:40:22
// Design Name: 
// Module Name: risc_v
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module risc_v(
    input clk,
    input rst,
   output zero
//    output [31:0] dbg_pc,
//    output [31:0] dbg_instr,
//    output [31:0] dbg_reg1,
//    output [31:0] dbg_reg2,
//    output [3:0]  dbg_ALU_ctrl,
//    output [31:0] dbg_ALU_result,
//    output        dbg_wr_en
     );
    reg [31:0] pc;
    wire [31:0] instr;
    wire [31:0] reg_rdata1, reg_rdata2;
    reg [31:0] reg_wdata;
    reg reg_write;
    wire [31:0] imm_s = {{20{instr[31]}}, instr[31:25], instr[11:7]};

    wire [31:0] imm_i = {{20{instr[31]}}, instr[31:20]};
// instantiating instruction memory
    instmem mem1(.addr(pc),.rst(rst), .instr(instr));   
    
    wire [6:0] opcode = instr[6:0];
    wire [4:0] rd     = instr[11:7];
    wire [2:0] funct3 = instr[14:12];
    wire [4:0] rs1    = instr[19:15];
    wire [4:0] rs2    = instr[24:20];
    wire [6:0] funct7 = instr[31:25];
    
    
 //instantiating register file  
    regfile reg1 ( .clk(clk), 
                    .rst(rst), 
                    .rs1(rs1), 
                    .rs2(rs2), 
                    .rd(rd), 
                    .wr_en(reg_write), 
                    .rd_data(reg_wdata),
                    .rs1_data(reg_rdata1), 
                    .rs2_data(reg_rdata2)
                    );
                    
      wire [3:0] ALU_ctrl;
      wire [31:0] ALU_res;
 // instantiating ALU control    
      ALU_ctrl_unit ALU_ctrl1( .opcode(opcode),
                               .funct3(funct3),
                               .funct7(funct7),
                               .alu_op(ALU_ctrl)
                               );
                               
                               
      wire [31:0] ALU_input2 = (opcode == 7'b0010011 || opcode == 7'b0000011) ? imm_i :(opcode == 7'b0100011) ? imm_s : reg_rdata2;
//instantiating ALU func
      ALU_func ALU1( .a(reg_rdata1),
                     .b(ALU_input2),
                     .ALU_ctrl(ALU_ctrl),
                     .result(ALU_res),
                     .zero_flag(zero)
                     );
                     
                     
      wire [31:0] data_mem_rd;
      reg mem_wr, mem_rd;
 //instantiating data memory       
        data_mem dmem (
            .clk(clk),
            .mem_wr(mem_wr),
            .mem_rd(mem_rd),
            .addr(ALU_res),
            .wr_data(reg_rdata2),
            .rd_data(data_mem_rd)
        );
        
        
 //PC updation
      always @ (posedge clk, posedge rst) begin
        if(rst)
            pc <= 0;
        else
            pc <= pc+4;
      end
      
      
 //R-type, I-type, S-type instructions
      always @ (*) begin
        case (opcode)
            7'b0110011 : begin
            reg_write = 1;
            mem_rd = 0;
            mem_wr = 0;
            reg_wdata = ALU_res;
        end
            7'b0010011 : begin
            reg_write = 1;
            mem_rd = 0;
            mem_wr = 0;
            reg_wdata = ALU_res;
        end 
            7'b0000011 : begin
            reg_write = 1;
            mem_rd = 1;
            mem_wr = 0;
            reg_wdata = data_mem_rd;
        end 
            7'b0100011 : begin
            reg_write = 0;
            mem_rd = 0;
            mem_wr = 1;
            
        end 
        default : begin
            reg_write = 0;
            reg_wdata = 0;
            mem_rd = 0;
            mem_wr = 0;
            
        end
      endcase
    end

// print internal state for waveform visibility
//  always @(posedge clk) begin
//    if (instr == 32'h00000033) begin
//        $display("HALT: Reached NOP at PC=%08x", pc);
//        $finish;
//    end
//end
  
  
// For waveform viewing
assign dbg_pc         = pc;
assign dbg_instr      = instr;
assign dbg_reg1       = reg_rdata1;
assign dbg_reg2       = reg_rdata2;
assign dbg_ALU_ctrl   = ALU_ctrl;
assign dbg_ALU_result = ALU_res;
assign dbg_wr_en      = reg_write;

      
endmodule
