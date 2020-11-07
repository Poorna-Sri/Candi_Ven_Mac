// ----------- ---------- candy_vending_seqDNN.sv	candy_vending_seqDNN	seqDNN_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqDNN.sv ----------- ---------- 
class candy_vending_seqDNN extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqDNN)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqDNN_tx;
			seqDNN_tx = new ("seqDNN_tx");

			seqDNN_tx = candy_vending_seq_item::type_id::create("seqDNN_tx");
			start_item(seqDNN_tx);


			// randomize the sequence or assign values for respective seq items
			//seqDNN_tx.coins = {D,N,N};
			//seqDNN_tx.cancel = 1;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqDNN_tx.randomize() with {coin_cnt == 3; cost== 20 ; cancel == 1 ;}); // inline type

			`uvm_info("SEQUENCE_DNN",$sformatf ("no of coins %0d", seqDNN_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_DNN",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqDNN_tx.coins[4],seqDNN_tx.coins[3],seqDNN_tx.coins[2],seqDNN_tx.coins[1],seqDNN_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqDNN_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


