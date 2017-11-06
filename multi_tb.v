module multi_tb;

parameter input_size=256,sum_size=512,width_out=32;
integer batch_num=0;
reg clk;
reg [input_size-1:0] data_mem[0:48];
reg [input_size-1:0] data_level2_mem[0:1];
reg [input_size-1:0] weight_mem[0:783];
//reg [input_size-1:0] weight2_mem[0:111];
wire [input_size-1:0] sigmoid_output;
reg rst_n; 
wire sum_finish_flag;
                                          
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
wire count_out;
reg [input_size-1:0] result_0;
//reg [input_size-1:0] result_1;
//reg [input_size-1:0] result_2;


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
		
count count_clk(
          .clk(clk),
			 .rst(rst_n),
			 .count_out(count_out),
			 .sum_finish(sum_finish_flag)
			 );
	
initial                                               
begin
 clk=1'b0;
 rst_n=1'b0;
 #30 rst_n=1'b1;
end

initial
begin
$readmemb("E:/Degree Project/Yantian_test/data_memory.txt",data_mem);
//$readmemb("C:/Users/yantian/Dropbox/Yantian_test/weight2_memory.txt",weight2_mem);
$readmemb("E:/Degree Project/Yantian_test/weight_memory.txt",weight_mem);
end

always #100 clk=~clk;

always @(posedge clk or negedge rst_n)                                                               
begin 
 case(rst_n)
 0:
   begin
	batch_num=0;
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
 1: 
 begin
  case(sum_finish_flag)
  0:
   begin
    // if(i==0)
	 //begin
	 // batch_num<=0;
	 // end
	    
     data_buffer=data_mem[count_out-1];
	  weight_buffer[0][255:0]=weight_mem[0+(count_out-1)*16][255:0];
	  weight_buffer[1][255:0]=weight_mem[1+(count_out-1)*16][255:0];
	  weight_buffer[2][255:0]=weight_mem[2+(count_out-1)*16][255:0];
	  weight_buffer[3][255:0]=weight_mem[3+(count_out-1)*16][255:0];
	  weight_buffer[4][255:0]=weight_mem[4+(count_out-1)*16][255:0];
	  weight_buffer[5][255:0]=weight_mem[5+(count_out-1)*16][255:0];
	  weight_buffer[6][255:0]=weight_mem[6+(count_out-1)*16][255:0];
	  weight_buffer[7][255:0]=weight_mem[7+(count_out-1)*16][255:0];
	  weight_buffer[8][255:0]=weight_mem[8+(count_out-1)*16][255:0];
	  weight_buffer[9][255:0]=weight_mem[9+(count_out-1)*16][255:0];
	  weight_buffer[10][255:0]=weight_mem[10+(count_out-1)*16][255:0];
	  weight_buffer[11][255:0]=weight_mem[11+(count_out-1)*16][255:0];
	  weight_buffer[12][255:0]=weight_mem[12+(count_out-1)*16][255:0];
	  weight_buffer[13][255:0]=weight_mem[13+(count_out-1)*16][255:0];
	  weight_buffer[14][255:0]=weight_mem[14+(count_out-1)*16][255:0];
	  weight_buffer[15][255:0]=weight_mem[15+(count_out-1)*16][255:0];
	  sum_input<=sum_output;
	  //count_in<=count_out;
      //$display("weight_buffer[%d]=%d",i,weight_buffer[i]);    
   end
  1:
  begin 
      //count_in<=0;
      sum_input<=512'b0;
		data_level2_mem[batch_num]=sigmoid_output;  
   
	  //data_level2_mem[batch_num-1]=sigmoid_output;
	 case(batch_num)
	 0:begin 
	 $readmemb("E:/Degree Project/Yantian_test/weight_memory1.txt",weight_mem);
	 batch_num<=batch_num+1;
	 end
	 /*1: begin 
	 $readmemb("E:/Degree Project/Yantian_test/weight_memory1.txt",weight_mem);
	 batch_num<=batch_num+1;
	 end*/
	 //2: $readmemb("E:/Degree Project/Yantian_test/weight_memory3.txt",weight_mem);
	 //3: $readmemb("E:/Degree Project/Yantian_test/weight_memory4.txt",weight_mem);
	 //4: $readmemb("E:/Degree Project/Yantian_test/weight_memory5.txt",weight_mem);
	 //5: $readmemb("E:/Degree Project/Yantian_test/weight_memory6.txt",weight_mem);
    default:
    begin
	 //count_in<=0;
	 sum_input<=512'b0;
    //data_level2_mem[batch_num-1]=sigmoid_output;
	 batch_num<=0;
    end
    endcase 
  end
 default:;
 endcase
 
end

 default:;
endcase

end

always @(posedge clk)
begin
result_0=data_level2_mem[0];
//result_1=data_level2_mem[1];
//result_2=data_level2_mem[2];
end


endmodule

