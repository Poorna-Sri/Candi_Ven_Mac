// FILE D:/uvm_proj/candy_vending/candy_vending_sequencer.sv
class candy_vending_sequencer extends uvm_sequencer #(candy_vending_seq_items);
	//`uvm_component_utils(candy_vending_sequencer)

	function new (string name = "candy_vending_sqr", uvm_component parent);
		super.new(name,parent);
	endfunction
	
endclass
