// ----------- ---------- candy_vending_seqNDN.sv	candy_vending_seqNDN	seqNDN_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNDN.sv ----------- ---------- 
class candy_vending_seqNDN extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNDN)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNDN_tx;
			seqNDN_tx = new ("seqNDN_tx");

			seqNDN_tx = candy_vending_seq_item::type_id::create("seqNDN_tx");
			start_item(seqNDN_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNDN_tx.coins = {N,D,N};
			//seqNDN_tx.cancel = 1;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNDN_tx.randomize() with {coin_cnt == 3; cost== 20 ; cancel == 1 ;}); // inline type

			`uvm_info("SEQUENCE_NDN",$sformatf ("no of coins %0d", seqNDN_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NDN",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNDN_tx.coins[4],seqNDN_tx.coins[3],seqNDN_tx.coins[2],seqNDN_tx.coins[1],seqNDN_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNDN_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


