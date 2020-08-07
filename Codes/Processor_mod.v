`timescale 1ns / 1ps
module HIGH(input clk,
	output reg [8:0] result_main,
	output reg [1:0] flag_main
	);
reg [4:0] pgm_ctr;

wire clk_test1;
wire clk_test2;

wire [8:0] result_1;
reg [8:0] result1;

wire [1:0] flag_1;
reg [1:0] flag1;

wire [14:0] pmem_test1;
reg [14:0] pmemtest1;

wire [14:0] pmem_test2;
reg [14:0] pmemtest2;

wire [4:0] adp_test1;

assign clk_test1 = clk;
assign clk_test2 = clk;

assign adp_test1 = pgm_ctr;


always @(*)  begin
	result_main = result_1;
end
always @(*)  begin
	flag_main = flag_1;
end
always @(*)  begin
	pmemtest1 = pmem_test1;
end

CU cu_main(.pgm_mem(pmem_test1),
	.clk_cu(clk_test1),
	.result(result_1),
	.flag(flag_1)
	);
Pgm_memory pgm_1(.adp_bus(adp_test1),
	.clk_pgm(clk_test2),
	.pgm_line(pmem_test1)
	);

initial begin
pgm_ctr = 5'b00000;
end


always @(posedge clk)
begin
if((pmemtest1[14:11] == 4'b0000) && flag_main[1]==1) 
begin
pgm_ctr = pmemtest1[7:3];
end

else  begin
pgm_ctr = pgm_ctr + 5'b00001;
end
end
endmodule
