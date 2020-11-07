// ----------- ---------- candy_vending_testcaseNQ.sv	candy_vending_testcaseNQ	candy_vending_seqNQ ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_tests/candy_vending_testcaseNQ.sv ----------- ---------- 
class candy_vending_testcaseNQ extends uvm_test;
	`uvm_component_utils(candy_vending_testcaseNQ)

	candy_vending_env env;

	function new (string name = "", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase);
		super.build_phase (phase);

		//env = candy_vending_env::type_id::create("env",this);
		env = new("env",this);
		//seqNQ = candy_vending_seqNQ::type_id::create("seq",this);

	endfunction

	task run_phase (uvm_phase phase);

		candy_vending_seqNQ seqNQ;

		phase.raise_objection (this);


			seqNQ = new ("seqNQ");

			seqNQ.start (env.ag.sqr);


			#30ns;

		phase.drop_objection (this);


	endtask

endclass
