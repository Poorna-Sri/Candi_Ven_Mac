// ----------- ---------- candy_vending_seqDQ.sv	candy_vending_seqDQ	seqDQ_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqDQ.sv ----------- ---------- 
class candy_vending_seqDQ extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqDQ)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqDQ_tx;
			seqDQ_tx = new ("seqDQ_tx");

			seqDQ_tx = candy_vending_seq_item::type_id::create("seqDQ_tx");
			start_item(seqDQ_tx);


			// randomize the sequence or assign values for respective seq items
			//seqDQ_tx.coins = {D,Q};
			//seqDQ_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqDQ_tx.randomize() with {coin_cnt == 2; cost== 35 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_DQ",$sformatf ("no of coins %0d", seqDQ_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_DQ",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqDQ_tx.coins[4],seqDQ_tx.coins[3],seqDQ_tx.coins[2],seqDQ_tx.coins[1],seqDQ_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqDQ_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


