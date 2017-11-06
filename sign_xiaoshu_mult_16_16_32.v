module mult16(clk,en,rst_n,xin1_16,xin2_16,sum_in_32,yout_32);

parameter width_in1=16,width_in2=16,width_out=32;

input clk,en,rst_n;
input [width_in1-1:0] xin1_16;
input [width_in2-1:0] xin2_16;
input [width_out-1:0] sum_in_32;
output [width_out-1:0] yout_32;


reg [width_out-1:0] ytemp_32;
reg flag;
reg [width_in1-1:0] xin1_16_yuan;
reg [width_in2-1:0] xin2_16_yuan;
wire [width_out-3:0] xsum_30_temp;
reg [width_out-3:0] xsum_30;
reg [width_out-1:0] xsum_flag_32;

multi multi_decimal (
	.dataa ( xin1_16_yuan[14:0] ),
	.datab ( xin2_16_yuan[14:0] ),
	.result ( xsum_30_temp)
);

adder add_sum(
   .dataa (ytemp_32),
	.datab (sum_in_32),
	.result (yout_32)
);	

always @(posedge clk)
begin
 if(!rst_n)
 begin
  yout_32 <= 32'b0;//d
  flag <= 1'b0;
  xin1_16_yuan <= 16'b0;//d
  xin2_16_yuan <= 16'b0;//d
  xsum_30 <= 30'b0;//d
  xsum_flag_32 <= 32'b0;//d
 end
 else if(en)
 begin
   //补码变原码
   xin1_16_yuan <= (xin1_16[15]==1)? {xin1_16[15] ,~xin1_16[14:0]+1'b1} : xin1_16;
   xin2_16_yuan <= (xin2_16[15]==1)? {xin2_16[15] ,~xin2_16[14:0]+1'b1} : xin2_16;
	//判断乘积的正负
   flag <= xin1_16_yuan[15] ^ xin2_16_yuan[15];
	//小数乘法
	xsum_30<=xsum_30_temp;
	//原码表示的积,第一位为符号位,其它位为数据位
   xsum_flag_32 <= {flag,xsum_30,1'b0};
   //原码转为补码
   ytemp_32 <= xsum_flag_32[31] ? {xsum_flag_32[31],~xsum_flag_32[30:0]+1'b1} : xsum_flag_32;
 end
 else
 begin
  yout_32 <= 32'b0;//d
  flag <= 1'b0;
  xin1_16_yuan <= 16'b0;//d
  xin2_16_yuan <= 16'b0;//d
  xsum_30 <= 30'b0;//d
  xsum_flag_32 <= 32'b0;//d
 end
end

endmodule
