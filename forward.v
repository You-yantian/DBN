module forward(clk,en,rst_n,data_input_level2,finish_flag);

parameter width_in1=16,width_out=32,batch_size=16;
parameter Idle=3'b00,Start=3'b01,Calculate=3'b10,stor=3'b11;

input clk,en,rst;
output data_input_level2;
output finish_flag;

reg [width_in-1:0] dataa,datab;
reg [width_in-1:0] data_buffer [0:batch_size-1];
reg [width_in-1:0] weight_buffer [0:batch_size-1];
reg [width_in-1:0] data_memory [0:783];
reg [width_in-1:0] weight_memory [0:783];
reg [width_out-1:0] data_input_level2;
reg [width_out-1:0] sum;  
reg finish_flag;//判断乘加是否做完
wire [width_out-1:0] result_sig;
reg [1:0] level,count,batch,tempi;//level:nn的层数；count:第几次乘法相加
reg [2:0] state;

sign_xiaoshu_mult_16_16_32 mult_inst(
     .clk(clk),
	  .en(en),
	  .rst_n(rst),
	  .xin1_16(dataa),
	  .xin2_16(datab),
	  .yout_32(result_sig)
	  );

always @(posedge clk)
begin
   if(!rst)
	  begin
	    state<=Idle;
		 dataa<=16'b0;
		 datab<=16'b0;
		 sum<=32'b0;
		 data_input_level2<=32'b0;
		 count<=2'd0;
		 level<=2'd0;
		 batch<=2'd0;
		 finish_flag=1'b0;
	    for (tempi=2'd0;tempi<width_in;tempi=tempi+1)
		   begin
			data_buffer[tempi]=16'b0;
			weight_buffer[tempi]=16'b0;
			end
	  end
	else
	   begin
		  case(state)
		   Idle: begin
		    if(en) state<=Start;
			 else state<=Idle;
		   end
		  
		   Start: begin
		     if (en && batch<2'd49)
			    begin
				 if (batch==2'd0)
				 begin
				  finish_flag=1'b0;
				  dataa<=data_memory[0];
				  datab<=weight_memory[0];
				  //sum<=result_sig; //?可以放到后面去吗？
				 end
				  for(tempi=2'd0;tempi<width_in;tempi=tempi+2'd1)
				    begin
				     data_buffer[tempi]=data_memory[tempi+width_in*batch];
					  weight_buffer[tempi]=weight_memory[tempi+width_in*batch];//从memory中读数据到buffer中
				    end
				  state<=calculate;
				 end
			  else if(baitch>=2'd49)
			     begin
				   finish_flag<=1'b1;
				   state<=Idle;
				   batch<=2'd0;
				   level<=2'd1;
				  end
			  else
			     state<=Idle;
			end
			
			calculate:  begin
			 dataa<=data_buffer[count];
			 datab<=weight_buffer[count];
			 sum<=sum+result_sig;//因为阻碍式赋值可能会少加一个,做一下testing,看一下count的次数
			 if(count<width_in)
			  begin
			  count<=count+2'd1;
			  state<=calculate;
			  end
			 else
			  state<=store;
			end
			
	      store: begin
			 data_input_level2<=data_input_level2+sum;
			 sum<=31'b0;
			 batch<=batch+2'd1;
			 count<=2'd0;
			 state<=start;
			end
			
		end

endmodule
	