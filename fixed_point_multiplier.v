module fixed_point_multiplier (dataa, datab,result);

	input [31:0] dataa, datab;
	output [31:0] result;
	wire[63:0] rawResult;

	multi_32 int1int2(
		.dataa(dataa),
		.datab(datab),
		.result(rawResult));


	// Shift over all bits appropriately and add

	assign result ={rawResult[63],rawResult[54:24]};

endmodule
