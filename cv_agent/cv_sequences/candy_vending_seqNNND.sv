// ----------- ---------- candy_vending_seqNNND.sv	candy_vending_seqNNND	seqNNND_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNNND.sv ----------- ---------- 
class candy_vending_seqNNND extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNNND)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNNND_tx;
			seqNNND_tx = new ("seqNNND_tx");

			seqNNND_tx = candy_vending_seq_item::type_id::create("seqNNND_tx");
			start_item(seqNNND_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNNND_tx.coins = {N,N,N,D};
			//seqNNND_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNNND_tx.randomize() with {coin_cnt == 4; cost== 25 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_NNND",$sformatf ("no of coins %0d", seqNNND_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NNND",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNNND_tx.coins[4],seqNNND_tx.coins[3],seqNNND_tx.coins[2],seqNNND_tx.coins[1],seqNNND_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNNND_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


