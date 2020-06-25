module half_adder(a,b,sum,car);

input a,b;
output sum,car;

xor (sum,a,b);
and (car,a,b);

endmodule