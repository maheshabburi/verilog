primitive major(w,x,y,z);
input x,y,z;
output w;
table
       0   0   0  :  0;
       0   0   1  :  0;
       0   1   0  :  0;
       0   1   1  :  1;
       1   0   0  :  0;
       1   0   1  :  1;
       1   1   0  :  1;
       1   1   1  :  1;


endtable
endprimitive

module test;
reg x,y,z;
wire w;
major m(w,x,y,z);
initial
begin
$monitor($time , " x=%b y=%b z=%b w=%b",x,y,z,w);
x=1;y=1;z=1;
#5 x=0;y=0;z=1;
#5 x=0;y=0;z=0;
end
endmodule
