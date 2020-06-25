module mux4_1(d0,d1,d2,d3,s0,s1,out);

input d0,d1,d2,d3;
input s0,s1;
output out;

assign out = s0?(s1?d3:d2):(s1?d1:d0);

endmodule