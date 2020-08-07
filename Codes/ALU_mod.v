`timescale 1ns / 1ps

module ALU( 
	input [7:0]A,
	 input [7:0]B,
	 input [3:0]opcode, 
	output reg [8:0]ALU_out
	,output reg [1:0]flag
	);
initial begin
flag[1]=1'b0;
end
wire [7:0] ao; 
always @ *
case(opcode) 
 4'b0001:  //ADD
 begin
 ALU_out = A + B;
 flag[0] = ALU_out[8];
 end
 4'b0010:  //SUBTRACT
 begin
 ALU_out =A - B; 
 flag[0] = ALU_out[8];
 end
 4'b0011:  //AND
 begin
 ALU_out = A&B; 
 flag[0] = 1'b0;
 end
 4'b0100:  //OR
 begin
 ALU_out = A|B; 
 flag[0] = 1'b0;
 end
 4'b0101:  //LEFT_SHIFT
 begin
 ALU_out= A<<1; 
 flag[0] = A[7];
 end
 4'b0110:  //RIGHT_SHIFT
 begin
 ALU_out = 1>>A;
 flag[0] = A[0];
 end
 4'b0111:  //XOR
 begin
 ALU_out = A^B;
 flag[0] = 1'b0;
 end 
 4'b1000:  //COMPLEMENT
 begin
 ALU_out = ~A;
 flag[0] = 1'b0;
 end 
 4'b1001:  //COMPARE
 begin
 if(A>B) begin
 flag[1] = 1'b1;
 end
 else  begin
 flag[1] = 1'b0;
 end
 flag[0] = 1'b0;
 end 
 4'b1010:  //MUL
 begin
 ALU_out = A*B;
 flag[0] = 1'b0;
 end  
 default:
 begin
 ALU_out = 9'b0;
 flag[0] = 1'b0;
 end
 endcase 
 endmodule 
