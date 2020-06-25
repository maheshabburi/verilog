module halfaddertest;

reg a,b;
wire sum,car;

half_adder myhalfadder(a,b,sum,car);
initial
begin
 $dumpfile("dumpfile.vcd");
 $dumpvars(0,halfaddertest);
 a=0;b=0;
#5 $display("a=%b,b=%b,sum=%b,car=&b",a,b,sum,car);
a=0;b=1;
#5 $display("a=%b,b=%b,sum=%b,car=&b",a,b,sum,car);
a=1;b=0;
#5 $display("a=%b,b=%b,sum=%b,car=&b",a,b,sum,car);
a=1;b=1;
#5 $display("a=%b,b=%b,sum=%b,car=&b",a,b,sum,car);
 end
endmodule
