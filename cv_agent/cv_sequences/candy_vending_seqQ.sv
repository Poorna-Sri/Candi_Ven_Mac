// ----------- ---------- candy_vending_seqQ.sv	candy_vending_seqQ	seqQ_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqQ.sv ----------- ---------- 
class candy_vending_seqQ extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqQ)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqQ_tx;
			seqQ_tx = new ("seqQ_tx");

			seqQ_tx = candy_vending_seq_item::type_id::create("seqQ_tx");
			start_item(seqQ_tx);


			// randomize the sequence or assign values for respective seq items
			//seqQ_tx.coins = {Q};
			//seqQ_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqQ_tx.randomize() with {coin_cnt == 1; cost== 25 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_Q",$sformatf ("no of coins %0d", seqQ_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_Q",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqQ_tx.coins[4],seqQ_tx.coins[3],seqQ_tx.coins[2],seqQ_tx.coins[1],seqQ_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqQ_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


