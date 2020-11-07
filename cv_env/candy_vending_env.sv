// FILE D:/uvm_proj/candy_vending/candy_vending_env.sv
class candy_vending_env extends uvm_env;
	//`uvm_component_utils(candy_vending_env)

	// declare the agent which has all the underlying components
	candy_vending_agent ag;

	// declare the scoreboard
	candy_vending_scoreboard candy_vending_sb;

  // declaration for top_sb
  candy_vending_top_scoreboard top_sb;

	// configuration class declaration
	candy_vending_configuration env_cfg;

  // coverage class declaration
  candy_vending_coverage fun_cov;

	// constructor
	function new (string name = "candy_vending_env", uvm_component parent);
		super.new(name,parent);
		env_cfg = new ("env_cfg");
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db#(candy_vending_configuration)::set(null,"*","config",env_cfg);
		//ag = candy_vending_agent::type_id::create("ag",this);
		//candy_vending_sb = candy_vending_scoreboard::type_id::create("candy_vending_sb",this);
    //fun_cov = candy_vending_coverage::type_id::create("fun_cov",this); 
    //top_sb = candy_vending_top_scoreboard::type_id::create("top_sb",this); 

		ag = new("ag",this);
		candy_vending_sb = new("candy_vending_sb",this);
    fun_cov = new("fun_cov",this);
    top_sb = new("top_sb",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		// connect the agents port and the scoreboard's port
		ag.ag_port.connect(candy_vending_sb.item_collect_port);

    // connect the agents port and the coverage class's port
    ag.ag_port.connect(fun_cov.item_collect_port);

   // // connecting agents ag_drv2prd port to top_sb
    ag.ag_drv2prd.connect(top_sb.drv2sb_txport);

   // // connecting agents ag_port, (monitor port) to top_sb
    ag.ag_port.connect(top_sb.mon2sb_txport);


	endfunction

	function void report();
		// This function checks if any error has occured during the run time
		// and it takes a count of it
		// it will report that the test has failed if it has any reported error
		uvm_report_server reportServer = uvm_report_server::get_server();

		$display("");
		// report_header();
		// report_summarize();
		$display("");

		$display("---Final Test Status---");

		assert(reportServer.get_severity_count(UVM_FATAL) == 0 && reportServer.get_severity_count(UVM_ERROR) == 0) begin
			$display("**************************************");
			$display("	TESTCASE STATUS:		PASSED	");
			$display("**************************************");
		end
		else begin
			$display("**************************************");
			$display("	TESTCASE STATUS:		FAILED	");
			$display("**************************************");
		end
	endfunction

endclass
