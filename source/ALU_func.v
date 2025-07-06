
module ALU_func(
    input [31:0] a,
    input [31:0] b,
    input [3:0] ALU_ctrl,
    output reg [31:0] result,
    output reg zero_flag
    );
    
    always @ (*) begin
    //ALU operations based on ALU_ctrl
        case(ALU_ctrl)
            4'b0000 : result = a+b; //add
            4'b0001 : result = a-b; //sub
            4'b0010 : result = a^b; //xor
            4'b0011 : result = a&b; //and
            4'b0100 : result = a|b; //or
            4'b0101 : result = a<<b[4:0];   //sll
            4'b0110 : result = a>>b[4:0];   //srl
            default : result = 0;   //default
        endcase
        //set zero-flag
        if (result == 0)
            zero_flag = 1'b1;
        else
            zero_flag = 1'b0;          
        
    end
  
        
endmodule
