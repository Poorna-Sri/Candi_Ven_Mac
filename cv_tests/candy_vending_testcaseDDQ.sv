// ----------- ---------- candy_vending_testcaseDDQ.sv	candy_vending_testcaseDDQ	candy_vending_seqDDQ ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_tests/candy_vending_testcaseDDQ.sv ----------- ---------- 
class candy_vending_testcaseDDQ extends uvm_test;
	`uvm_component_utils(candy_vending_testcaseDDQ)

	candy_vending_env env;

	function new (string name = "", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase);
		super.build_phase (phase);

		//env = candy_vending_env::type_id::create("env",this);
		env = new("env",this);
		//seqDDQ = candy_vending_seqDDQ::type_id::create("seq",this);

	endfunction

	task run_phase (uvm_phase phase);

		candy_vending_seqDDQ seqDDQ;

		phase.raise_objection (this);


			seqDDQ = new ("seqDDQ");

			seqDDQ.start (env.ag.sqr);


			#30ns;

		phase.drop_objection (this);


	endtask

endclass
