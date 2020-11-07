// ----------- ---------- candy_vending_testcaseDQ.sv	candy_vending_testcaseDQ	candy_vending_seqDQ ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_tests/candy_vending_testcaseDQ.sv ----------- ---------- 
class candy_vending_testcaseDQ extends uvm_test;
	`uvm_component_utils(candy_vending_testcaseDQ)

	candy_vending_env env;

	function new (string name = "", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase);
		super.build_phase (phase);

		//env = candy_vending_env::type_id::create("env",this);
		env = new("env",this);
		//seqDQ = candy_vending_seqDQ::type_id::create("seq",this);

	endfunction

	task run_phase (uvm_phase phase);

		candy_vending_seqDQ seqDQ;

		phase.raise_objection (this);


			seqDQ = new ("seqDQ");

			seqDQ.start (env.ag.sqr);


			#30ns;

		phase.drop_objection (this);


	endtask

endclass
