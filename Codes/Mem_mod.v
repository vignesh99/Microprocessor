`timescale 1ns / 1ps
module Memory(
input rdm ,wrm,
input clk_mem,
input [4:0] ad_bus,
input [7:0] idt_bus,
output reg [7:0] odt_bus); 
reg [7:0] dt_mem [0:31]; 

initial begin
dt_mem[0] = 8'b00011000;
dt_mem[1] = 8'b10011001;
end

always @(posedge clk_mem) 
begin 
if (rdm) begin   //RD_MEM
odt_bus = dt_mem [ad_bus]; 
end
if (wrm) begin  //WR_MEM
dt_mem [ad_bus] = idt_bus; 
end 
end
endmodule
