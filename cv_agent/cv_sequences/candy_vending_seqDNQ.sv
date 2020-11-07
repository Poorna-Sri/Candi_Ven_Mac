// ----------- ---------- candy_vending_seqDNQ.sv	candy_vending_seqDNQ	seqDNQ_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqDNQ.sv ----------- ---------- 
class candy_vending_seqDNQ extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqDNQ)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqDNQ_tx;
			seqDNQ_tx = new ("seqDNQ_tx");

			seqDNQ_tx = candy_vending_seq_item::type_id::create("seqDNQ_tx");
			start_item(seqDNQ_tx);


			// randomize the sequence or assign values for respective seq items
			//seqDNQ_tx.coins = {D,N,Q};
			//seqDNQ_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqDNQ_tx.randomize() with {coin_cnt == 3; cost== 40 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_DNQ",$sformatf ("no of coins %0d", seqDNQ_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_DNQ",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqDNQ_tx.coins[4],seqDNQ_tx.coins[3],seqDNQ_tx.coins[2],seqDNQ_tx.coins[1],seqDNQ_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqDNQ_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


