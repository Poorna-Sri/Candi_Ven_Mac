// ----------- ---------- candy_vending_testcaseDN.sv	candy_vending_testcaseDN	candy_vending_seqDN ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_tests/candy_vending_testcaseDN.sv ----------- ---------- 
class candy_vending_testcaseDN extends uvm_test;
	`uvm_component_utils(candy_vending_testcaseDN)

	candy_vending_env env;

	function new (string name = "", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase);
		super.build_phase (phase);

		//env = candy_vending_env::type_id::create("env",this);
		env = new("env",this);
		//seqDN = candy_vending_seqDN::type_id::create("seq",this);

	endfunction

	task run_phase (uvm_phase phase);

		candy_vending_seqDN seqDN;

		phase.raise_objection (this);


			seqDN = new ("seqDN");

			seqDN.start (env.ag.sqr);


			#30ns;

		phase.drop_objection (this);


	endtask

endclass
