// ----------- ---------- candy_vending_seqDD.sv	candy_vending_seqDD	seqDD_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqDD.sv ----------- ---------- 
class candy_vending_seqDD extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqDD)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqDD_tx;
			seqDD_tx = new ("seqDD_tx");

			seqDD_tx = candy_vending_seq_item::type_id::create("seqDD_tx");
			start_item(seqDD_tx);


			// randomize the sequence or assign values for respective seq items
			//seqDD_tx.coins = {D,D};
			//seqDD_tx.cancel = 1;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqDD_tx.randomize() with {coin_cnt == 2; cost== 20 ; cancel == 1 ;}); // inline type

			`uvm_info("SEQUENCE_DD",$sformatf ("no of coins %0d", seqDD_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_DD",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqDD_tx.coins[4],seqDD_tx.coins[3],seqDD_tx.coins[2],seqDD_tx.coins[1],seqDD_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqDD_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


