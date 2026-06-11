module adaptive_controller(
    input clk,
    input rst,
    input [31:0] total_ops,
    input [31:0] simple_ops,
    input [31:0] mul_ops,
    output reg [1:0] mode
);

always @(posedge clk) begin
    if(rst) begin
        mode <= 2'b01;   // Start in 16-bit mode
    end
    else begin
        if(mul_ops > simple_ops)
            mode <= 2'b10;   // 32-bit mode
        else if(simple_ops > (mul_ops + 5))
            mode <= 2'b00;   // 8-bit mode
        else
            mode <= 2'b01;   // 16-bit mode
    end
end
endmodule
