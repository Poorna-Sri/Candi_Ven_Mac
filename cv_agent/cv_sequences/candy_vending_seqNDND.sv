// ----------- ---------- candy_vending_seqNDND.sv	candy_vending_seqNDND	seqNDND_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNDND.sv ----------- ---------- 
class candy_vending_seqNDND extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNDND)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNDND_tx;
			seqNDND_tx = new ("seqNDND_tx");

			seqNDND_tx = candy_vending_seq_item::type_id::create("seqNDND_tx");
			start_item(seqNDND_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNDND_tx.coins = {N,D,N,D};
			//seqNDND_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNDND_tx.randomize() with {coin_cnt == 4; cost== 30 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_NDND",$sformatf ("no of coins %0d", seqNDND_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NDND",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNDND_tx.coins[4],seqNDND_tx.coins[3],seqNDND_tx.coins[2],seqNDND_tx.coins[1],seqNDND_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNDND_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


