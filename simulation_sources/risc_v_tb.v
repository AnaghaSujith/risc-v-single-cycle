
module risc_v_tb();
    
    reg clk;
    reg rst;
    wire zero;

    wire [31:0] dbg_pc, dbg_instr, dbg_reg1, dbg_reg2, dbg_ALU_result;
    wire [3:0]  dbg_ALU_ctrl;
    wire        dbg_wr_en;

risc_v test_processor (
    .clk(clk),
    .rst(rst),
    .dbg_pc(dbg_pc),
    .dbg_instr(dbg_instr),
    .dbg_reg1(dbg_reg1),
    .dbg_reg2(dbg_reg2),
    .dbg_ALU_ctrl(dbg_ALU_ctrl),
    .dbg_ALU_result(dbg_ALU_result),
    .dbg_wr_en(dbg_wr_en)
);


    initial begin
        $dumpfile("output_wave.vcd");
        $dumpvars(0,risc_v_tb);
        $dumpvars(1, test_processor);
        $dumpvars(0, test_processor.reg1);
    end

    initial begin
        rst = 1;
        #50 rst = 0;
    end

    initial begin
        clk = 0;
        forever #20 clk = ~clk;
    end
initial begin
    $monitor("Time: %0t | PC: %h | instr: %h | x5: %d | x6: %d | reg_write: %b", 
             $time,
             test_processor.pc,
             test_processor.instr,
             test_processor.reg1.registers[5],
             test_processor.reg1.registers[6],
             test_processor.reg_write);
end
integer i;
initial begin
    #1000
    $display("=== Register File ===");
    for (i = 0; i < 8; i = i + 1)
        $display("x%0d = %0d", i, test_processor.reg1.registers[i]);
end

    initial
    #1000 $finish;
    
endmodule
