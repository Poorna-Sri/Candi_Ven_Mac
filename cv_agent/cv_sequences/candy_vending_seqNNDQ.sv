// ----------- ---------- candy_vending_seqNNDQ.sv	candy_vending_seqNNDQ	seqNNDQ_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNNDQ.sv ----------- ---------- 
class candy_vending_seqNNDQ extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNNDQ)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNNDQ_tx;
			seqNNDQ_tx = new ("seqNNDQ_tx");

			seqNNDQ_tx = candy_vending_seq_item::type_id::create("seqNNDQ_tx");
			start_item(seqNNDQ_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNNDQ_tx.coins = {N,N,D,Q};
			//seqNNDQ_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNNDQ_tx.randomize() with {coin_cnt == 4; cost== 45 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_NNDQ",$sformatf ("no of coins %0d", seqNNDQ_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NNDQ",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNNDQ_tx.coins[4],seqNNDQ_tx.coins[3],seqNNDQ_tx.coins[2],seqNNDQ_tx.coins[1],seqNNDQ_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNNDQ_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


