// ----------- ---------- candy_vending_seqDNND.sv	candy_vending_seqDNND	seqDNND_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqDNND.sv ----------- ---------- 
class candy_vending_seqDNND extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqDNND)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqDNND_tx;
			seqDNND_tx = new ("seqDNND_tx");

			seqDNND_tx = candy_vending_seq_item::type_id::create("seqDNND_tx");
			start_item(seqDNND_tx);


			// randomize the sequence or assign values for respective seq items
			//seqDNND_tx.coins = {D,N,N,D};
			//seqDNND_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqDNND_tx.randomize() with {coin_cnt == 4; cost== 30 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_DNND",$sformatf ("no of coins %0d", seqDNND_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_DNND",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqDNND_tx.coins[4],seqDNND_tx.coins[3],seqDNND_tx.coins[2],seqDNND_tx.coins[1],seqDNND_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqDNND_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


