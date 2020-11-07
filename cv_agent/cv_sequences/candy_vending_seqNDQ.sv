// ----------- ---------- candy_vending_seqNDQ.sv	candy_vending_seqNDQ	seqNDQ_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNDQ.sv ----------- ---------- 
class candy_vending_seqNDQ extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNDQ)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNDQ_tx;
			seqNDQ_tx = new ("seqNDQ_tx");

			seqNDQ_tx = candy_vending_seq_item::type_id::create("seqNDQ_tx");
			start_item(seqNDQ_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNDQ_tx.coins = {N,D,Q};
			//seqNDQ_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNDQ_tx.randomize() with {coin_cnt == 3; cost== 40 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_NDQ",$sformatf ("no of coins %0d", seqNDQ_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NDQ",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNDQ_tx.coins[4],seqNDQ_tx.coins[3],seqNDQ_tx.coins[2],seqNDQ_tx.coins[1],seqNDQ_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNDQ_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


