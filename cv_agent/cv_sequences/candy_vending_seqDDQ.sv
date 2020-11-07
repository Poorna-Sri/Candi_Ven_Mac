// ----------- ---------- candy_vending_seqDDQ.sv	candy_vending_seqDDQ	seqDDQ_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqDDQ.sv ----------- ---------- 
class candy_vending_seqDDQ extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqDDQ)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqDDQ_tx;
			seqDDQ_tx = new ("seqDDQ_tx");

			seqDDQ_tx = candy_vending_seq_item::type_id::create("seqDDQ_tx");
			start_item(seqDDQ_tx);


			// randomize the sequence or assign values for respective seq items
			//seqDDQ_tx.coins = {D,D,Q};
			//seqDDQ_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqDDQ_tx.randomize() with {coin_cnt == 3; cost== 45 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_DDQ",$sformatf ("no of coins %0d", seqDDQ_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_DDQ",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqDDQ_tx.coins[4],seqDDQ_tx.coins[3],seqDDQ_tx.coins[2],seqDDQ_tx.coins[1],seqDDQ_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqDDQ_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


