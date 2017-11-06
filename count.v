module count(clk,rst,count_out,sum_finish);

input  clk,rst;
output count_out;
output sum_finish;
reg count;
reg sum_finish_flag;

assign count_out=count;
assign sum_finish=sum_finish_flag;

/*case(level)
1:count_in<49?count_out=count_in+1;count_out=count_in;
default:count_in<7?count_out=count_in+1;count_out=count_in;
endcase

case(level)
1:count_in<49?sum_finish=0;sum_finish=1;
default:count_in<7?sum_finish=0;sum_finish=1;
endcase*/


always@(posedge clk)
begin
 if (rst==0)
 begin
 count=0;
 sum_finish_flag=0;
 end
 else if(rst==1)
 begin
   if (count==49)
   begin
   count=0;
   sum_finish_flag=1;
   end
   else
   begin
   count=count+1;
   sum_finish_flag=0;
   end
 end
end

endmodule
