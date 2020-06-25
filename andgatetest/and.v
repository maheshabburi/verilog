module and_gate(a,b,out);

input a,b;
output out;
 
//and a1(out,a,b); //gate level
assign out = a & b; //data flow modeling
endmodule