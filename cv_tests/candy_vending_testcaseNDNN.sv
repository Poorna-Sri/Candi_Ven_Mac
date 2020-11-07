// ----------- ---------- candy_vending_testcaseNDNN.sv	candy_vending_testcaseNDNN	candy_vending_seqNDNN ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_tests/candy_vending_testcaseNDNN.sv ----------- ---------- 
class candy_vending_testcaseNDNN extends uvm_test;
	`uvm_component_utils(candy_vending_testcaseNDNN)

	candy_vending_env env;

	function new (string name = "", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase);
		super.build_phase (phase);

		//env = candy_vending_env::type_id::create("env",this);
		env = new("env",this);
		//seqNDNN = candy_vending_seqNDNN::type_id::create("seq",this);

	endfunction

	task run_phase (uvm_phase phase);

		candy_vending_seqNDNN seqNDNN;

		phase.raise_objection (this);


			seqNDNN = new ("seqNDNN");

			seqNDNN.start (env.ag.sqr);


			#30ns;

		phase.drop_objection (this);


	endtask

endclass
