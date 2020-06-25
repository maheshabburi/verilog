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

module test;
reg a,b,c,e;
wire [7:0] out;
decoder t(a,b,c,e,out);
initial
begin
a=0;b=0;c=0;e=1;
 #5 $display("a=%b b=%b c=%b e=%b out=%b",a,b,c,e,out);
a=0;b=0;c=1;e=0;
 #5 $display("a=%b b=%b c=%b e=%b out=%b",a,b,c,e,out);
a=0;b=1;c=1;e=1;
 #5 $display("a=%b b=%b c=%b e=%b out=%b",a,b,c,e,out);
end
endmodule