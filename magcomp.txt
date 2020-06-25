module co(a,b,c);
input [3:0] a,b;
output reg [1:0] c;
always @(a)
begin
if(a>b)c=1;
else if (a==b)c=0;
else c=2;
end 
endmodule
module t;
reg [3:0] a,b;
wire [1:0] c;
co cjhkhg(a,b,c);

initial 
begin 
$monitor("a=%b,b=%b,c=%d",a,b,c);
a=4'b1010;b=4'b1000;
#5 a=4'b1000;b=4'b1000;
#5 a=4'b0010;b=4'b1000;
end 
endmodule