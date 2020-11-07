// FILE D:/uvm_proj/candy_vending/candy_vending_monitor.sv
class candy_vending_monitor extends uvm_monitor;
	//`uvm_component_utils(candy_vending_monitor);

	// declare an analysis port
	uvm_analysis_port#(candy_vending_seq_items) m_port;

	//declare the interface
	//virtual candy_vending_if m_vif;
	virtual candy_vending_if.MONITOR monitor_vif;

	// handle for sequence items
	candy_vending_seq_items m_tx;

	// declare any necessary variables
	int mon_amt;
	int mon_chg;

	// if u hav a specific class for configuring/sharing items within testbench
	// declare and have a handle for the config class
	candy_vending_configuration m_cfg;

	// constructor
	function new (string name = "candy_vending_mon", uvm_component parent);
		super.new(name,parent);
		m_tx = new();
		m_port = new("m_port",this);
	endfunction

	function void build_phase(uvm_phase phase);
		// initialize values for the variables
		mon_amt = 0;
		mon_chg = 0;

		//m_cfg = candy_vending_configuration::type_id::create("m_cfg",this);

		super.build_phase(phase);

// Stand-alone call to function 'get' treated as implicit void cast
		void'(uvm_config_db#(candy_vending_configuration)::get(this,"","config",m_cfg));

		if(!uvm_config_db#(virtual candy_vending_if.MONITOR)::get(this,"","monitor_vif",monitor_vif))
		`uvm_fatal("NO_VIF",{"Virtual interface NOT SET for: " ,get_full_name(),".vif"});

	endfunction

	virtual task run_phase(uvm_phase phase);

		forever begin

			// Here, write the logic to get signals from the interface if the DUT
			// and respectively assign it to the appropriate seq items
      @(posedge monitor_vif.monitor_cb)
      //@(monitor_vif.monitor_cb)
		 					if (monitor_vif.monitor_cb.nickel) begin
                 m_tx.coins = new[m_tx.coins.size()+1](m_tx.coins);
                 m_tx.coins[m_tx.coins.size()-1] = N;
		   					`uvm_info("MONITOR",$sformatf ("Got a Nickel coin ! "),UVM_LOW);
		 					end

		 					if (monitor_vif.monitor_cb.dime) begin
                 m_tx.coins = new[m_tx.coins.size()+1](m_tx.coins);
                 m_tx.coins[m_tx.coins.size()-1] = D;
		   					`uvm_info("MONITOR",$sformatf ("Got a dime coin ! "),UVM_LOW);
		 					end

		 					if (monitor_vif.monitor_cb.quarter) begin
                 m_tx.coins = new[m_tx.coins.size()+1](m_tx.coins);
                 m_tx.coins[m_tx.coins.size()-1] = Q;
		   					`uvm_info("MONITOR",$sformatf ("Got a Quarter coin ! "),UVM_LOW);
		 					end

		 		      if (monitor_vif.monitor_cb.cancel) begin
          	`   uvm_info("MONITOR",$sformatf ("Cancel Asserted ! "),UVM_LOW);
                m_tx.cancel = 1;
		 		      end

		 		      if (monitor_vif.monitor_cb.candy) begin
                 m_tx.candy = 1;
          	    `uvm_info("MONITOR",$sformatf ("Candy Dispensed ! "),UVM_LOW);
		 		      end

		 		      if (monitor_vif.monitor_cb.d) begin
                 m_tx.change_ret = new[m_tx.change_ret.size()+1](m_tx.change_ret);
                 m_tx.change_ret[m_tx.change_ret.size()-1] = D;
		   	      	`uvm_info("MONITOR",$sformatf ("returning a dime coin ! "),UVM_LOW);
                mon_chg = m_tx.change_ret[m_tx.change_ret.size()-1] + mon_chg;
		 		      end

		 		      if (monitor_vif.monitor_cb.n) begin
                 m_tx.change_ret = new[m_tx.change_ret.size()+1](m_tx.change_ret);
                 m_tx.change_ret[m_tx.change_ret.size()-1] = N;
		   	      	`uvm_info("MONITOR",$sformatf ("Returning a nickel coin ! "),UVM_LOW);
                mon_chg = m_tx.change_ret[m_tx.change_ret.size()-1] + mon_chg;
		 		      end

        

              //if ((m_tx.coins.size() == m_cfg.number_of_coins ) && (!monitor_vif.monitor_cb.candy && !monitor_vif.monitor_cb.cancel && !monitor_vif.monitor_cb.n && !monitor_vif.monitor_cb.d)) begin
              //if ( m_tx.coins.size() == m_cfg.number_of_coins ) begin
              if (m_cfg.sb_compare == 1) begin
                  m_port.write(m_tx);
		            `uvm_info("MONITOR",$sformatf ("Scoreboard start\n"),UVM_LOW);
             //`uvm_info("MONITOR",$sformatf("change returned is %0d cents",mon_chg),UVM_LOW);
             `uvm_info(get_type_name(),m_tx.convert2string(),UVM_LOW);
                mon_chg = 0;
                m_tx = new();
                m_tx.cancel = 0;
                m_tx.candy = 0;
                //m_tx.change_ret = new();
                //m_tx.coins = new();
             end

              //if (m_tx.coins.size() == m_cfg.number_of_coins)begin
              //  wait (monitor_vif.monitor_cb.candy ||  monitor_vif.monitor_cb.cancel);
		          //    // write method is an inbuilt feature/function, that helps to handover
		          //    // the data collected by the montior, to the scoreboard 
              //    m_port.write(m_tx);
		          //    m_tx = new();
              //end
			//end

		end

	endtask
endclass

  /*
  task process_money;

		`uvm_info("MONITOR",$sformatf ("process_money task called !!"),UVM_LOW);
          if (monitor_vif.monitor_cb.candy) begin
          end

          if (monitor_vif.monitor_cb.cancel) begin
          end

    if (mon_amt >=25 || m_tx.cancel) begin
           //@(posedge monitor_vif.monitor_cb) begin
          if ((mon_amt >= 25) && (!m_tx.candy))begin
              // `uvm_error
		      		`uvm_info("MONITOR",$sformatf ("Candy Expected, but not dispensed..."),UVM_LOW);
          end

			`uvm_info("MONITOR",$sformatf ("Preparing to collect change/ return coins..."),UVM_LOW);
       collect_change;
    end

    else  begin
     	`uvm_error("MONITOR",$sformatf ("Candy wrongly Dispensed ! "));
			`uvm_error("MONITOR",$sformatf ("Amount collected is less than 25"));
			`uvm_error("MONITOR",$sformatf ("Preparing to collect change if any..."));
    end
  endtask

  task collect_change;

		`uvm_info("MONITOR",$sformatf ("collect_change task called !!"),UVM_LOW);
    forever begin :collection
       @(posedge monitor_vif.monitor_cb) begin

          if (!monitor_vif.monitor_cb.d && !monitor_vif.monitor_cb.n) begin
             `uvm_info("MONITOR",$sformatf("change returned is %0d cents",mon_chg),UVM_LOW);
             `uvm_info("MONITOR",$sformatf ("Ending collection ! "),UVM_LOW);
             disable collection;
          end

        end
    end
  endtask
*/
