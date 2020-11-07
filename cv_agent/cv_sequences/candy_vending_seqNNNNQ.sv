// ----------- ---------- candy_vending_seqNNNNQ.sv	candy_vending_seqNNNNQ	seqNNNNQ_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNNNNQ.sv ----------- ---------- 
class candy_vending_seqNNNNQ extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNNNNQ)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNNNNQ_tx;
			seqNNNNQ_tx = new ("seqNNNNQ_tx");

			seqNNNNQ_tx = candy_vending_seq_item::type_id::create("seqNNNNQ_tx");
			start_item(seqNNNNQ_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNNNNQ_tx.coins = {N,N,N,N,Q};
			//seqNNNNQ_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNNNNQ_tx.randomize() with {coin_cnt == 5; cost== 45 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_NNNNQ",$sformatf ("no of coins %0d", seqNNNNQ_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NNNNQ",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNNNNQ_tx.coins[4],seqNNNNQ_tx.coins[3],seqNNNNQ_tx.coins[2],seqNNNNQ_tx.coins[1],seqNNNNQ_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNNNNQ_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


