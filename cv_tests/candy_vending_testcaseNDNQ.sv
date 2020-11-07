// ----------- ---------- candy_vending_testcaseNDNQ.sv	candy_vending_testcaseNDNQ	candy_vending_seqNDNQ ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_tests/candy_vending_testcaseNDNQ.sv ----------- ---------- 
class candy_vending_testcaseNDNQ extends uvm_test;
	`uvm_component_utils(candy_vending_testcaseNDNQ)

	candy_vending_env env;

	function new (string name = "", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase);
		super.build_phase (phase);

		//env = candy_vending_env::type_id::create("env",this);
		env = new("env",this);
		//seqNDNQ = candy_vending_seqNDNQ::type_id::create("seq",this);

	endfunction

	task run_phase (uvm_phase phase);

		candy_vending_seqNDNQ seqNDNQ;

		phase.raise_objection (this);


			seqNDNQ = new ("seqNDNQ");

			seqNDNQ.start (env.ag.sqr);


			#30ns;

		phase.drop_objection (this);


	endtask

endclass
