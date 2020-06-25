  module counter (clk, clr, q);
        input               clk, clr;
        output signed [4:0] q;
        reg    signed [4:0] tmp;
        always @ (posedge clk or negedge clr)
        begin
           if (clr)
              tmp <= 5'b00000;
           else
              tmp <= tmp + 1'b1;
        end
           assign q = tmp;
  endmodule

 module test;
 reg clr,clk;
 wire [4:0]  q;
 counter c(clk,clr,q);
 initial
  clk=1'b0;
always 
 #5 clk=~clk;
 initial 
begin 
$dumpfile("47.vcd");
$dumpvars(0,test);
#0 clr=1;
#7 clr=0;
end
initial
#650 $finish;
always @(posedge clk)
$monitor($time," clear=%b,q=%b",clr,q);
endmodule
