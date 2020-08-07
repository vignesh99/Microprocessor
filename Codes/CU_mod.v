`timescale 1ns / 1ps

module CU(
	input [14:0] pgm_mem,
	input clk_cu,
	output reg [8:0] result,
	output reg [1:0] flag 
	);

wire [7:0] dt_test1;
reg [7:0] dttest1;

wire [7:0] dt_test2;
reg [7:0] dttest2;

wire [7:0] dt_test3;
reg [7:0] dttest3;

wire rd_test1;
reg rdtest1;

wire rd_test2;
reg rdtest2;

wire wr_test1;
reg wrtest1;

wire wr_test2;
reg wrtest2;

wire [4:0] ad_test1;
reg [4:0] adtest1;

wire [2:0] ad_test2;
reg [2:0] adtest2;

wire [2:0] ad_test3;
reg [2:0] adtest3;

wire clk_eu;
reg clkeu;

wire clk_mem;

wire [8:0] result_eu;
reg [8:0] resulteu;

wire [3:0] opcode_eu;
reg [3:0] opcodeeu;

wire [1:0] flag_eu;
assign dt_test2 = dttest2;
assign dt_test3 = dttest3;
assign rd_test1 = rdtest1;
assign rd_test2 = rdtest2;
assign wr_test1 = wrtest1;
assign wr_test2 = wrtest2;
assign ad_test1 = adtest1;
assign ad_test2 = adtest2;
assign ad_test3 = adtest3;
assign clk_eu = clk_cu;
assign clk_mem = clk_cu;
assign opcode_eu = opcodeeu;
always @(*)  begin
	result = result_eu;
end
always @(*)  begin
	flag = flag_eu;
end
always @(*)  begin
	dttest1 = dt_test1;
end

Memory Mem_1(  .rdm(rd_test1),
 		.wrm(wr_test1),
 		.clk_mem(clk_mem),
 		.ad_bus(ad_test1),
 		.idt_bus(dt_test3),
 		.odt_bus(dt_test1)
		);
		
 EU eu_1( .rd(rd_test2),
 	.wr(wr_test2),
 	.ade_bus(ad_test2),
 	.ad_mov(ad_test3),
 	.clk_eu(clk_eu),
 	.idt_bus(dt_test2),
 	.opcode(opcode_eu),
 	.result(result_eu),
 	.flag(flag_eu)
 	);
	
always @ (posedge clk_cu)
begin
 
if(pgm_mem[14:11]==4'b1100) begin //LOAD_MEM
	adtest1 = pgm_mem[7:3];
	rdtest1 = 1'b1;
	wrtest1 = 1'b0;
	rdtest2 = 1'b0;
	wrtest2 = 1'b1;
	dttest2 = dttest1;
	adtest2 = pgm_mem[10:8];
	end
	
if(pgm_mem[14:11]==4'b1101) begin //STR
	adtest2 = pgm_mem[10:8];
	adtest1 = pgm_mem[7:3];
	rdtest2 = 1'b1;
	wrtest2 = 1'b0;
	rdtest1 = 1'b0; 
	wrtest1 = 1'b1;
	
	end

if(pgm_mem[14:11]==4'b1011) begin //MOV
	opcodeeu = pgm_mem[14:11];
	adtest2 = pgm_mem[10:8];
	adtest3 = pgm_mem[7:5];
	end

if(pgm_mem[14:11]==4'b1110) begin //LOAD_DIR
	rdtest2 = 1'b0;
	wrtest2 = 1'b1;
	dttest2 = pgm_mem[7:0];
	adtest2 = pgm_mem[10:8];
	end
	
if((pgm_mem[14:11]<4'b1011)&&(pgm_mem[14:11]>4'b0000)) begin //ALU_FUNC  
	rdtest2 = 1'b0;
	wrtest2 = 1'b0;
	opcodeeu = pgm_mem[14:11];
	result = resulteu;
	end
end


endmodule	

 
 	
		
 		
	
