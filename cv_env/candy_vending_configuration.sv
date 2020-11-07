// FILE D:/uvm_proj/candy_vending/candy_vending_configuration.sv
class candy_vending_configuration extends uvm_object;

	//`uvm_object_utils(candy_vending_configuration)


	//	declare the necessary items which are required to set configuration

	int number_of_coins = 0;
	int total_amt = 0;
  int sb_compare = 0;

	function new (string cfg_name = "candy_vending_cfg");
		super.new(cfg_name);
	endfunction

	// Any function required may also be defined

endclass
