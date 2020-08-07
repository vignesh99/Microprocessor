`timescale 1ns / 1ps
module EU(
input [3:0] opcode,
input rd,wr,
input [2:0] ade_bus,
input [2:0] ad_mov,
input [7:0] idt_bus,
input clk_eu,
output reg [8:0] result,
output reg [1:0] flag);
reg [7:0] eu_mem [7:0];
reg [7:0] A;
reg [7:0] B;
wire [7:0] w_A ;
reg [7:0] wA;

wire [7:0] w_B ;
reg [7:0] wB;

wire [3:0] w_op;
reg [3:0] wop;

wire [8:0] result1;
reg [8:0] result_1;

wire [1:0] flag1;
reg [1:0] flag_1;
assign w_A = wA;
assign w_B = wB;
assign w_op = wop;


always @(*)  begin
	result = result1;
	eu_mem[2] = result1;
end
always @(*)  begin
	flag = flag1;
end

ALU eu_alu(.A(w_A),
	.B(w_B),
	.opcode(w_op),
	.ALU_out(result1),
	.flag(flag1)
	);

always @ (posedge clk_eu)
begin
if(rd) begin //READ_REG
result = eu_mem[ade_bus];
end

if(wr) begin //WRITE_REG
eu_mem[ade_bus] = idt_bus;
end

if(opcode == 4'b1011)  begin   //MOV_REG
eu_mem[ade_bus] = eu_mem[ad_mov];
end

if((~rd)&&(~wr)) begin //ALU_FUNC
	wA = eu_mem[0];
	wB = eu_mem[1];
	wop = opcode;
	
end
end
endmodule


