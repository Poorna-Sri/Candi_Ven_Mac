// ----------- ---------- candy_vending_seqDDN.sv	candy_vending_seqDDN	seqDDN_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqDDN.sv ----------- ---------- 
class candy_vending_seqDDN extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqDDN)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqDDN_tx;
			seqDDN_tx = new ("seqDDN_tx");

			seqDDN_tx = candy_vending_seq_item::type_id::create("seqDDN_tx");
			start_item(seqDDN_tx);


			// randomize the sequence or assign values for respective seq items
			//seqDDN_tx.coins = {D,D,N};
			//seqDDN_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqDDN_tx.randomize() with {coin_cnt == 3; cost== 25 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_DDN",$sformatf ("no of coins %0d", seqDDN_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_DDN",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqDDN_tx.coins[4],seqDDN_tx.coins[3],seqDDN_tx.coins[2],seqDDN_tx.coins[1],seqDDN_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqDDN_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


