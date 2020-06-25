module Prob_5_38a (x_in, clock, reset_b,next_state);
input x_in,clock,reset_b;
output [1:0]next_state;
parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
reg [1: 0] state, next_state;
always @ (posedge clock, negedge reset_b)
if (reset_b == 0) state <= s0;
else state <= next_state;
always @ (state, x_in) begin
next_state = s0;
case (state)
s0: if (x_in == 0) next_state = s0;
else if (x_in == 1) next_state = s1;
s1: if (x_in == 0) next_state = s1;
else if (x_in == 1) next_state = s3;
s2: if (x_in == 0) next_state = s2;
else if (x_in == 1) next_state = s0;
s3: if (x_in == 0) next_state = s3;
else if (x_in == 1) next_state = s2;
default: next_state = s0;
endcase
end
endmodule

module t_Prob_5_38a ();
reg x_in, clk, reset_b;
wire [1:0] next_state;
Prob_5_38a M0 ( x_in, clk, reset_b,next_state);
initial #350$finish;
initial begin 
$dumpfile("50qa.vcd");
$dumpvars(0,t_Prob_5_38a);
clk = 0; forever #5 clk = ~clk; end
initial $monitor($time," next_state=%b",next_state);
initial fork
#2 reset_b = 1;
#3 reset_b = 0; // Initialize to s0
#4 reset_b = 1;
#2 x_in = 0;
#20 x_in = 1;
#60 x_in = 0;
#80 x_in = 1;
#90 x_in = 0;
#110 x_in = 1;
#120 x_in = 0;
#140 x_in = 1;
#150 x_in = 0;
#170 x_in= 1;
join
endmodule