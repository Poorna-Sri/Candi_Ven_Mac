// ----------- ---------- candy_vending_seqDDD.sv	candy_vending_seqDDD	seqDDD_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqDDD.sv ----------- ---------- 
class candy_vending_seqDDD extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqDDD)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqDDD_tx;
			seqDDD_tx = new ("seqDDD_tx");

			seqDDD_tx = candy_vending_seq_item::type_id::create("seqDDD_tx");
			start_item(seqDDD_tx);


			// randomize the sequence or assign values for respective seq items
			//seqDDD_tx.coins = {D,D,D};
			//seqDDD_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqDDD_tx.randomize() with {coin_cnt == 3; cost== 30 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_DDD",$sformatf ("no of coins %0d", seqDDD_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_DDD",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqDDD_tx.coins[4],seqDDD_tx.coins[3],seqDDD_tx.coins[2],seqDDD_tx.coins[1],seqDDD_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqDDD_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


