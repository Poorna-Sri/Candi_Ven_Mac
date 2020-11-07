// FILE D:/uvm_proj/candy_vending/candy_vending_driver.sv
class candy_vending_driver extends uvm_driver#(candy_vending_seq_items);
	//`uvm_component_utils(candy_vending_driver);

  uvm_analysis_port #(candy_vending_seq_items) drv2prd;

	// Declare the interface
	//virtual candy_vending_if d_vif;
	virtual candy_vending_if.DRIVER driver_vif;

	// handle for sequence items
	candy_vending_seq_items d_tx;

	// if u hav a specific class for configuring/sharing items within testbench
	// declare and have a handle for the config class
	candy_vending_configuration d_cfg;

	// constructor
	function new (string name = "candy_vending_driver",uvm_component parent);
		super.new(name,parent);
    drv2prd = new("drv2prd", this);
	endfunction

	function void build_phase(uvm_phase phase);

		super.build_phase(phase);

// Stand-alone call to function 'get' treated as implicit void cast
		void'(uvm_config_db#(candy_vending_configuration)::get(this,"","config",d_cfg));

		// it is very important to get the interface information from the config db
		if (!uvm_config_db#(virtual candy_vending_if.DRIVER)::get(this,"","driver_vif",driver_vif))
			`uvm_fatal("NO_VIF",{"Virtual interface NOT SET for: " ,get_full_name(),".vif"});

		`uvm_info("VIF",$sformatf ("Virtual interface for driver set ! "),UVM_LOW);



	endfunction

	virtual task run_phase(uvm_phase phase);
			@(driver_vif.driver_cb) driver_vif.driver_cb.nickel <= 0;
			driver_vif.driver_cb.dime <= 0;
			driver_vif.driver_cb.quarter <= 0;
      driver_vif.driver_cb.cancel <= 0;
		forever begin
			seq_item_port.get_next_item(d_tx);

       drv2prd.write(d_tx);

			d_cfg.total_amt = 0;

			// initial state
			`uvm_info("DRIVER",$sformatf ("Driver at init state! "),UVM_LOW);

			d_cfg.number_of_coins= 0;
      foreach (d_tx.coins[i]) begin
			d_cfg.number_of_coins++;
      end

			// Start driving the ports of the DUT with inputs
			drive();

			seq_item_port.item_done(d_tx);
			seq_item_port.put(d_tx);
		end
	endtask

	task drive ();

	// Describe the driving logic
			// for (int i = 4; i>= 0; i--) begin
			for (int i = 0; i<= d_cfg.number_of_coins-1; i++) begin

                  @(driver_vif.driver_cb);
                  @(driver_vif.driver_cb);
                  
				case (d_tx.coins[i])
								
								0: begin
		  					`uvm_info("DRIVER",$sformatf ("No coin ! "),UVM_LOW);
                  @(driver_vif.driver_cb);
                  @(driver_vif.driver_cb);
								end
								
								5: begin
									@(driver_vif.driver_cb) driver_vif.driver_cb.nickel <= 1;
									d_cfg.total_amt = d_cfg.total_amt +5;
		  					`uvm_info("DRIVER",$sformatf ("dropping nickel coin !"),UVM_LOW);
									driver_vif.driver_cb.dime <= 0;
									driver_vif.driver_cb.quarter <= 0;
									@(driver_vif.driver_cb) driver_vif.driver_cb.nickel <= 0;
								end
								
								10: begin
									@(driver_vif.driver_cb) driver_vif.driver_cb.nickel <= 0;
									driver_vif.driver_cb.dime <= 1;
									d_cfg.total_amt = d_cfg.total_amt +10;
		  					`uvm_info("DRIVER",$sformatf ("dropping dime coin !"),UVM_LOW);
									driver_vif.driver_cb.quarter <= 0;
									@(driver_vif.driver_cb) driver_vif.driver_cb.dime <= 0;
								end

								25: begin
									@(driver_vif.driver_cb) driver_vif.driver_cb.nickel <= 0;
									driver_vif.driver_cb.dime <= 0;
									driver_vif.driver_cb.quarter <= 1;
									d_cfg.total_amt = d_cfg.total_amt +25;
		  					`uvm_info("DRIVER",$sformatf ("dropping quarter coin !"),UVM_LOW);
									@(driver_vif.driver_cb) driver_vif.driver_cb.quarter <= 0;
								end
				endcase

				if (i == d_cfg.number_of_coins-1)	begin
					`uvm_info("DRIVER",$sformatf ("Dropped all the coins in the sequence array ! "),UVM_LOW);

						if(d_tx.cancel) begin
							@(driver_vif.driver_cb) driver_vif.driver_cb.cancel <= 1;
		  			`uvm_info("DRIVER",$sformatf ("Asserting Cancel Button !"),UVM_LOW);
							@(driver_vif.driver_cb) driver_vif.driver_cb.cancel<= 0;
						end

					  repeat (24) @(driver_vif.driver_cb);
		        `uvm_info("DRIVER",$sformatf ("Scoreboard start\n"),UVM_LOW);
            d_cfg.sb_compare = 1;
            wait (!d_cfg.sb_compare);
				end

		end

	endtask

endclass
