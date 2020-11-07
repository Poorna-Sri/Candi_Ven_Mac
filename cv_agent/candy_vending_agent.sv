// FILE D:/uvm_proj/candy_vending/candy_vending_agent.sv
class candy_vending_agent extends uvm_agent;
	//`uvm_component_utils(candy_vending_agent)

	// declare an analysis port
	uvm_analysis_port#(candy_vending_seq_items) ag_port;
	uvm_analysis_port#(candy_vending_seq_items) ag_drv2prd;

	// declare the components - driver, monitor and sequencer
	candy_vending_sequencer sqr;
	candy_vending_driver dvr;
	candy_vending_monitor mon;

	// constructor
	function new (string name = "candy_vending_agt", uvm_component parent);
		super.new (name,parent);
		ag_port = new("ag_port",this);
ag_drv2prd =  new("ag_drv2prd",this);
	endfunction

	function void build_phase (uvm_phase phase);

		super.build_phase(phase);
		//sqr = candy_vending_sequencer::type_id::create("sqr",this);
		//dvr = candy_vending_driver::type_id::create("dvr",this);
		//mon = candy_vending_monitor::type_id::create("mon",this);

		sqr = new("sqr",this);
		dvr = new("dvr",this);
		mon = new("mon",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		// connects the components together

		// connect sequencer to driver
		dvr.seq_item_port.connect(sqr.seq_item_export);

    // connecting driver to agent
     dvr.drv2prd.connect(ag_drv2prd);

		// connect the analysis port of monitor to agent's analysis port
		mon.m_port.connect(ag_port);
	endfunction

endclass
