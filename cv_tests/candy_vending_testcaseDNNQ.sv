// ----------- ---------- candy_vending_testcaseDNNQ.sv	candy_vending_testcaseDNNQ	candy_vending_seqDNNQ ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_tests/candy_vending_testcaseDNNQ.sv ----------- ---------- 
class candy_vending_testcaseDNNQ extends uvm_test;
	`uvm_component_utils(candy_vending_testcaseDNNQ)

	candy_vending_env env;

	function new (string name = "", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase);
		super.build_phase (phase);

		//env = candy_vending_env::type_id::create("env",this);
		env = new("env",this);
		//seqDNNQ = candy_vending_seqDNNQ::type_id::create("seq",this);

	endfunction

	task run_phase (uvm_phase phase);

		candy_vending_seqDNNQ seqDNNQ;

		phase.raise_objection (this);


			seqDNNQ = new ("seqDNNQ");

			seqDNNQ.start (env.ag.sqr);


			#30ns;

		phase.drop_objection (this);


	endtask

endclass
