// ----------- ---------- candy_vending_seqNNDN.sv	candy_vending_seqNNDN	seqNNDN_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNNDN.sv ----------- ---------- 
class candy_vending_seqNNDN extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNNDN)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNNDN_tx;
			seqNNDN_tx = new ("seqNNDN_tx");

			seqNNDN_tx = candy_vending_seq_item::type_id::create("seqNNDN_tx");
			start_item(seqNNDN_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNNDN_tx.coins = {N,N,D,N};
			//seqNNDN_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNNDN_tx.randomize() with {coin_cnt == 4; cost== 25 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_NNDN",$sformatf ("no of coins %0d", seqNNDN_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NNDN",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNNDN_tx.coins[4],seqNNDN_tx.coins[3],seqNNDN_tx.coins[2],seqNNDN_tx.coins[1],seqNNDN_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNNDN_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


