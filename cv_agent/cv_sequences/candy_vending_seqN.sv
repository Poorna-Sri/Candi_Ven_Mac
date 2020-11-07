// ----------- ---------- candy_vending_seqN.sv	candy_vending_seqN	seqN_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqN.sv ----------- ---------- 
class candy_vending_seqN extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqN)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqN_tx;
			seqN_tx = new ("seqN_tx");

			seqN_tx = candy_vending_seq_item::type_id::create("seqN_tx");
			start_item(seqN_tx);


			// randomize the sequence or assign values for respective seq items
			//seqN_tx.coins = {N};
			//seqN_tx.cancel = 1;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqN_tx.randomize() with {coin_cnt == 1; cost== 5 ; cancel == 1 ;}); // inline type

			`uvm_info("SEQUENCE_N",$sformatf ("no of coins %0d", seqN_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_N",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqN_tx.coins[4],seqN_tx.coins[3],seqN_tx.coins[2],seqN_tx.coins[1],seqN_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqN_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


