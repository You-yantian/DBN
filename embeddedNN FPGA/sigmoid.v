module sigmoid (data,result_16);

	input [31:0] data;
	output [15:0] result_16;
	wire[31:0] abs_data, mult_val, add_val, mult_result, lin_result,result_32;

	assign abs_data = data[31] ? (~data +32'h0000_0001) : data;

	assign mult_val = (abs_data < 32'h0100_0000) ? 32'h0040_0000 : // 0.25
					  (abs_data < 32'h0260_0000) ? 32'h0020_0000 : // 0.125
					  (abs_data < 32'h0500_0000) ? 32'h0008_0000 : // 0.03125
					  32'h0000_0000; // 0.0
	assign add_val =  (abs_data < 32'h0100_0000) ? 32'h0080_0000 : // 0.5
					  (abs_data < 32'h0260_0000) ? 32'h00A0_0000 : // 0.625
					  (abs_data < 32'h0500_0000) ? 32'h00D8_0000 : // 0.84375
					  32'h0100_0000; // 1.0

	fixed_point_multiplier  fpm(
		.dataa(abs_data),
		.datab(mult_val),
		.result(mult_result));

	// Shift over all bits appropriately and add

	assign lin_result = mult_result + add_val;

	assign result_32 = data[31] ? (32'h0100_0000 - lin_result) : lin_result;
	
	assign result_16={1'b0, result_32[26:12]};

endmodule
