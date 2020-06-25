module shift(w,cntrl,clk,y,k);
input [3:0]w;
input cntrl,clk;
output reg [3:0]y;
output reg k;
integer d;
integer i;
initial
d=0;
always @(clk)
begin
if(cntrl==1)
begin

d++;
//$display("d=%b",d);
for(i=0;i<4;i++)
begin 
if((i+d)<=3)
y[i]=w[i+d];
else
y[i]=0;
if(i==0)
k=w[d-1];
//$display("d=%b",d);
end
end
else if(cntrl==0)
begin
//$display("hello");
d=0;
y=w;
k=0;
end
end
endmodule

module test;
reg [3:0]w;
reg cntrl,clk;
wire [3:0]y;
wire k;
shift sh(w,cntrl,clk,y,k);
initial
clk=1'b0;
always
#5 clk=~clk;
initial
begin
$dumpfile("49.vcd");
$dumpvars(0,test);
w=4'b1111;
 cntrl=1;
#20 cntrl=0;
#10 cntrl=1;
end
always @(clk)
$monitor($time," w=%b,cntrl=%b,y=%b,k=%b",w,cntrl,y,k);
initial
#40 $finish;
endmodule