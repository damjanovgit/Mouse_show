
module urs_0 (
	clk_clk,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	to_hex_0_readdata,
	to_hex_1_readdata,
	to_hex_2_readdata,
	to_hex_3_readdata,
	to_hex_4_readdata,
	to_hex_5_readdata);	

	input		clk_clk;
	output	[14:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[31:0]	memory_mem_dq;
	inout	[3:0]	memory_mem_dqs;
	inout	[3:0]	memory_mem_dqs_n;
	output		memory_mem_odt;
	output	[3:0]	memory_mem_dm;
	input		memory_oct_rzqin;
	output	[6:0]	to_hex_0_readdata;
	output	[6:0]	to_hex_1_readdata;
	output	[6:0]	to_hex_2_readdata;
	output	[6:0]	to_hex_3_readdata;
	output	[6:0]	to_hex_4_readdata;
	output	[6:0]	to_hex_5_readdata;
endmodule
