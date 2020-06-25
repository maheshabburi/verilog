module seq(x1,x2,z);
input x1,x2;
output z;
reg k,z;
always @(x1,x2)
begin
//$display("entered");
if(x1==1'b0 && x2==1'b0)
begin
//$display("first if");
 k=1'b0;
 z=1'b0;
end
if(x1==1'b1 || x2==1'b1)
begin
 if (k!=1'b1)
  z=1'b1;
 else
  z=1'b0;
end
if(x1==1'b1 && x2==1'b1)
begin
 k=1'b1;
 z=1'b0;
end
end
endmodule

module testseq;
reg x1,x2;
wire z;
seq se_q(x1,x2,z);
initial begin
$dumpfile("39.vcd");
$dumpvars(0,testseq);
#5 x1=0;x2=0;
#5 x1=0;x2=1;
#5 x1=1;x2=0;
#5 x1=1;x2=1;
#5 x1=0;x2=1;
#5 x1=0;x2=0;
#5 x1=1;x2=0;
end
initial
$monitor($time," x1=%b,x2=%b,z=%b",x1,x2,z);
endmodule