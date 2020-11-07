// ----------- ---------- candy_vending_seqND.sv	candy_vending_seqND	seqND_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqND.sv ----------- ---------- 
class candy_vending_seqND extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqND)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqND_tx;
			seqND_tx = new ("seqND_tx");

			seqND_tx = candy_vending_seq_item::type_id::create("seqND_tx");
			start_item(seqND_tx);


			// randomize the sequence or assign values for respective seq items
			//seqND_tx.coins = {N,D};
			//seqND_tx.cancel = 1;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqND_tx.randomize() with {coin_cnt == 2; cost== 15 ; cancel == 1 ;}); // inline type

			`uvm_info("SEQUENCE_ND",$sformatf ("no of coins %0d", seqND_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_ND",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqND_tx.coins[4],seqND_tx.coins[3],seqND_tx.coins[2],seqND_tx.coins[1],seqND_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqND_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


