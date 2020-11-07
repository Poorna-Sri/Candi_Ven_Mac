// ----------- ---------- candy_vending_seqNN.sv	candy_vending_seqNN	seqNN_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNN.sv ----------- ---------- 
class candy_vending_seqNN extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNN)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNN_tx;
			seqNN_tx = new ("seqNN_tx");

			seqNN_tx = candy_vending_seq_item::type_id::create("seqNN_tx");
			start_item(seqNN_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNN_tx.coins = {N,N};
			//seqNN_tx.cancel = 1;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNN_tx.randomize() with {coin_cnt == 2; cost== 10 ; cancel == 1 ;}); // inline type

			`uvm_info("SEQUENCE_NN",$sformatf ("no of coins %0d", seqNN_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NN",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNN_tx.coins[4],seqNN_tx.coins[3],seqNN_tx.coins[2],seqNN_tx.coins[1],seqNN_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNN_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


