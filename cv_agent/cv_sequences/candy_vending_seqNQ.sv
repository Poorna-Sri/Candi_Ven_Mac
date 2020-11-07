// ----------- ---------- candy_vending_seqNQ.sv	candy_vending_seqNQ	seqNQ_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNQ.sv ----------- ---------- 
class candy_vending_seqNQ extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNQ)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNQ_tx;
			seqNQ_tx = new ("seqNQ_tx");

			seqNQ_tx = candy_vending_seq_item::type_id::create("seqNQ_tx");
			start_item(seqNQ_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNQ_tx.coins = {N,Q};
			//seqNQ_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNQ_tx.randomize() with {coin_cnt == 2; cost== 30 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_NQ",$sformatf ("no of coins %0d", seqNQ_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NQ",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNQ_tx.coins[4],seqNQ_tx.coins[3],seqNQ_tx.coins[2],seqNQ_tx.coins[1],seqNQ_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNQ_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


