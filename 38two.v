module jk(q,q1,j,k,c);
output q,q1;
input j,k,c;
reg q,q1;
//initial begin q=1'b0; q1=1'b1; end
always @ (posedge c)
  begin
  $display("hello");
	case({j,k})
		 {1'b0,1'b0}:begin q=q; q1=q1; end
		 {1'b0,1'b1}: begin q=1'b0; q1=1'b1; end
		 {1'b1,1'b0}:begin q=1'b1; q1=1'b0; end
		 {1'b1,1'b1}: begin q=~q; q1=~q1; end
	endcase
   end
endmodule

module twojk(c,e,f,reset,a,b,q,q1);
input c,e,f,reset;
output a,b,q,q1;
reg a,b;
wire ja,ka,jb,kb,qbar,q1bar;
initial
begin
if(reset) begin
a=0;b=0;
assign q=0;
assign q1=0;
end
else begin
a=q;b=q1;end
end

assign qbar=~q;
assign q1bar=~q1;
assign ja=~b*e*~f + b*e*f;
assign ka=~b*e*~f + b*e*f;
assign jb=e;
assign kb=e;
assign q=a;
assign q1=b;
jk j1(q,qbar,ja,ka,c);
jk j2(q1,q1bar,jb,kb,c);
endmodule

module test;
reg c,e,f,reset;
wire a,b,q,q1;
twojk t(c,e,f,reset,a,b,q,q1);
initial
c=0;
always
#5 c=~c;
initial
begin
reset=1;
#4 e=1;f=1;reset=0;

end
always @(c)
$monitor($time," a=%b,b=%b,e=%b,f=%b,q=%b,q1=%b",a,b,e,f,q,q1);
initial
#60 $finish;
endmodule