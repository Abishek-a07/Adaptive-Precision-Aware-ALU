module adaptive_precision_alu_top(
input clk,
input rst,
input [31:0]a,
input [31:0]b,
input [2:0]opcode,
input valid_in,
output reg [63:0] result,
output reg valid_out,
output [1:0] current_mode
    );
    wire [31:0]scaled_a;
    wire [31:0]scaled_b;
    wire [31:0] alu_result;
    wire [63:0] mul_result;
    wire mul_valid;
    wire [31:0] total_ops;
    wire [31:0] simple_ops;
    wire [31:0] mul_ops;
    wire [1:0] auto_mode;
    assign current_mode = auto_mode;
    precision_scaler p1(.a_in(a),.b_in(b),.mode(auto_mode),.a_out(scaled_a),.b_out(scaled_b));
    alu_core a1(.a(scaled_a),.b(scaled_b),.opcode(opcode),.result(alu_result));
    pipelined_multiplier m1(.clk(clk),.rst(rst),.valid_in(valid_in),.a(scaled_a),.b(scaled_b),.result(mul_result),.valid_out(mul_valid));
    performance_monitor u_monitor(.clk(clk),.rst(rst),.valid_in(valid_in),.opcode(opcode),.total_ops(total_ops),.simple_ops(simple_ops),.mul_ops(mul_ops));
    adaptive_controller u_controller(.clk(clk),.rst(rst),.total_ops(total_ops),.simple_ops(simple_ops),.mul_ops(mul_ops),.mode(auto_mode));
    always @(*) begin
    if(opcode == 3'd7) begin
        result    = mul_result;
        valid_out = mul_valid;
    end
    else begin
        result    = {32'd0, alu_result};
        valid_out = valid_in;
    end
end
endmodule
