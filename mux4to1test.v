module mux4to1test;

reg d0,d1,d2,d3,s0,s1;
wire out;

mux4_1 mx41(d0,d1,d2,d3,s0,s1,out);
initial
begin
$dumpfile("mux4to1.vcd");
$dumpvars(0,mux4to1test);
d0=1;d1=0;d2=0;d3=1;
$display("d0=%b,d1=%b,d2=%b,d3=%b",d0,d1,d2,d3);
s0=0;s1=0;
#5 $display("s0=%b,s1=%b,out=%b",s0,s1,out);
s0=0;s1=1;
#5 $display("s0=%b,s1=%b,out=%b",s0,s1,out);
s0=1;s1=0;
#5 $display("s0=%b,s1=%b,out=%b",s0,s1,out);
s0=1;s1=1;
#5 $display("s0=%b,s1=%b,out=%b",s0,s1,out);

end

endmodule