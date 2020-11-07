class candy_vending_sb_comparator extends uvm_component;
  //`uvm_component_utils(candy_vending_sb_comparator)

   uvm_analysis_export #(candy_vending_seq_items) p_port;
   uvm_analysis_export #(candy_vending_seq_items) c_port;
   uvm_tlm_analysis_fifo #(candy_vending_seq_items) p_fifo;
   uvm_tlm_analysis_fifo #(candy_vending_seq_items) c_fifo;

	// constuctor
	function new (string name = "candy_vending_sb_c", uvm_component parent);
		super.new(name,parent);
	endfunction

  function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     p_port  = new("p_port ",this);
     c_port = new("c_port",this);
     p_fifo  = new  ("p_fifo   ",this);
     c_fifo  = new  ("c_fifo   ",this);
  endfunction

  function void connect_phase (uvm_phase phase);
     super.connect_phase(phase);

     p_port.connect (p_fifo.analysis_export);
     c_port.connect (c_fifo.analysis_export);
  endfunction

  task run_phase (uvm_phase phase);
     candy_vending_seq_items predicted_tx, if_tx;
     predicted_tx = new("predicted_tx");
     if_tx = new("if_tx");

     forever begin
        p_fifo.get(predicted_tx);
        c_fifo.get(if_tx);

             `uvm_info(get_type_name(),$sformatf("PREDICTED :: \t"),UVM_LOW);
             `uvm_info(get_type_name(),predicted_tx.convert2string(),UVM_LOW);
             `uvm_info(get_type_name(),$sformatf("ACTUAL :: \t"),UVM_LOW);
             `uvm_info(get_type_name(),if_tx.convert2string(),UVM_LOW);

        `uvm_info("COMPARATOR",$sformatf("********************************"),UVM_LOW);

        if (if_tx.compare(predicted_tx)) begin
           `uvm_info("COMPARATOR",$sformatf("The output tx. is as expected :D"),UVM_LOW);
        end
        else begin
           `uvm_error("COMPARATOR",$sformatf("\tError in COmparison !"));
        end
        `uvm_info("COMPARATOR",$sformatf("********************************"),UVM_LOW);

     predicted_tx = new("predicted_tx");
     if_tx = new("if_tx");
     end

  endtask
  
endclass
