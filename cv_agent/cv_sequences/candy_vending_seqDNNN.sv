// ----------- ---------- candy_vending_seqDNNN.sv	candy_vending_seqDNNN	seqDNNN_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqDNNN.sv ----------- ---------- 
class candy_vending_seqDNNN extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqDNNN)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqDNNN_tx;
			seqDNNN_tx = new ("seqDNNN_tx");

			seqDNNN_tx = candy_vending_seq_item::type_id::create("seqDNNN_tx");
			start_item(seqDNNN_tx);


			// randomize the sequence or assign values for respective seq items
			//seqDNNN_tx.coins = {D,N,N,N};
			//seqDNNN_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqDNNN_tx.randomize() with {coin_cnt == 4; cost== 25 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_DNNN",$sformatf ("no of coins %0d", seqDNNN_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_DNNN",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqDNNN_tx.coins[4],seqDNNN_tx.coins[3],seqDNNN_tx.coins[2],seqDNNN_tx.coins[1],seqDNNN_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqDNNN_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


