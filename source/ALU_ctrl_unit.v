module ALU_ctrl_unit(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [3:0] alu_op
    );
    

    always @ (*) begin
        if(opcode==7'b0110011) begin //R-type instructions
            case( funct3)
                10'b0000000_000 : alu_op = 4'b0000;     //add
                10'b0100000_000 : alu_op = 4'b0001;     //sub
                10'b0000000_100 : alu_op = 4'b0010;     //xor
                10'b0000000_111 : alu_op = 4'b0011;     //and
                10'b0000000_110 : alu_op = 4'b0100;     //or
                10'b0000000_001 : alu_op = 4'b0101;     //sll
                10'b0000000_101 : alu_op = 4'b0110;     //srl
                default          : alu_op = 4'b1111;    // Invalid R-type
            endcase
        end 
        
        else if (opcode == 7'b0010011) begin  // I-type
            case(funct3)
                3'b000 : alu_op = 4'b0000; // addi
                3'b100 : alu_op = 4'b0010; // xori
                3'b110 : alu_op = 4'b0100; // ori
                3'b111 : alu_op = 4'b0011; // andi
                default: alu_op = 4'b1111; //invalid 
            endcase
         end
         
         else
            alu_op = 4'b1111;
      end
endmodule
