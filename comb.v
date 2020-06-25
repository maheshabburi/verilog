module comb(in,out1,out2);
input [3:0] in;
output [3:0] out1;
output [3:0] out2;
//initial
//begin
assign out1=(in*5)%10;
assign out2=(in*5)/10;
//end
endmodule

module test;
reg [3:0] in;
wire [3:0] out1;
wire [3:0] out2;
comb cc(in,out1,out2);
initial
begin
in=7;
#5 $display("in=%d out1=%d out2=%d",in,out1,out2);
end
endmodule
