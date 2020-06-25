module decoder(a,b,c,e,out);
input a,b,c,e;
output [7:0] out;
//assign out[7:0]=0;
assign out[0]=(~a)*(~b)*(~c)*e;
assign out[1]=(~a)*(~b)*(c)*e;
assign out[2]=(~a)*(b)*(~c)*e;
assign out[3]=(~a)*(b)*(c)*e;
assign out[4]=(a)*(~b)*(~c)*e;
assign out[5]=(a)*(~b)*(c)*e;
assign out[6]=(a)*(b)*(~c)*e;
assign out[7]=(a)*(b)*(c)*e;
endmodule

module d4to16(a,b,c,d,out);
input a,b,c,d;
output [15:0] out;
wire [0:7] out1;
wire [0:7] out2;
decoder d1(a,b,c,d,out1);
decoder d2(a,b,c,~d,out2);
assign out = {out2,out1};
endmodule

module test;
reg a,b,c,e;
wire [15:0] out;
d4to16 t(a,b,c,e,out);
initial
begin
a=0;b=0;c=0;e=1;
 #5 $display("a=%b b=%b c=%b e=%b out=%b",a,b,c,e,out);
a=0;b=0;c=0;e=0;
 #5 $display("a=%b b=%b c=%b e=%b out=%b",a,b,c,e,out);
a=0;b=1;c=1;e=1;
 #5 $display("a=%b b=%b c=%b e=%b out=%b",a,b,c,e,out);
end
endmodule

