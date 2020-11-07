// ----------- ---------- candy_vending_seqNNNQ.sv	candy_vending_seqNNNQ	seqNNNQ_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNNNQ.sv ----------- ---------- 
class candy_vending_seqNNNQ extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNNNQ)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNNNQ_tx;
			seqNNNQ_tx = new ("seqNNNQ_tx");

			seqNNNQ_tx = candy_vending_seq_item::type_id::create("seqNNNQ_tx");
			start_item(seqNNNQ_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNNNQ_tx.coins = {N,N,N,Q};
			//seqNNNQ_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNNNQ_tx.randomize() with {coin_cnt == 4; cost== 40 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_NNNQ",$sformatf ("no of coins %0d", seqNNNQ_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NNNQ",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNNNQ_tx.coins[4],seqNNNQ_tx.coins[3],seqNNNQ_tx.coins[2],seqNNNQ_tx.coins[1],seqNNNQ_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNNNQ_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


