`timescale 1ns/1ns
interface candy_vending_if(input logic clock, logic reset);

	// declare here the ports/signals involved at the DUTs interface
  logic nickel;
  logic dime;
  logic quarter;
  logic cancel;
  
  logic n;
  logic d;
  logic candy;

	clocking driver_cb @(posedge clock);
		//default input #1ns output #3ns;
	  // skew seen at receivers side,
	  // that is the DUT receives the signal with the follwing delay
	  // but driver doesnt sample the delayed output


		default input #2000ps output #7000ps;
		//default input #1 output #1;

		// For Driver's cb, declare the o/p of the DUT as i/p here
		// For Driver's cb, declare the i/p of the DUT as o/p here

    output nickel;
    output dime;
    output quarter;
    output cancel;
    
    input n;
    input d;
    input candy;

	endclocking


	clocking monitor_cb @(posedge clock);
		//default input #2ns output #2ns;
		//default input #1step output #1;
		//default input #2000ps;

// For MOnitor's cb, declare the all ports of the DUT as i/p here
    input nickel;
    input dime;
    input quarter;
    input cancel;
    
    input n;
    input d;
    input candy;

	endclocking

	modport DUT (
	  // Declare here, the port list of DUT with appropriate directions w r t DUT
    input nickel,
    input dime,
    input quarter,
    input cancel,
    
    output n,
    output d,
    output candy

            );


	modport DRIVER	(clocking driver_cb,
                input clock
                );

	modport MONITOR	(clocking monitor_cb,
                     input clock
                    );

endinterface
