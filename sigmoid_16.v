module sigmoid_16(sum_input,sigmoid_output);

parameter sigmoid_size=256,sum_size=512;
genvar i;
//input en;
input [sum_size-1:0] sum_input;
output [sigmoid_size-1:0] sigmoid_output;


generate
      
		  for(i=0;i<16;i=i+1)
        begin:sigmoid_change
		  sigmoid sigmoid_inst(
		  .data(sum_input[i*32+31:i*32]),
		  .result_16(sigmoid_output[i*16+15:i*16])
		  );
		  end
endgenerate


endmodule
