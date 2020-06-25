module gate(a,b,c);
input a,b;
wire k,l;
output c;
nand(k,a,a);
nand(l,b,b);nand(c,k,l);
endmodule
module t;
reg a,b;
wire c;
gate g(a,b,c);
initial 
begin
$monitor("a=%b,b=%b,c=%b",a,b,c);
a=1'b0;b=1'b0;
#5a=1'b0;b=1'b1;
#5a=1'b1;b=1'b0;
#5a=1'b1;b=1'b1;
end 
endmodule