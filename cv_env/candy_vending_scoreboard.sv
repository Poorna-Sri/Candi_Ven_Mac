// FILE D:/uvm_proj/candy_vending/candy_vending_scoreboard.sv
class candy_vending_scoreboard extends uvm_scoreboard;

	//`uvm_component_utils(candy_vending_scoreboard)


	// declare an analysis imp port
	uvm_analysis_imp #(candy_vending_seq_items, candy_vending_scoreboard)item_collect_port;

	// declare a handle of seq_items_class or necessary variables
	// to capture monitor collected data
	candy_vending_seq_items sb_tx_items;
	coin ndq_items[];
	coin ndq_change[];
	bit candy;
	bit cancel;
	int  payment = 0, change =0, cnt = 0;
	candy_vending_configuration sb_cfg;

	// constuctor
	function new (string name = "candy_vending_sb", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase);
		super.build_phase(phase);
		item_collect_port = new("item_collect_port", this);
// Stand-alone call to function 'get' treated as implicit void cast
		void'(uvm_config_db#(candy_vending_configuration)::get(this,"","config",sb_cfg));
	endfunction

	function void write(candy_vending_seq_items stx);
		//`uvm_info("SCOREBOARD",$sformatf ("Write method called"),UVM_LOW);

		// assign the values of the seq items (obtained from write method
		// of monitor) to the declared variables/seq items through seq_items_class handle

 //    if ((stx.coins[stx.coins.size()-1] != 0)&& (ndq_items.size() < sb_cfg.number_of_coins)) begin
 //     ndq_items = new[ndq_items.size()+1](ndq_items );
 //     ndq_items[ndq_items.size()-1] = stx.coins[stx.coins.size()-1];
 //    end
 // 
 //    if (stx.change_ret[stx.change_ret.size()-1] != 0) begin
 //    ndq_change= new[ndq_change.size()+1](ndq_change );
 //    ndq_change[ndq_change.size()-1] = stx.change_ret[stx.change_ret.size()-1];
 //   end

// ndq_items = new [stx.coins.size()-1];
   ndq_items = stx.coins;
    
        if (stx.change_ret.size() >0) begin
        ndq_change = new[stx.change_ret.size()-1];
        ndq_change = stx.change_ret;
     end
  
     if (stx.candy) candy = 1;
     if (stx.cancel) cancel = 1;

	endfunction : write

	task run_phase (uvm_phase phase);
     forever begin
		wait (sb_cfg.sb_compare);
		`uvm_info("SCOREBOARD",$sformatf ("run_phase Comparing... input coins @sb -%0d , no. of coin sig driven - %0d",ndq_items.size() ,sb_cfg.number_of_coins),UVM_LOW);

		// Comparison Logic
		// ....
		// ....
		// ....

       for (int sb_i = 0; sb_i <= ndq_items.size()-1; sb_i++) begin
          //`uvm_info("SCOREBOARD", $sformatf("amount paid is %0d cents",ndq_items[sb_i]),UVM_LOW);
          `uvm_info("SCOREBOARD", $sformatf("received coin %0d is %0s",sb_i,ndq_items[sb_i]),UVM_LOW);
         payment = payment + ndq_items[sb_i];
      end

       for (int sb_j = 0; sb_j <= ndq_change.size()-1; sb_j++) begin
          //`uvm_info("SCOREBOARD", $sformatf("amount returned is %0d cents",ndq_change[sb_j]),UVM_LOW);
          `uvm_info("SCOREBOARD", $sformatf("sent coin %0d is %0s",sb_j,ndq_change[sb_j]),UVM_LOW);
         change = change + ndq_change[sb_j];
      end

     `uvm_info("SCOREBOAD",$sformatf("payment = %0d cents ",payment),UVM_LOW);
     `uvm_info("SCOREBOAD",$sformatf("change = %0d cents ",change),UVM_LOW);


    if (candy) begin
      `uvm_info("SCOREBOARD",$sformatf("Got my Candy :D :D :D !!! "),UVM_LOW);
    end

     if (cancel) begin
        `uvm_info("SCOREBOARD",$sformatf("Transaction to be cancelled"),UVM_LOW);
        if ( (payment < 25) && (payment - change == 0) ) begin
          `uvm_info("SCOREBOARD",$sformatf(" CANCELLATION SUCCESSFUL "),UVM_LOW);
        end
        else begin
           `uvm_error("SCOREBOARD",$sformatf(" CANCELLATION UNSUCCESSFUL "));
        end
     end

     if (payment != sb_cfg.total_amt) begin
        `uvm_error("SCOREBOARD ERROR",$sformatf("Payment mismatched !!"));
        `uvm_error("SCOREBOARD ERROR",$sformatf("Actual amount is %0d cents ",sb_cfg.total_amt));
        `uvm_error("SCOREBOARD ERROR",$sformatf("Amount as seen by Scoreboad is %0d cents",payment));
     end
     else if (payment == sb_cfg.total_amt) begin
        `uvm_info("SCOREBOARD",$sformatf("\n\nNo Payment Mismatch.\nActual amount : %0d cents\nAmount as seen by scoreboard : %0d cents",sb_cfg.total_amt,payment),UVM_LOW);

             if (payment == 25) begin
                if (change != 0) begin
                   `uvm_error("SCOREBOARD ERROR",$sformatf("\nChange returned - %0d cents",change));
                end
                else begin
                    if (candy) begin
                      `uvm_info("SCOREBOARD",$sformatf(" PROCESSING SUCCESSFUL "),UVM_LOW);
                    end
                end
             end

             if (payment > 25) begin

                if (change != (payment - 25)) begin
                   `uvm_error("SCOREBOARD ERROR",$sformatf("\nChange returned - %0d cents",change));
                end
                else if (change == (payment - 25) && (candy))begin
                    `uvm_info("SCOREBOARD",$sformatf("Got my Change of %0d cents ",change),UVM_LOW);
                    `uvm_info("SCOREBOARD",$sformatf(" PROCESSING SUCCESSFUL "),UVM_LOW);
                end

             end

           
     end
     


     ndq_items.delete();
     ndq_change.delete();
     payment = 0;
     change = 0;
     candy = 0;
     cancel = 0;
     sb_cfg.sb_compare = 0;
     cnt++;

     `uvm_info("SCOREBOARD",$sformatf("******************* CANDY VENDING Transaction %0d Completed *******************\n\n",cnt), UVM_LOW);

    end
	endtask

endclass
