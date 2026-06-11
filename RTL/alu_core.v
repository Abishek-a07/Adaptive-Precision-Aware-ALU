module alu_core(input [31:0]a,[31:0]b,input [2:0]opcode,output reg [31:0]result);
    always @ (*)begin
    case(opcode)
    3'd0:result=a+b;
    3'd1:result=a-b;
    3'd2:result=a&b;
    3'd3:result=a|b;
    3'd4:result=a^b;
    3'd5:result=a>>b[4:0];
    3'd6:result=a<<b[4:0];
    default:result=32'd0;
    endcase
    end
endmodule
