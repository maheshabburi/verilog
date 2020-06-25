module dflip_flop(q,d,clk,reset);

output q;
input d,clk,reset;
reg q;


always @(posedge clk)

if(reset)
 q=1'b0;
else
 q=d;

endmodule

module test_bench;
reg d,clk,reset;
wire q;
 
dflip_flop dflp(q,d,clk,reset);
initial
 clk=1'b0;
always
 #2 clk=~clk;

initial
begin

#5 d=1;reset=1'b0;
#10 d=1;reset=1'b1;
#50 d=1;reset=1'b0;
#70 $finish;
end
always @(posedge clk)
$monitor($time,"d=%b,q=%b",d,q);

endmodule