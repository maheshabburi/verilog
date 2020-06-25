//`include "fulladders.h"
module fulladdertest4bit;

reg [3:0] A,B;
reg C_IN;
wire [3:0] SUM;
wire C_OUT;

fulladder_4_bit fa1_4(A,B,C_IN,SUM,C_OUT);


initial
begin
$dumpfile("fulladdermain.vcd");
$dumpvars(0,fulladdertest4bit);

  A=4'b0000;B=4'b1110;C_IN=4'b1111;
 #5 $display("a=%b,b=%b,cin=%b,sum=%b,cout=%b",A,B,C_IN,SUM,C_OUT);
  A=4'b1010;B=4'b1100;
 #5 $display("a=%b,b=%b,cin=%b,sum=%b,cout=%b",A,B,C_IN,SUM,C_OUT);
 end


endmodule