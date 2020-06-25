module EFproblem(E,F,clk,reset,present,next);
input E,F,clk,reset;
output[1:0] next,present;
   parameter s0=2'b00,
             s1=2'b01,
             s2=2'b10,
             s3=2'b11;
   reg [1:0] present,next;
   
   always @(posedge clk,negedge reset)
     
     if(reset==0)
          present<=s0;
     else 
          present<=next;
  
  always @(E,F,present)
    begin  
       next=s0;
     case(present)
      s0:  if(E==0)next=s0;
           else if (F==1) next=s1;
           else next=s3;
      s1:  if(E==0)next=s1;
           else if (F==1) next=s2;
           else next=s0;
      s2:  if(E==0)next=s2;
           else if (F==1) next=s3;
           else next=s1;
      s3:  if(E==0)next=s3;
           else if (F==1) next=s0;
           else next=s2;
      default: next=s0;
    endcase
  end
endmodule


module test;
  reg E,F,clk,reset;
wire[1:0] present,next;
  EFproblem ef(E,F,clk,reset,present,next);
  initial #800 $finish;
  
  initial 
    begin
    $dumpfile("38.vcd");
$dumpvars(0,test);

     clk=0;
     forever #5 clk=~clk;
       end
  initial begin 
      #2 reset= 1;
      #3 reset = 0;   
      #4 reset= 1;
      #2 E = 0;
      #20 begin E = 1; F = 1; end
      #60 E = 0; 
      #80 E = 1; 
      #90 E = 0; 
    
      #170 E= 1;
      #170 F = 0;   
   end
always @(posedge clk)
$monitor($time," E=%b F=%b present=%b next=%b ",E,F,present,next);
endmodule 
 
 
