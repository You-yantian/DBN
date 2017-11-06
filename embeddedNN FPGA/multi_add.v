module multi_add(xin1_16,xin2_16,cin_32,yout_32);

parameter width_in1=16,width_in2=16,width_out=32;

input [width_in1-1:0] xin1_16;
input [width_in2-1:0] xin2_16;
input [width_out-1:0] cin_32;
output [width_out-1:0] yout_32;

wire [width_out-1:0] ytemp_32;

multi multi_decimal (
	.dataa ( xin1_16 ),
	.datab ( xin2_16),
	.result ( ytemp_32)
);

adder add_sum(
   .dataa (ytemp_32),
	.datab (cin_32),
	.result (yout_32)
);	


endmodule
