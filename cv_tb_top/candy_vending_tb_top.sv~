// FILE D:/uvm_proj/candy_vending/candy_vending_tb_top.sv 
`timescale 1ns/1ns
import uvm_pkg::*;
//`include "uvm_macros.svh"

 `include "D:/uvm_proj/candy_vending_DV/cv_tb_top/candy_vending_tb_pkg.sv" // --> wrong
import candy_vending_tb_pkg::*;

module candy_vending_tb_top;

	bit clock = 0;
	bit reset;
	
	always #5 clock = ~clock;

	initial begin
		reset = 0;
		#3;
		reset = 1;
	end

	candy_vending_if dut_if(clock,reset);

	candy_vending_dut U1	(
		.rst(reset),
		.clk(clock),
    .if_ports(dut_if.DUT)
	);

	// set method
  initial begin
	  //uvm_config_db#(virtual candy_vending_if)::set(null,"*","top_tb_vif",dut_vif);
	  uvm_config_db#(virtual candy_vending_if.DRIVER)::set(null,"*","driver_vif",dut_if.DRIVER);
	  uvm_config_db#(virtual candy_vending_if.MONITOR)::set(null,"*","monitor_vif",dut_if.MONITOR);
  end

	initial begin
		run_test();
		//run_test("candy_vending_full_auto_testcase");
	end

endmodule

//vsim +UVM_TESTNAME=candy_vending_testcase1  -voptargs=+acc work.candy_vending_tb_top
