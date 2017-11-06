module matrix_multi_tb;

parameter input_size=256,sum_size=512,width_out=32;
integer i=0,batch_num=0;
reg clk;
reg [input_size-1:0] data_mem[0:6];
reg [input_size-1:0] result;
reg [input_size-1:0] weight_mem[0:111];

//reg [input_size-1:0] weight2_mem[0:111];
wire [input_size-1:0] sigmoid_output;
reg rst_n; 
reg sum_finish_flag;
                                          
reg [input_size-1:0]data_buffer;
reg [input_size-1:0] weight_buffer[0:15];
//reg [input_size-1:0] buffer_temp;
//reg [width_out-1:0] sum_temp_2;
/*reg [width_out-1:0] sum_temp_3;
reg [width_out-1:0] sum_temp_4;
reg [width_out-1:0] sum_temp_5;*/
//reg [width_out-1:0] sum_temp_1;
//wire [sum_size-1:0] sum_temp[0:49];
reg [sum_size-1:0] sum_input;
wire [sum_size-1:0] sum_output;

matrix_multi matrix_multi_inst(
         //.clk(clk),
			//.rst_n(rst_n),
         .data_buffer(data_buffer),
			.weight_buffer1(weight_buffer[0]),
			.weight_buffer2(weight_buffer[1]),
			.weight_buffer3(weight_buffer[2]),
			.weight_buffer4(weight_buffer[3]),
			.weight_buffer5(weight_buffer[4]),
			.weight_buffer6(weight_buffer[5]),
			.weight_buffer7(weight_buffer[6]),
			.weight_buffer8(weight_buffer[7]),
			.weight_buffer9(weight_buffer[8]),
			.weight_buffer10(weight_buffer[9]),
			.weight_buffer11(weight_buffer[10]),
			.weight_buffer12(weight_buffer[11]),
			.weight_buffer13(weight_buffer[12]),
			.weight_buffer14(weight_buffer[13]),
			.weight_buffer15(weight_buffer[14]),
			.weight_buffer16(weight_buffer[15]),
		   .sum_input(sum_input),
			.sum_output(sum_output)
			);
			
sigmoid_16 sigmoid_16_inst(
			.sum_input(sum_output),
			.sigmoid_output(sigmoid_output)
			);
			
initial                                               
begin
 clk=1'b0;
 rst_n=1'b0;
 #100 rst_n=1'b1;
end

initial
begin
$readmemb("E:/Degree Project/Yantian_test/data2_memory.txt",data_mem);
//$readmemb("C:/Users/yantian/Dropbox/Yantian_test/weight2_memory.txt",weight2_mem);
$readmemb("E:/Degree Project/Yantian_test/weight2_memory.txt",weight_mem);
end

always #100 clk=~clk;

always @(posedge clk or negedge rst_n)                                                               
begin 
 if(rst_n==0)
   begin
   i=0;
	batch_num=0;
	sum_finish_flag=0;
    data_buffer=256'b0; 
	sum_input=512'b0;
   weight_buffer[0]=256'b0;
	weight_buffer[1]=256'b0;
	weight_buffer[2]=256'b0;
	weight_buffer[3]=256'b0;
	weight_buffer[4]=256'b0;
	weight_buffer[5]=256'b0;
	weight_buffer[6]=256'b0;
	weight_buffer[7]=256'b0;
	weight_buffer[8]=256'b0;
	weight_buffer[9]=256'b0;
	weight_buffer[10]=256'b0;
	weight_buffer[11]=256'b0;
	weight_buffer[12]=256'b0;
   weight_buffer[13]=256'b0;
	weight_buffer[14]=256'b0;
	weight_buffer[15]=256'b0;
	end
 else 
 begin
  if(sum_finish_flag==0)
   begin
    // if(i==0)
	 //begin
	 // batch_num<=0;
	 // end
	  if(i<7)
      begin	   
     data_buffer=data_mem[i];
	  weight_buffer[0][255:0]=weight_mem[0+i*16][255:0];
	  weight_buffer[1][255:0]=weight_mem[1+i*16][255:0];
	  weight_buffer[2][255:0]=weight_mem[2+i*16][255:0];
	  weight_buffer[3][255:0]=weight_mem[3+i*16][255:0];
	  weight_buffer[4][255:0]=weight_mem[4+i*16][255:0];
	  weight_buffer[5][255:0]=weight_mem[5+i*16][255:0];
	  weight_buffer[6][255:0]=weight_mem[6+i*16][255:0];
	  weight_buffer[7][255:0]=weight_mem[7+i*16][255:0];
	  weight_buffer[8][255:0]=weight_mem[8+i*16][255:0];
	  weight_buffer[9][255:0]=weight_mem[9+i*16][255:0];
	  weight_buffer[10][255:0]=weight_mem[10+i*16][255:0];
	  weight_buffer[11][255:0]=weight_mem[11+i*16][255:0];
	  weight_buffer[12][255:0]=weight_mem[12+i*16][255:0];
	  weight_buffer[13][255:0]=weight_mem[13+i*16][255:0];
	  weight_buffer[14][255:0]=weight_mem[14+i*16][255:0];
	  weight_buffer[15][255:0]=weight_mem[15+i*16][255:0];
	  sum_input=sum_output;
      //$display("weight_buffer[%d]=%d",i,weight_buffer[i]);
      i=i+1;
	  end
	else
	  begin
		i<=0;
		sum_finish_flag<=1;
		sum_input<=512'b0;
		//batch_num<=batch_num+1;
		result=sigmoid_output;
	  end
   end
  else if(sum_finish_flag==1)
  begin
	sum_input<=512'b0;
	//batch_num<=0;
	sum_finish_flag<=0;
   end  
 
end
end



endmodule
