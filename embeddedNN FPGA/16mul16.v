module mux_16(clk,rst_n, start,ain,bin,yout,done);

input clk; 
input start;
input rst_n;
input [15:0]ain;
input [15:0]bin;
output [31:0]yout;
output done;

reg[15:0] areg;
reg[15:0] breg;
reg[31:0] yreg;
reg done_r; 
reg[4:0] i;

always@(posedge clk or negedge rst_n)
   if(!rst_n) i<=5'd0;
   else if(start && i<5'd17) i <= i+1'b1;
   else if(!start) i <= 5'd0;
 
always@(posedge clk or negedge rst_n)
   if(!rst_n) done_r<=1'd0;
   else if(i==5'd16) done_r <= 1'b1;
   else if(i==5'd17) done_r <= 1'b0;
  assign done = done_r;

always@(posedge clk or negedge rst_n)
 begin
   if(!rst_n) 
        begin 
             areg <= 16'h0000;
             breg <= 16'h0000;
             yreg <= 32'h00000000;
        end
   else if(start)
    begin
         if(i==5'd0)
             begin
                areg <= ain;
                breg <= bin;
             end
          else if( i>5'd0&&i<5'd16)
             begin
               if(areg[i-1]) yreg <={1'b0,yout[30:15]+breg,yreg[14:1]};
               else yreg <= yreg>>1;
             end
          else if(i==5'd16 && areg[15]) yreg <= yreg[31:16]+breg;
      
    end      
end
assign yout = yreg;
endmodule 
