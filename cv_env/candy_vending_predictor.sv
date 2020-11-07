class candy_vending_sb_predictor extends uvm_subscriber #(candy_vending_seq_items);
   //`uvm_component_utils(candy_vending_sb_predictor )

   uvm_analysis_port #(candy_vending_seq_items) sb_ptx_ap;

	// constuctor
	function new (string name = "candy_vending_sb_p", uvm_component parent);
		super.new(name,parent);
	endfunction

  function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     sb_ptx_ap = new("sb_ptx_ap",this);
  endfunction

  function void write (candy_vending_seq_items t); // Argument name 'drv_tx' for virtual method 'write' in sub class 'candy_vending_sb_predictor' does not match the argument name 't' in superclass 'uvm_subscriber__1'
     candy_vending_seq_items expected_tx;

     void'(t.convert2string());
     expected_tx = op_expected(t);
     void'(expected_tx.convert2string());
     sb_ptx_ap.write(expected_tx );

  endfunction

  function candy_vending_seq_items op_expected(candy_vending_seq_items tx_written);
    
    candy_vending_seq_items expected_tx;
    expected_tx = new("expected_tx");
    //expected_tx = candy_vending_seq_items::type_id::create("expected_tx");

    expected_tx.copy(tx_written);

    ///////////////////////////////////////////////////////////////////
    // calculating the expected o/p s
    ///////////////////////////////////////////////////////////////////

    // when exactly 25 cents is deposited
    if ((expected_tx.coins.sum() == 25) && (expected_tx.cancel == 0)) begin
       expected_tx.candy = 1;
    end

    // when more than 25 cents is deposited
    if ((expected_tx.coins.sum() > 25) && (expected_tx.cancel == 0)) begin
       expected_tx.candy = 1;
       case (expected_tx.coins.sum())
          30: begin expected_tx.change_ret = new[1];
              expected_tx.change_ret[0] = N;
           end

              35: begin expected_tx.change_ret = new[1];
              expected_tx.change_ret[0] = D;
           end

              40: begin expected_tx.change_ret = new[2];
              expected_tx.change_ret[0] = N;
              expected_tx.change_ret[1] = D;
           end

              45: begin expected_tx.change_ret = new[2];
              expected_tx.change_ret[0] = D;
              expected_tx.change_ret[1] = D;
           end

       endcase
    end

    // when less than 25 cents is deposited
    if ((expected_tx.coins.sum() < 25) && (expected_tx.cancel == 1)) begin
       expected_tx.candy = 0;
       case (expected_tx.coins.sum())
          5: begin expected_tx.change_ret = new[1];
              expected_tx.change_ret[0] = N;
           end

              10: begin expected_tx.change_ret = new[1];
              expected_tx.change_ret[0] = D;
           end

              15: begin expected_tx.change_ret = new[2];
              expected_tx.change_ret[0] = N;
              expected_tx.change_ret[1] = D;
           end

              20: begin expected_tx.change_ret = new[2];
              expected_tx.change_ret[0] = D;
              expected_tx.change_ret[1] = D;
           end

       endcase
    end
    ///////////////////////////////////////////////////////////////////

    return (expected_tx);
  endfunction
   
endclass : candy_vending_sb_predictor 
