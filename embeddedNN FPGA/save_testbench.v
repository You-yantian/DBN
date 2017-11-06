module network_tb;

parameter input_size=256,sum_size=512,width_out=32;
integer i=0;
//genvar j;
reg clk;
reg [input_size-1:0] data_mem[0:48];
reg [input_size-1:0] weight_mem[0:783];
reg rst_n;                                            
//wire [sum_size-1:0]  data_out;

reg [input_size-1:0]data_buffer;
reg [input_size-1:0] weight_buffer[0:15];
reg [input_size-1:0] buffer_temp;
/*reg [width_out-1:0] sum_temp_2;
reg [width_out-1:0] sum_temp_3;
reg [width_out-1:0] sum_temp_4;
reg [width_out-1:0] sum_temp_5;
reg [width_out-1:0] sum_temp_16;*/
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
			
initial                                               
begin
 clk=1'b0;
 rst_n=1'b0;
 #30 rst_n=1'b1;
 //#1000 $stop;
end

initial
begin

$readmemb("E:/Degree Project/Yantian_test/data_memory.txt",data_mem);
$readmemb("E:/Degree Project/Yantian_test/weight_memory.txt",weight_mem);
end

always #100 clk=~clk;

/*generate
      
		  for(j=0;j<49;j=j+1)
        begin:network
				matrix_multi matrix_multi_inst(
         //.clk(clk),
			//.rst_n(rst_n),
         .data_buffer(data_mem[j]),
			.weight_buffer1(weight_mem[0+j*16]),
			.weight_buffer2(weight_mem[1+j*16]),
			.weight_buffer3(weight_mem[2+j*16]),
			.weight_buffer4(weight_mem[3+j*16]),
			.weight_buffer5(weight_mem[4+j*16]),
			.weight_buffer6(weight_mem[5+j*16]),
			.weight_buffer7(weight_mem[6+j*16]),
			.weight_buffer8(weight_mem[7+j*16]),
			.weight_buffer9(weight_mem[8+j*16]),
			.weight_buffer10(weight_mem[9+j*16]),
			.weight_buffer11(weight_mem[10+j*16]),
			.weight_buffer12(weight_mem[11+j*16]),
			.weight_buffer13(weight_mem[12+j*16]),
			.weight_buffer14(weight_mem[13+j*16]),
			.weight_buffer15(weight_mem[14+j*16]),
			.weight_buffer16(weight_mem[15+j*16]),
		   .sum_input(sum_temp[j]),
			.sum_output(sum_temp[j+1])
			);
		end
endgenerate*/
//assign sum_temp[0]=512'b0;
//assign sum_output=sum_temp[49];
always @(posedge clk or negedge rst_n)                                                               
begin 
 if(rst_n==0)
   begin
   i=0;
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
 else if(i<49)
  begin
   data_buffer=data_mem[i];//{data_mem[0],data_mem[1],data_mem[2],data_mem[3],data_mem[4],data_mem[5],data_mem[6],data_mem[7],data_mem[8],data_mem[9],data_mem[10],data_mem[11],data_mem[12],data_mem[13],data_mem[14],data_mem[15]};
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
	sum_input<=sum_output;
   //$display("weight_buffer[%d]=%d",i,weight_buffer[i]);
   i=i+1;
  end
 else
  begin
   i=0;
	sum_input=512'b0;
  end
end

always @(posedge clk)
begin
 buffer_temp[input_size-1:0]<=weight_buffer[0][input_size-1:0];
 //sum_temp_2[31:0]<=sum_output[63:32];
 //sum_temp_3[31:0]<=sum_output[95:64];
 //sum_temp_4[31:0]<=sum_output[127:96];
 //sum_temp_5[31:0]<=sum_output[159:128];
 //sum_temp_16[31:0]<=sum_output[511:480];
end

endmodule
