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

module counter(t,clk,reset,q,q1);
input t,clk,reset;
output [1:0]q,q1;

jk t1(q[0],q1[0],t,reset,clk);
jk t2(q[1],q1[1],t,reset,q[0]);


endmodule

module test_bench;
reg t,clk,reset;
wire [1:0]q,q1;

counter cnt(t,clk,reset,q,q1);
initial
clk=1'b1;
always
#5 clk=~clk;
initial
begin
 t=1;reset=0;
 #10 t=1;reset=1;
end
initial
#100 $finish;
always @(posedge clk)
$monitor($time," t=%b,reset=%b,q[0]=%b,q[1]=%b",t,reset,q[0],q[1]);

endmodule