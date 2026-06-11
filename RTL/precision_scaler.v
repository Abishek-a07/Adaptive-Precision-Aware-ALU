module precision_scaler(
input [31:0]a_in,
input [31:0]b_in,
input [1:0]mode,
output reg [31:0]a_out,
output reg [31:0]b_out
    );
    always @(*)begin
    case(mode)
    2'b00:begin a_out={24'd0,a_in[7:0]}; b_out={24'd0,b_in[7:0]}; end
    2'b01:begin a_out={16'd0,a_in[15:0]}; b_out={16'd0,b_in[15:0]}; end
    2'b10:begin a_out=a_in; b_out=b_in; end
    default:begin a_out=a_in; b_out=b_in; end
    endcase
    end
endmodule
