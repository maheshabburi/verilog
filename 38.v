module jk(q,q1,j,k,c);
output q,q1;
input j,k,c;
reg q,q1;
initial begin q=1'b0; q1=1'b1; end
always @ (posedge c)
  begin
	case({j,k})
		 {1'b0,1'b0}:begin q=q; q1=q1; end
		 {1'b0,1'b1}: begin q=1'b0; q1=1'b1; end
		 {1'b1,1'b0}:begin q=1'b1; q1=1'b0; end
		 {1'b1,1'b1}: begin q=~q; q1=~q1; end
	endcase
   end
endmodule

module twojk(a,b,c,e,f,q,q1);
input a,b,c,e,f;
output q,q1;
wire ja,ka,jb,kb,qbar,q1bar;
assign qbar=~q;
assign q1bar=~q1;
assign ja=~b*e*~f + b*e*f;
assign ka=~b*e*~f + b*e*f;
assign jb=e;
assign kb=e;
jk j1(q,qbar,ja,ka,c);
jk j2(q1,q1bar,jb,kb,c);
endmodule

module test;
reg a,b,c,e,f;
wire q,q1;
twojk t(a,b,c,e,f,q,q1);
initial
begin
c=0;
forever #5 c=~c;
end
initial
begin

#5 a=0;b=0;e=1;f=1;
#10 a=0;b=1;
#10 a=1;b=0;
#10 a=1;b=1;
#10 a=0;b=0;
end
always @(c)
$monitor($time," a=%b,b=%b,e=%b,f=%b,q=%b,q1=%b",a,b,e,f,q,q1);
initial
#60 $finish;
endmodule