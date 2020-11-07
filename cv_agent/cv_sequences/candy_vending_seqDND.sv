// ----------- ---------- candy_vending_seqDND.sv	candy_vending_seqDND	seqDND_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqDND.sv ----------- ---------- 
class candy_vending_seqDND extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqDND)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqDND_tx;
			seqDND_tx = new ("seqDND_tx");

			seqDND_tx = candy_vending_seq_item::type_id::create("seqDND_tx");
			start_item(seqDND_tx);


			// randomize the sequence or assign values for respective seq items
			//seqDND_tx.coins = {D,N,D};
			//seqDND_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqDND_tx.randomize() with {coin_cnt == 3; cost== 25 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_DND",$sformatf ("no of coins %0d", seqDND_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_DND",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqDND_tx.coins[4],seqDND_tx.coins[3],seqDND_tx.coins[2],seqDND_tx.coins[1],seqDND_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqDND_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


