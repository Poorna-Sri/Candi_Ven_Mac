// FILE D:/uvm_proj/candy_vending/candy_vending_pkg.sv
`include "D:/uvm_proj/candy_vending_DV/cv_tb_top/candy_vending_if.sv"
`include "D:/uvm_proj/candy_vending_DV/cv_rtl/candy_vending_dut.sv"


`include "uvm_macros.svh"

package candy_vending_tb_pkg;

	import uvm_pkg::*;

	typedef enum {N = 5, D = 10, Q = 25} coin;
	//typedef enum {no_coin = 0, N = 5, D = 10, Q = 25} coin;

	`include "D:/uvm_proj/candy_vending_DV/cv_env/candy_vending_configuration.sv"
	`include "D:/uvm_proj/candy_vending_DV/cv_agent/candy_vending_seq_items.sv"
	`include "D:/uvm_proj/candy_vending_DV/cv_agent/candy_vending_sequencer.sv"
	`include "D:/uvm_proj/candy_vending_DV/cv_agent/candy_vending_driver.sv"
	`include "D:/uvm_proj/candy_vending_DV/cv_agent/candy_vending_monitor.sv"
	`include "D:/uvm_proj/candy_vending_DV/cv_agent/candy_vending_agent.sv"
	`include "D:/uvm_proj/candy_vending_DV/cv_env/candy_vending_coverage.sv"
	`include "D:/uvm_proj/candy_vending_DV/cv_env/candy_vending_scoreboard.sv"
  `include "D:/uvm_proj/candy_vending_DV/cv_env/candy_vending_sb_predictor.sv"
  `include "D:/uvm_proj/candy_vending_DV/cv_env/candy_vending_sb_comparator.sv"
  `include "D:/uvm_proj/candy_vending_DV/cv_env/candy_vending_top_scoreboard.sv"
	`include "D:/uvm_proj/candy_vending_DV/cv_env/candy_vending_env.sv"
	`include "D:/uvm_proj/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seq_list.sv"
	`include "D:/uvm_proj/candy_vending_DV/cv_tests/candy_vending_testcase_list.sv"

endpackage
