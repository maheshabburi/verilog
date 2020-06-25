module mult4bittest;

reg [3:0] a,b;
wire [7:0] out;

mult_4_bit mul_4(a,b,out);
initial 
begin
$dumpfile("mult.vcd");
$dumpvars(0,mult4bittest);
a=4'b1111;b=4'b1100;
#5 $display("a=%b,b=%b,out=%b",a,b,out);
a=4'b1110;b=4'b0000;
#5 $display("a=%b,b=%b,out=%b",a,b,out);
end
endmodule