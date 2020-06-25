module mux4_1(d0,d1,d2,d3,s0,s1,out);

input d0,d1,d2,d3;
input s0,s1;
output out;

assign out = s0?(s1?d3:d2):(s1?d1:d0);

endmodule
module test;
reg d0,d1,d2,d3,s0,s1;
wire out;
mux4_1 set(d0,d1,d2,d3,s0,s1,out);
initial 
$monitor("d0=%b,d1=%b,d2=%b,d3=%b,s0=%b,s1=%b,out=%b",d0,d1,d2,d3,s0,s1,out);
initial begin 
d0=1'b1;d1=1'b1;d2=1'b0;d3=1'b1;s0=1'b0;s1=1'b1;
end 
endmodule