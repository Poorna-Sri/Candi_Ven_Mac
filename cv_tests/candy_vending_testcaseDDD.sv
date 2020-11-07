// ----------- ---------- candy_vending_testcaseDDD.sv	candy_vending_testcaseDDD	candy_vending_seqDDD ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_tests/candy_vending_testcaseDDD.sv ----------- ---------- 
class candy_vending_testcaseDDD extends uvm_test;
	`uvm_component_utils(candy_vending_testcaseDDD)

	candy_vending_env env;

	function new (string name = "", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase);
		super.build_phase (phase);

		//env = candy_vending_env::type_id::create("env",this);
		env = new("env",this);
		//seqDDD = candy_vending_seqDDD::type_id::create("seq",this);

	endfunction

	task run_phase (uvm_phase phase);

		candy_vending_seqDDD seqDDD;

		phase.raise_objection (this);


			seqDDD = new ("seqDDD");

			seqDDD.start (env.ag.sqr);


			#30ns;

		phase.drop_objection (this);


	endtask

endclass
