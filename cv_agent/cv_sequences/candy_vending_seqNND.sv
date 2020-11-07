// ----------- ---------- candy_vending_seqNND.sv	candy_vending_seqNND	seqNND_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNND.sv ----------- ---------- 
class candy_vending_seqNND extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNND)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNND_tx;
			seqNND_tx = new ("seqNND_tx");

			seqNND_tx = candy_vending_seq_item::type_id::create("seqNND_tx");
			start_item(seqNND_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNND_tx.coins = {N,N,D};
			//seqNND_tx.cancel = 1;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNND_tx.randomize() with {coin_cnt == 3; cost== 20 ; cancel == 1 ;}); // inline type

			`uvm_info("SEQUENCE_NND",$sformatf ("no of coins %0d", seqNND_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NND",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNND_tx.coins[4],seqNND_tx.coins[3],seqNND_tx.coins[2],seqNND_tx.coins[1],seqNND_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNND_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


