module testbench_top();

logic clk, rst;
logic[1:0] sw; //address for instruction memory
logic[31:0] ALUResult;
logic[31:0] RD1, RD2;
logic[31:0] prode_register_file;

top uut(
clk, rst,
sw, //address for instruction memory
ALUResult,
RD1, RD2,
prode_register_file
);

initial begin
	rst = 0;
	#50 rst = 1;
end

initial begin
	clk = 0;
	forever #25 clk = ~clk;
end

initial begin
	sw = 0;
	#100
	sw = 1;
	#100
	sw = 2;
end

endmodule