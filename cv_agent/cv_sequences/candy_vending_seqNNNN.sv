// ----------- ---------- candy_vending_seqNNNN.sv	candy_vending_seqNNNN	seqNNNN_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNNNN.sv ----------- ---------- 
class candy_vending_seqNNNN extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNNNN)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNNNN_tx;
			seqNNNN_tx = new ("seqNNNN_tx");

			seqNNNN_tx = candy_vending_seq_item::type_id::create("seqNNNN_tx");
			start_item(seqNNNN_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNNNN_tx.coins = {N,N,N,N};
			//seqNNNN_tx.cancel = 1;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNNNN_tx.randomize() with {coin_cnt == 4; cost== 20 ; cancel == 1 ;}); // inline type

			`uvm_info("SEQUENCE_NNNN",$sformatf ("no of coins %0d", seqNNNN_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NNNN",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNNNN_tx.coins[4],seqNNNN_tx.coins[3],seqNNNN_tx.coins[2],seqNNNN_tx.coins[1],seqNNNN_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNNNN_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


