`timescale 1 ns/ 100ps
module multi_inst (
	//dataa_sig,
	//datab_sig,
	result_sig);

wire [15:0] dataa_sig;
wire [15:0] datab_sig;
output [31:0] result_sig;

assign dataa_sig=16'b0001;
assign datab_sig=16'b0010;
reg clk;

initial
begin
clk=0;
end

always
begin
#10 clk = ~ clk;
end
multi	multi_inst (
	.dataa ( dataa_sig ),
	.datab ( datab_sig ),
	.result ( result_sig )
	);

endmodule

