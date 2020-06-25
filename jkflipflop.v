module dflip_flop(d,clk,reset,q);

output q;
input d,clk,reset;
reg q;


always @(posedge clk)

if(reset)
 q=1'b0;
else
 q=d;

endmodule

module jk_ff(j,k,clk,q);
input j,k,clk;
output q;
wire jk;
assign jk= (j&~q)|(~k&q);
dflip_flop dff(jk,clk,k,q);
endmodule

module test_bench;
reg j,k,clk;
wire q;

jk_ff jkff1(j,k,clk,q);
initial
 clk=1'b1;
always
 #5 clk=~clk;

 initial
 begin
 #5 j=0;k=0;
 #10 j=0;k=1;
 #10 j=1;k=0;
 #10 j=1;k=1;
 #50 $finish;
 end
 always @(clk)
 $monitor($time,"  j=%b k=%b q=%b",j,k,q);

 endmodule