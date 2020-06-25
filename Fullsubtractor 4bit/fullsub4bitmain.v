`include "fullsub1bit.h"
module fullsub_4_bit(a,b,cin,d,bout);

input [3:0] a,b;
input cin;
output [3:0] d;
output bout;
wire c1,c2,c3;

full_sub fs_1(a[0],b[0],cin,d[0],c1);
full_sub fs_2(a[1],b[1],c1,d[1],c2);
full_sub fs_3(a[2],b[2],c2,d[2],c3);
full_sub fs_4(a[3],b[3],c3,d[3],bout);



endmodule