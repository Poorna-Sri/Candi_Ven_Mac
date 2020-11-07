// ----------- ---------- candy_vending_seqNNN.sv	candy_vending_seqNNN	seqNNN_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNNN.sv ----------- ---------- 
class candy_vending_seqNNN extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNNN)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNNN_tx;
			seqNNN_tx = new ("seqNNN_tx");

			seqNNN_tx = candy_vending_seq_item::type_id::create("seqNNN_tx");
			start_item(seqNNN_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNNN_tx.coins = {N,N,N};
			//seqNNN_tx.cancel = 1;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNNN_tx.randomize() with {coin_cnt == 3; cost== 15 ; cancel == 1 ;}); // inline type

			`uvm_info("SEQUENCE_NNN",$sformatf ("no of coins %0d", seqNNN_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NNN",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNNN_tx.coins[4],seqNNN_tx.coins[3],seqNNN_tx.coins[2],seqNNN_tx.coins[1],seqNNN_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNNN_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


