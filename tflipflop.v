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

module t_ff1(t,clk,reset,q);
input t,clk,reset;
output q;
wire d;
assign d=t^q;
dflip_flop d1(d,clk,reset,q);
endmodule

module test_bench;
reg d,clk,reset;
wire q;
 
t_ff1 tflp(d,clk,reset,q);
initial
 clk=1'b0;
always
 #2 clk=~clk;

initial
begin

#5 d=1;reset=1'b0;
#10 d=1;reset=1'b1;
#50 d=1;reset=1'b0;
#26 d=0;reset=1'b0;

end
initial
#120 $finish;
always @(posedge clk)
$monitor($time,"d=%b,q=%b",d,q);

endmodule