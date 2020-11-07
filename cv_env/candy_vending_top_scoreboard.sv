class candy_vending_top_scoreboard extends uvm_scoreboard;
   `uvm_component_utils(candy_vending_top_scoreboard)

   uvm_analysis_port #(candy_vending_seq_items) drv2sb_txport;
   uvm_analysis_port #(candy_vending_seq_items) mon2sb_txport;

   candy_vending_sb_predictor predictor;
   candy_vending_sb_comparator comparator;

   function new (string name = "", uvm_component parent);
      super.new(name,parent);
      drv2sb_txport = new("drv2sb_txport",this);
      mon2sb_txport = new("mon2sb_txport",this);
   endfunction

   function void build_phase (uvm_phase phase);
      super.build_phase(phase);

      //predictor = candy_vending_sb_predictor:: type_id::create("predictor",this);
      //comparator = candy_vending_sb_comparator:: type_id::create ("comparator",this);

      predictor = new("predictor",this);
      comparator =new("comparator",this);
   endfunction

   function void connect_phase(uvm_phase phase);
      // connect predictor and comparator to respective analysis exports
      drv2sb_txport.connect (predictor.analysis_export);
      mon2sb_txport.connect (comparator.c_port);
      predictor.sb_ptx_ap.connect(comparator.p_port);

   endfunction
endclass
