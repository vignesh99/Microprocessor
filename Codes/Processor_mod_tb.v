module HIGH_mod_tb;

	reg clk;
	
	wire [8:0] result_main;
	wire [1:0] flag_main;
	
	HIGH uut(
		.clk(clk),
		.result_main(result_main),
		.flag_main(flag_main)
		);
	initial begin
		$dumpfile("HIGH_mod.vcd");
		$dumpvars;
		clk = 0;
		
		forever begin
		clk = ~clk;
		#10;
		end
		$finish; 
	end
		
endmodule
