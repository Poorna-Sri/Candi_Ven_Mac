// ----------- ---------- candy_vending_seqNDNQ.sv	candy_vending_seqNDNQ	seqNDNQ_tx  ----------- ---------- 
// ----------- ---------- D:/uvm_proj/acvm_new/candy_vending_DV/cv_agent/cv_sequences/candy_vending_seqNDNQ.sv ----------- ---------- 
class candy_vending_seqNDNQ extends uvm_sequence#(candy_vending_seq_item);
	`uvm_object_utils(candy_vending_seqNDNQ)


	function new(string name = "");
		super.new(name);
	endfunction

	task body();

		set_response_queue_error_report_disabled(1);

		repeat (10) begin

			candy_vending_seq_item seqNDNQ_tx;
			seqNDNQ_tx = new ("seqNDNQ_tx");

			seqNDNQ_tx = candy_vending_seq_item::type_id::create("seqNDNQ_tx");
			start_item(seqNDNQ_tx);


			// randomize the sequence or assign values for respective seq items
			//seqNDNQ_tx.coins = {N,D,N,Q};
			//seqNDNQ_tx.cancel = 0;


			// Trying to randomize dynamic array with inline constraint, results in error

			void'(seqNDNQ_tx.randomize() with {coin_cnt == 4; cost== 45 ; cancel == 0 ;}); // inline type

			`uvm_info("SEQUENCE_NDNQ",$sformatf ("no of coins %0d", seqNDNQ_tx.coins.size()),UVM_LOW);
	
				`uvm_info("SEQUENCE_NDNQ",$sformatf ("coins are %0s,%0s,%0s,%0s,%0s !",seqNDNQ_tx.coins[4],seqNDNQ_tx.coins[3],seqNDNQ_tx.coins[2],seqNDNQ_tx.coins[1],seqNDNQ_tx.coins[0]),UVM_LOW);

				`uvm_info(get_type_name(),seq20_tx.convert2string(),UVM_LOW);
			finish_item(seqNDNQ_tx);
		end
	endtask

endclass


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


