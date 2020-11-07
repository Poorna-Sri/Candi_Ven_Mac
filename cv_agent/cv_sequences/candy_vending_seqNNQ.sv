// ----------- ---------- candy_vending_seqNNQ.sv	candy_vending_seqNNQ	seqNNQ_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNNQ.sv ----------- ---------- 
class candy_vending_seqNNQ extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNNQ)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNNQ_tx;
			seqNNQ_tx = new ("seqNNQ_tx");

			seqNNQ_tx = candy_vending_seq_item::type_id::create("seqNNQ_tx");
			start_item(seqNNQ_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNNQ_tx.coins = {N,N,Q};
			//seqNNQ_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNNQ_tx.randomize() with {coin_cnt == 3; cost== 35 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_NNQ",$sformatf ("no of coins %0d", seqNNQ_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NNQ",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNNQ_tx.coins[4],seqNNQ_tx.coins[3],seqNNQ_tx.coins[2],seqNNQ_tx.coins[1],seqNNQ_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNNQ_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


