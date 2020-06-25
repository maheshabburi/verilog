primitive prencoder(w1,x,y,z,a);
input x,y,z,a;
output w1;
table
       1   0   0   0 :  00;
       x   1   0   0 :  01;
       x   x   1   0 :  10;
       x   x   x   1 :  11;
endtable
endprimitive

module test;
reg x,y,z,a;
wire w1;
prencoder p(w1,x,y,z,a);
initial
begin
$monitor( $time , "x=%b y=%b z=%b a=%b w1=%b ",x,y,z,a,w1);
x=x;y=1;z=1;a=1;
#5 x=0;y=1;z=1;a=0;
#5 x=x;y=x;z=x;a=1;
end
endmodule