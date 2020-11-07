// ----------- ---------- candy_vending_seqD.sv	candy_vending_seqD	seqD_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqD.sv ----------- ---------- 
class candy_vending_seqD extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqD)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqD_tx;
			seqD_tx = new ("seqD_tx");

			seqD_tx = candy_vending_seq_item::type_id::create("seqD_tx");
			start_item(seqD_tx);


			// randomize the sequence or assign values for respective seq items
			//seqD_tx.coins = {D};
			//seqD_tx.cancel = 1;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqD_tx.randomize() with {coin_cnt == 1; cost== 10 ; cancel == 1 ;}); // inline type

			`uvm_info("SEQUENCE_D",$sformatf ("no of coins %0d", seqD_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_D",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqD_tx.coins[4],seqD_tx.coins[3],seqD_tx.coins[2],seqD_tx.coins[1],seqD_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqD_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


