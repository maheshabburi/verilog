module full_sub(a,b,c,d,bout);

input a,b,c;
output d,bout;
wire abar,out1,out2,out3,d1;
assign d=a^b^c;
//assign d=d1^c;

//assign bout=(~(~a&b))&c;

not n1(abar,a);
and a1(out1,abar,c);
and a2(out2,abar,b);
and a3(out3,b,c);
or r1(bout,out1,out2,out3);

endmodule