// ----------- ---------- candy_vending_seqNDNN.sv	candy_vending_seqNDNN	seqNDNN_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNDNN.sv ----------- ---------- 
class candy_vending_seqNDNN extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNDNN)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNDNN_tx;
			seqNDNN_tx = new ("seqNDNN_tx");

			seqNDNN_tx = candy_vending_seq_item::type_id::create("seqNDNN_tx");
			start_item(seqNDNN_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNDNN_tx.coins = {N,D,N,N};
			//seqNDNN_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNDNN_tx.randomize() with {coin_cnt == 4; cost== 25 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_NDNN",$sformatf ("no of coins %0d", seqNDNN_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NDNN",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNDNN_tx.coins[4],seqNDNN_tx.coins[3],seqNDNN_tx.coins[2],seqNDNN_tx.coins[1],seqNDNN_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNDNN_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


