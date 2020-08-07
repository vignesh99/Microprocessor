`timescale 1ns / 1ps

module Pgm_memory(input [4:0] adp_bus,
		input wr,rd,
		input clk_pgm,
		output reg [14:0] pgm_line   //(opcode)(add_reg)(add_mem)(data)
		);
reg [14:0] pgm_memory [31:0];
initial begin

/*pgm_memory[0] = 15'b111000001000010;  //checking MOV
pgm_memory[1] = 15'b111000001000010;
pgm_memory[2] = 15'b111001000011000;
pgm_memory[3] = 15'b101100101000000;
pgm_memory[4] = 15'b000100000000000;*/

/*pgm_memory[0] = 15'b111000001000010;  
pgm_memory[1] = 15'b111000100011000;  
pgm_memory[2] = 15'b111000100011000;
pgm_memory[3] = 15'b110100000010000;
pgm_memory[4] = 15'b110000100000000;*/

/*pgm_memory[0] = 15'b111000001000010;  //checking JMP
pgm_memory[1] = 15'b111000001000010;
pgm_memory[2] = 15'b111000100011000;
pgm_memory[3] = 15'b000100000000000;
pgm_memory[4] = 15'b111000000000010;
pgm_memory[5] = 15'b111000100000001;
pgm_memory[6] = 15'b000100000000000;
pgm_memory[7] = 15'b000000000000000;*/

/*pgm_memory[0] = 15'b111000101000010;  //checking ALU
pgm_memory[1] = 15'b111000100001010;
pgm_memory[2] = 15'b111000000001000;
pgm_memory[3] = 15'b000100101000000;*/

/*pgm_memory[2] = 15'b110000100000000;
pgm_memory[3] = 15'b001000000000000;*/
//pgm_memory[2] = 15'b110100000010000;
//pgm_memory[3] = 15'b101101000110000;

/*pgm_memory[0] = 15'b111000000000001;  //checking ALU
pgm_memory[1] = 15'b111000000000001;
pgm_memory[2] = 15'b111000100000010;
pgm_memory[3] = 15'b111001100000011;
pgm_memory[4] = 15'b111010000000100;
pgm_memory[5] = 15'b111010100000101;
pgm_memory[6] = 15'b000100000000000;
pgm_memory[7] = 15'b101100001000000;
pgm_memory[8] = 15'b101100101100000;
pgm_memory[9] = 15'b000100000000000;  //add
pgm_memory[10] = 15'b101100001000000; //move result to r0
pgm_memory[11] = 15'b101100110000000;  //move value to r1
pgm_memory[12] = 15'b000100000000000;  //add
pgm_memory[13] = 15'b101100001000000; //move result to r0
pgm_memory[14] = 15'b101100110100000; */ //move value to r1  

pgm_memory[0] = 15'b111000000000001;  //Factorial code
pgm_memory[1] = 15'b111010100000101;  //LD data to R5
pgm_memory[2] = 15'b111010000000001;  //LD data to R4
pgm_memory[3] = 15'b111001100000001;  //LD data to R3
pgm_memory[4] = 15'b101100010100000;  //
pgm_memory[5] = 15'b101100110000000;
pgm_memory[6] = 15'b101001100000001;
pgm_memory[7] = 15'b101110001000000;
pgm_memory[8] = 15'b101100101100000;
pgm_memory[9] = 15'b001000101100000;
pgm_memory[10] = 15'b101110101000000;
pgm_memory[11] = 15'b101100010100000;
pgm_memory[12] = 15'b101100101100000;
pgm_memory[13] = 15'b100100110000000;
pgm_memory[14] = 15'b000000100100000;


end

always@ (posedge clk_pgm)
begin
pgm_line = pgm_memory[adp_bus];
end

endmodule

//1110 -- LOAD_DIR
//1100 -- LOAD_MEM
//1101 -- STR
//1011 --  MOV
//0000 -- JMP		
