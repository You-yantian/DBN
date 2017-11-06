module matrix_multi(
         //clk,rst_n,
         data_buffer,
			weight_buffer1,weight_buffer2,weight_buffer3,weight_buffer4,weight_buffer5,weight_buffer6,weight_buffer7,weight_buffer8,weight_buffer9,weight_buffer10,weight_buffer11,weight_buffer12,weight_buffer13,weight_buffer14,weight_buffer15,weight_buffer16,
		   sum_input,
			sum_output
			);
parameter input_size=256,sum_size=512,width_in=16,width_out=32,data_size=16,weight_size=256;
genvar i;

//input clk,rst_n;
input [input_size-1:0]data_buffer;

input [input_size-1:0] weight_buffer1;
input [input_size-1:0] weight_buffer2;
input [input_size-1:0] weight_buffer3;
input [input_size-1:0] weight_buffer4;
input [input_size-1:0] weight_buffer5;
input [input_size-1:0] weight_buffer6;
input [input_size-1:0] weight_buffer7;
input [input_size-1:0] weight_buffer8;
input [input_size-1:0] weight_buffer9;
input [input_size-1:0] weight_buffer10;
input [input_size-1:0] weight_buffer11;
input [input_size-1:0] weight_buffer12;
input [input_size-1:0] weight_buffer13;
input [input_size-1:0] weight_buffer14;
input [input_size-1:0] weight_buffer15;
input [input_size-1:0] weight_buffer16;

input [sum_size-1:0] sum_input;
output [sum_size-1:0] sum_output;

//wire [width_in-1:0] data_buffer [data_size-1:0];
//wire [width_in-1:0] weight_buffer [weight_size-1:0];
//wire [width_out-1:0]data_input_level2[15:0];
wire [width_out-1:0] sum_temp_1[16:0];
wire [width_out-1:0] sum_temp_2[16:0];
wire [width_out-1:0] sum_temp_3[16:0];
wire [width_out-1:0] sum_temp_4[16:0];
wire [width_out-1:0] sum_temp_5[16:0];
wire [width_out-1:0] sum_temp_6[16:0];
wire [width_out-1:0] sum_temp_7[16:0];
wire [width_out-1:0] sum_temp_8[16:0];
wire [width_out-1:0] sum_temp_9[16:0];
wire [width_out-1:0] sum_temp_10[16:0];
wire [width_out-1:0] sum_temp_11[16:0];
wire [width_out-1:0] sum_temp_12[16:0];
wire [width_out-1:0] sum_temp_13[16:0];
wire [width_out-1:0] sum_temp_14[16:0];
wire [width_out-1:0] sum_temp_15[16:0];
wire [width_out-1:0] sum_temp_16[16:0];
//wire [width_out-1:0] cin[15:0];

assign sum_temp_1[0][31:0]=sum_input[31:0];
assign sum_temp_2[0][31:0]=sum_input[63:32];
assign sum_temp_3[0][31:0]=sum_input[95:64];
assign sum_temp_4[0][31:0]=sum_input[127:96];
assign sum_temp_5[0][31:0]=sum_input[159:128];
assign sum_temp_6[0][31:0]=sum_input[191:160];
assign sum_temp_7[0][31:0]=sum_input[223:192];
assign sum_temp_8[0][31:0]=sum_input[255:224];
assign sum_temp_9[0][31:0]=sum_input[287:256];
assign sum_temp_10[0][31:0]=sum_input[319:288];
assign sum_temp_11[0][31:0]=sum_input[351:320];
assign sum_temp_12[0][31:0]=sum_input[383:352];
assign sum_temp_13[0][31:0]=sum_input[415:384];
assign sum_temp_14[0][31:0]=sum_input[447:416];
assign sum_temp_15[0][31:0]=sum_input[479:448];
assign sum_temp_16[0][31:0]=sum_input[511:480];
 
 generate
      
		  for(i=0;i<data_size;i=i+1)
        begin:multi_add1
				multi_add mult_inst1 ( data_buffer[i*16+15:i*16], weight_buffer1[i*16+15:i*16], sum_temp_1[i][31:0], sum_temp_1[i+1][31:0]); 			   
				multi_add mult_inst2 ( data_buffer[i*16+15:i*16], weight_buffer2[i*16+15:i*16], sum_temp_2[i], sum_temp_2[i+1]);				
		        multi_add mult_inst3 ( data_buffer[i*16+15:i*16], weight_buffer3[i*16+15:i*16], sum_temp_3[i], sum_temp_3[i+1]);
				multi_add mult_inst4 ( data_buffer[i*16+15:i*16], weight_buffer4[i*16+15:i*16], sum_temp_4[i], sum_temp_4[i+1]);
				multi_add mult_inst5 ( data_buffer[i*16+15:i*16], weight_buffer5[i*16+15:i*16], sum_temp_5[i], sum_temp_5[i+1]);
				multi_add mult_inst6 ( data_buffer[i*16+15:i*16], weight_buffer6[i*16+15:i*16], sum_temp_6[i], sum_temp_6[i+1]);
				multi_add mult_inst7 ( data_buffer[i*16+15:i*16], weight_buffer7[i*16+15:i*16], sum_temp_7[i], sum_temp_7[i+1]);
				multi_add mult_inst8 ( data_buffer[i*16+15:i*16], weight_buffer8[i*16+15:i*16], sum_temp_8[i], sum_temp_8[i+1]);
				multi_add mult_inst9 ( data_buffer[i*16+15:i*16], weight_buffer9[i*16+15:i*16], sum_temp_9[i], sum_temp_9[i+1]);
				multi_add mult_inst10 ( data_buffer[i*16+15:i*16], weight_buffer10[i*16+15:i*16], sum_temp_10[i], sum_temp_10[i+1]);
		  		multi_add mult_inst11 ( data_buffer[i*16+15:i*16], weight_buffer11[i*16+15:i*16], sum_temp_11[i], sum_temp_11[i+1]);
				multi_add mult_inst12 ( data_buffer[i*16+15:i*16], weight_buffer12[i*16+15:i*16], sum_temp_12[i], sum_temp_12[i+1]);				
				multi_add mult_inst13 ( data_buffer[i*16+15:i*16], weight_buffer13[i*16+15:i*16], sum_temp_13[i], sum_temp_13[i+1]);
				multi_add mult_inst14 ( data_buffer[i*16+15:i*16], weight_buffer14[i*16+15:i*16], sum_temp_14[i], sum_temp_14[i+1]);
				multi_add mult_inst15 ( data_buffer[i*16+15:i*16], weight_buffer15[i*16+15:i*16], sum_temp_15[i], sum_temp_15[i+1]);
				multi_add mult_inst16 ( data_buffer[i*16+15:i*16], weight_buffer16[i*16+15:i*16], sum_temp_16[i], sum_temp_16[i+1]);
		  end
endgenerate

//$display("sum_temp_1[16]=%b ",sum_temp_1[16]);
assign sum_output[31:0]=sum_temp_1[16][31:0];
assign sum_output[63:32]=sum_temp_2[16][31:0];
assign sum_output[95:64]=sum_temp_3[16][31:0];
assign sum_output[127:96]=sum_temp_4[16][31:0];
assign sum_output[159:128]=sum_temp_5[16][31:0];
assign sum_output[191:160]=sum_temp_6[16][31:0];
assign sum_output[223:192]=sum_temp_7[16][31:0];
assign sum_output[255:224]=sum_temp_8[16][31:0];
assign sum_output[287:256]=sum_temp_9[16][31:0];
assign sum_output[319:288]=sum_temp_10[16][31:0];
assign sum_output[351:320]=sum_temp_11[16][31:0];
assign sum_output[383:352]=sum_temp_12[16][31:0];
assign sum_output[415:384]=sum_temp_13[16][31:0];
assign sum_output[447:416]=sum_temp_14[16][31:0];
assign sum_output[479:448]=sum_temp_15[16][31:0];
assign sum_output[511:480]=sum_temp_16[16][31:0];

/*always @(posedge clk)
begin
if(rst_n==0)
begin

end
$display("sum_temp_1[0]=%b ",sum_temp_1[0]);
$display("sum_temp_1[1]=%b ",sum_temp_1[1]);
$display("sum_temp_1[2]=%b ",sum_temp_1[2]);
$display("sum_temp_1[3]=%b ",sum_temp_1[3]);
$display("sum_temp_1[4]=%b ",sum_temp_1[4]);
$display("sum_temp_1[5]=%b ",sum_temp_1[5]);
$display("sum_temp_1[6]=%b ",sum_temp_1[6]);
$display("sum_temp_1[7]=%b ",sum_temp_1[7]);
$display("sum_temp_1[8]=%b ",sum_temp_1[8]);
$display("sum_temp_1[9]=%b ",sum_temp_1[9]);
$display("sum_temp_1[10]=%b ",sum_temp_1[10]);
$display("sum_temp_1[11]=%b ",sum_temp_1[11]);
$display("sum_temp_1[12]=%b ",sum_temp_1[12]);
$display("sum_temp_1[13]=%b ",sum_temp_1[13]);
$display("sum_temp_1[14]=%b ",sum_temp_1[14]);
$display("sum_temp_1[15]=%b ",sum_temp_1[15]);
$display("sum_temp_1[16]=%b ",sum_temp_1[16]);
end	*/	 	
	  
endmodule
