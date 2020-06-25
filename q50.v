module q38(x,ps_a,ps_b,ns_a,ns_b,rst,clk);
input x,clk,rst;
output ns_b,ns_a,ps_b,ps_a;
reg ns_b,ns_a;
reg ps_b,ps_a,d_a,d_b;
always @(posedge clk or posedge rst) 
begin
    if (rst) 
    begin
    ps_a <= 1'b0;
    ps_b <= 1'b0;
    ns_a <= 1'b0;
    ns_b <= 1'b0;
    end
    else 
    begin
    ps_a <= ns_a;
    ps_b <= ns_b;   
    end
end
always @(posedge clk or x) 
begin
#0 d_a = ps_a*~x + ps_b*x;

#0 d_b = ~ps_a*x + ps_b*~x ;

if (d_a==1)
#0 ns_a= ~ps_a;
else 
#0 ns_a= ps_a;
if (d_b==1)
#0 ns_b= ~ps_b;
else 
#0 ns_b= ps_b;
end
endmodule

//Test bench file:
 
//`timescale 10ns/1ns
module test_q38;
reg x;
wire ps_b,ps_a,ns_b,ns_a;
reg rst,clk;
q38 t1(x,ps_a,ps_b,ns_a,ns_b,rst,clk);
initial
begin
clk=0;
forever #5 clk=~clk; 
end
initial 
begin
	rst=1;
	#5 rst=1;
	#10 rst=0;x=1;
end
initial
begin
$monitor("In time %2d, rst = %1b, x = %1b, ps_a = %1b, ps_b = %1b, ns_a = %1b, ns_b = %1b",$time,rst,x,ps_a,ps_a,ns_a,ns_b);
end
initial
begin
	$dumpfile("q38.vcd");
	$dumpvars(0,test_q38);
	#100 $finish;
end
endmodule
