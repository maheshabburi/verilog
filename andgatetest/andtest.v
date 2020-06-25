module andstimulus;

reg in0,in1;
wire outand;

and_gate myand(in0,in1,outand);

initial
 begin
 in0=0;in1=0;
 #1 $display("a=%b,b=%b,out=%b",in0,in1,outand);
 in0=0;in1=1;
 #1 $display("a=%b,b=%b,out=%b",in0,in1,outand);
in0=1;in1=0;
 #1 $display("a=%b,b=%b,out=%b",in0,in1,outand);
in0=1;in1=1;
 #1 $display("a=%b,b=%b,out=%b",in0,in1,outand);
end

endmodule
