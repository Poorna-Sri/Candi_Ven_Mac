// ----------- ---------- candy_vending_testcaseNNNNN.sv	candy_vending_testcaseNNNNN	candy_vending_seqNNNNN ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_tests/candy_vending_testcaseNNNNN.sv ----------- ---------- 
class candy_vending_testcaseNNNNN extends uvm_test;
	`uvm_component_utils(candy_vending_testcaseNNNNN)

	candy_vending_env env;

	function new (string name = "", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase);
		super.build_phase (phase);

		//env = candy_vending_env::type_id::create("env",this);
		env = new("env",this);
		//seqNNNNN = candy_vending_seqNNNNN::type_id::create("seq",this);

	endfunction

	task run_phase (uvm_phase phase);

		candy_vending_seqNNNNN seqNNNNN;

		phase.raise_objection (this);


			seqNNNNN = new ("seqNNNNN");

			seqNNNNN.start (env.ag.sqr);


			#30ns;

		phase.drop_objection (this);


	endtask

endclass
