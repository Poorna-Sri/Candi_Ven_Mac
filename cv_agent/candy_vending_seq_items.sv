// FILE D:/uvm_proj/candy_vending/candy_vending_seq_items.sv
class candy_vending_seq_items extends uvm_sequence_item;

	// declare the sequence items here

  // inputs
	rand coin coins[];
	rand bit cancel;

  // outputs
	coin change_ret[];
	bit candy;

  // knobs
  rand int coin_cnt;
  rand int cost;

	`uvm_object_utils_begin(candy_vending_seq_items)
                     // inputs
	    `uvm_field_array_enum(coin,coins,UVM_ALL_ON)
	    `uvm_field_int(cancel,UVM_ALL_ON)

                     // outputs
	    `uvm_field_array_enum(coin,change_ret,UVM_ALL_ON)
	    `uvm_field_int(candy,UVM_ALL_ON)
	`uvm_object_utils_end

	// any constraining required for the randomization of the items can be done here
  
  // range specification for dynamic coin array size
  constraint coin_cnt_c {
     coin_cnt <= 7;coin_cnt > 1;
  };


  constraint coin_c {
     coins.sum() == cost; 
  };

  constraint coins_size_c {
     coins.size() == coin_cnt;
  };

  constraint cost_c {
     cost inside {5,10,15,20,25,30,35,40,45};  
  };

  constraint cancel_c {
     if (coins.sum() <25)
        cancel == 1;
     else 
        cancel == 0; 
  };

  function void post_randomize();
     coin new_list[];
     int total = 0;
     

       `uvm_info("SEQ_ITEM",$sformatf("%0d coins to be deposited",coins.size()),UVM_LOW);
       `uvm_info("SEQ_ITEM",$sformatf("Randomized coins are %0p",coins),UVM_LOW);
       `uvm_info("SEQ_ITEM",$sformatf("Total Amount is %0d",coins.sum()),UVM_LOW);
        
       if (coins.sum() > 25 ) begin

          foreach (coins[i]) begin : blk_A
             total = total + coins[i];

             if (total >0) begin
                if (total < 25) begin
                  new_list = new[new_list.size() + 1](new_list);
                  new_list[new_list.size() - 1] = coins[i];
                end
                else if (total >= 25) begin
                  new_list = new[new_list.size() + 1](new_list);
                  new_list[new_list.size() - 1] = coins[i];
                  //disable blk_A;    // doesn't work with foreach
                  break;
                end
             end
          end : blk_A

       end
        
       if (coins.sum() < 25 ) begin

          foreach (coins[i]) begin : blk_B
             total = total + coins[i];

             if (total >0) begin
                if (total < coins.sum()) begin
                  new_list = new[new_list.size() + 1](new_list);
                  new_list[new_list.size() - 1] = coins[i];
                end
                else if (total == coins.sum()) begin
                  new_list = new[new_list.size() + 1](new_list);
                  new_list[new_list.size() - 1] = coins[i];
                  //disable blk_A;    // doesn't work with foreach
                  break;
                end
             end
          end : blk_B

       end
        
       if (coins.sum() == 25 ) begin

          foreach (coins[i]) begin : blk_C
             total = total + coins[i];

             if (total >0) begin
                if (total < 25) begin
                  new_list = new[new_list.size() + 1](new_list);
                  new_list[new_list.size() - 1] = coins[i];
                end
                else if (total == 25) begin
                  new_list = new[new_list.size() + 1](new_list);
                  new_list[new_list.size() - 1] = coins[i];
                  //disable blk_A;    // doesn't work with foreach
                  break;
                end
             end
          end : blk_C

       end
        
        coins.delete();
        coins = new[new_list.size()-1];
        coins = new_list;
        new_list.delete();

       `uvm_info("SEQ_ITEM",$sformatf("Post Randomization\n\n"),UVM_LOW);
       `uvm_info("SEQ_ITEM",$sformatf("%0d coins to be deposited",coins.size()),UVM_LOW);
       `uvm_info("SEQ_ITEM",$sformatf("coins are %0p",coins),UVM_LOW);

  endfunction

	function new (string name = "items");
		super.new(name);
	endfunction

	// functions related to manipulating seq_items like packing etc., can be done here

  function void do_copy (uvm_object rhs);
     candy_vending_seq_items tx;

     if (!$cast(tx,rhs))
        `uvm_fatal("candy_vending_seq_items","ILLEGAL do_copy() cast" )

        coins = tx.coins;
        cancel = tx.cancel;
        change_ret = tx.change_ret;
        candy = tx.candy;

  endfunction : do_copy 

  function bit do_compare (uvm_object rhs,uvm_comparer comparer);
     candy_vending_seq_items tx;
     bit equality;

     if (!$cast(tx,rhs))
        `uvm_fatal("candy_vending_seq_items", "ILLEGAL do_compare() cast")

        equality = super.do_compare(rhs,comparer);

        //equality &= comparer.compare_field_int("",cancel,rhs.cancel);
        //equality &= ( change_ret  == tx.change_ret); //  ------> results in Error
        //equality &= ( coins       == tx.coins); //  ------> results in Error

        foreach (coins[i])
           equality &=( coins[i]  == tx.coins[i]);
        foreach (change_ret[i])
           equality &=( change_ret[i]  == tx.change_ret[i]);
           
        equality &= ( cancel      == tx.cancel);
        equality &= ( candy       == tx.candy);
        return (equality);
  endfunction
  /*
*/

  function string input2string();
     return ($sformatf("\ncoins = %p, cancel = %0b",coins,cancel));
  endfunction

  function string output2string();
     return ($sformatf("\ncandy = %0b, change_ret = %p",candy,change_ret));
  endfunction

  function string convert2string();
     return ({input2string(), " ",output2string() });
  endfunction
endclass
