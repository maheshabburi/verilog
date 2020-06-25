  module counter (clk, q,q1);
        input               clk;
        output reg  [2:0] q,q1;
 //       reg    signed  [2:0] tmp;
 initial begin
 q=0;q1=0;end
        always @ (posedge clk )
        begin
           if (q==6)
              q <= 3'b000;
           else
              q <= q + 3'b011;
        end
always @ (negedge clk )
        begin
           if (q1==6)
              q1 <= 3'b000;
           else
              q1 <= q1 + 3'b010;
        end
 //  assign q = tmp;
  endmodule

 module test;
 reg clk;
 wire   [2:0] q,q1;
 counter c(clk,q,q1);
 initial begin
 $dumpfile("46.vcd");
 $dumpvars(0,test);
  clk=1'b0;end
always 
 #5 clk=~clk;
 
initial
#650 $finish;
always @(posedge clk)
$monitor($time," q=%b",q);
always @(negedge clk)
$monitor($time," q=%b",q1);
endmodule
