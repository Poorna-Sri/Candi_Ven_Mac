// ----------- ---------- candy_vending_seqDN.sv	candy_vending_seqDN	seqDN_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqDN.sv ----------- ---------- 
class candy_vending_seqDN extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqDN)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqDN_tx;
			seqDN_tx = new ("seqDN_tx");

			seqDN_tx = candy_vending_seq_item::type_id::create("seqDN_tx");
			start_item(seqDN_tx);


			// randomize the sequence or assign values for respective seq items
			//seqDN_tx.coins = {D,N};
			//seqDN_tx.cancel = 1;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqDN_tx.randomize() with {coin_cnt == 2; cost== 15 ; cancel == 1 ;}); // inline type

			`uvm_info("SEQUENCE_DN",$sformatf ("no of coins %0d", seqDN_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_DN",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqDN_tx.coins[4],seqDN_tx.coins[3],seqDN_tx.coins[2],seqDN_tx.coins[1],seqDN_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqDN_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


