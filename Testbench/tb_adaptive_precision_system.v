`timescale 1ns/1ps
module tb_adaptive_precision_system;

reg clk;
reg rst;

reg [31:0] a;
reg [31:0] b;
reg [2:0] opcode;
reg valid_in;

wire [63:0] result;
wire valid_out;
wire [1:0] current_mode;

adaptive_precision_alu_top dut(

    .clk(clk),
    .rst(rst),

    .a(a),
    .b(b),

    .opcode(opcode),

    .valid_in(valid_in),

    .result(result),
    .valid_out(valid_out),

    .current_mode(current_mode)

);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;

    a = 0;
    b = 0;
    opcode = 0;
    valid_in = 0;

    #20;
    rst = 0;

    //----------------------------------
    // Mostly Simple Operations
    //----------------------------------

    valid_in = 1;

    repeat(10) begin
        opcode = 3'd0;   // ADD
        a = 100;
        b = 5;
        #10;
    end

    //----------------------------------
    // Mixed Workload
    //----------------------------------

    opcode = 3'd7;
    a = 10;
    b = 20;
    #10;

    opcode = 3'd0;
    #10;

    opcode = 3'd7;
    #10;

    opcode = 3'd1;
    #10;

    //----------------------------------
    // Multiply Heavy
    //----------------------------------

    repeat(15) begin
        opcode = 3'd7;
        a = 25;
        b = 4;
        #10;
    end

    valid_in = 0;

    #100;

    $finish;

end

endmodule
