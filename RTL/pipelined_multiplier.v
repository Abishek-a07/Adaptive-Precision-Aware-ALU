module pipelined_multiplier(
input clk,rst,
input valid_in,
input [31:0]a,
input [31:0]b,
output reg [63:0]result,
output reg valid_out
    );
    reg [63:0]stage1_product;
    reg stage1_valid;
    always @(posedge clk)begin
        if(rst)begin
        result<= 64'd0;
        valid_out<=1'b0;
        stage1_product<= 64'd0;
        stage1_valid<= 1'b0;
        end
        else begin
            stage1_product<=a*b;
            stage1_valid<=valid_in;
            result<=stage1_product;
            valid_out<=stage1_valid;
            end
    end
endmodule
