module fulladdertest;

reg a,b,cin;
wire sum,cout;

full_adder_4bit myadder(a,b,cin,sum,cout);
initial
begin
$dumpfile("fulladder.vcd");
$dumpvars(0,fulladdertest);
a=0;b=0;cin=0;
#5

$display("a=%b,b=%b,cin=%b,sum=%b,cout=%b",a,b,cin,sum,cout);
a=1;b=1;cin=cout;
#5
$display("a=%b,b=%b,cin=%b,sum=%b,cout=%b",a,b,cin,sum,cout);

a=1;b=0;cin=cout;
#5
$display("a=%b,b=%b,cin=%b,sum=%b,cout=%b",a,b,cin,sum,cout);

a=1;b=1;cin=cout;
#5
$display("a=%b,b=%b,cin=%b,sum=%b,cout=%b",a,b,cin,sum,cout);

end
endmodule