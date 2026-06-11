module performance_monitor(

    input clk,
    input rst,
    input valid_in,
    input [2:0] opcode,
    output reg [31:0] total_ops,
    output reg [31:0] simple_ops,
    output reg [31:0] mul_ops

);

always @(posedge clk) begin
    if(rst) begin
        total_ops  <= 32'd0;
        simple_ops <= 32'd0;
        mul_ops    <= 32'd0;
    end
    else if(valid_in) begin
        total_ops <= total_ops + 1;
        if(opcode == 3'd7)
            mul_ops <= mul_ops + 1;
        else
            simple_ops <= simple_ops + 1;
    end
end
endmodule
