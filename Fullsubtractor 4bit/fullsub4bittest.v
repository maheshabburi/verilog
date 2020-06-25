
module fullsubtest4bit;

reg [3:0] A,B;
reg C_IN;
wire [3:0] D;
wire B_OUT;

fullsub_4_bit fa1_4(A,B,C_IN,D,B_OUT);

initial
begin
  A=4'b0000;B=4'b1110;C_IN=1'b1;
 #5 $display("a=%b,b=%b,cin=%b,diff=%b,bout=%b",A,B,C_IN,D,B_OUT);
  A=4'b1010;B=4'b1100;
 #5 $display("a=%b,b=%b,cin=%b,d=%b,bout=%b",A,B,C_IN,D,B_OUT);
 end


endmodule