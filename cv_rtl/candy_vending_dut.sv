///////////////////////////////////////////////////////////////
//This module is for the candy vending machine.
//The machine accepts nickels, dimes and quarters and dispenses a 
//candy  when the cost exceeeds 25cents. Change is returned. Every 
//signal is a one clockpulse signal, which means that when a coin is 
//deposited, the signal generated is a one clock pulse signal.
// /////////////////////////////////////////////////////////////

/*
module candy_vending_dut (
	nickel,
	dime,
	quarter,
	rst,
	clk,
	n,
	d,
	candy
);

input nickel;
input dime;
input quarter;
input rst;
input clk;

output reg n;
output reg d;
output reg candy;
*/

module candy_vending_dut (clk, rst, if_ports);

input clk;
input rst;
candy_vending_if.DUT if_ports;

reg [3:0]cst;
reg [3:0]nst;

localparam S0 	= 0;
localparam S5 	= 1;
localparam S10 = 2;
localparam S15	=	3;
localparam S20 = 4;
localparam S25	=	5;
localparam S30 = 6;
localparam S35	=	7;
localparam S40 = 8;
localparam S45	=	9;
localparam SN1 =10;
localparam SN2 =11;
localparam SD1 =12;
localparam SD2 =13;
localparam SDD =14;

// current state logic
always @(*) begin

	nst = cst;

	case(cst) 

					S0 :	begin
									if (if_ports.nickel) 
										nst = S5;
									else if (if_ports.dime)
										nst = S10;
									else if (if_ports.quarter)
										nst = S25;
								end

					S5 :	begin
									if (if_ports.nickel) 
										nst = S10;
									else if (if_ports.dime)
										nst = S15;
									else if (if_ports.quarter)
										nst = S30;
									else if (if_ports.cancel)
										nst = SN1;
								end

					S10:	begin
									if (if_ports.nickel) 
										nst = S15;
									else if (if_ports.dime)
										nst = S20;
									else if (if_ports.quarter)
										nst = S35;
									else if (if_ports.cancel)
										nst = SD1;
					end

					S15:	begin
									if (if_ports.nickel) 
										nst = S20;
									else if (if_ports.dime)
										nst = S25;
									else if (if_ports.quarter)
										nst = S40;
									else if (if_ports.cancel)
										nst = SN2;
					end

					S20:	begin
									if (if_ports.nickel) 
										nst = S25;
									else if (if_ports.dime)
										nst = S30;
									else if (if_ports.quarter)
										nst = S45;
									else if (if_ports.cancel)
										nst = SD2;
					end

					S25:	begin
									nst = S0;
					end

					S30:	begin
									nst = SN1;
					end

					S35:	begin
									nst = SD1;
					end

					S40:	begin
									nst = SN2;
					end

					S45:	begin
									nst = SD2;
					end

					SN1:	begin
									nst = S0;
					end

					SN2:	begin
									nst = SD1;
					end

					SD1:	begin
									nst = S0;
					end

					SD2:	begin
									nst = SDD;
					end
		
					SDD:	begin
									nst = SD1;
					end
		
	endcase

end

// next state logic
always @(posedge clk, negedge rst) begin
	if(~rst)
		cst <= S0;
	else
		cst <= nst;
end

// output logic
assign if_ports.candy = ((cst ==5)||(cst ==6)||(cst ==7)||(cst ==8)||(cst ==9));
assign if_ports.n = ((cst == 10) || (cst == 11));
assign if_ports.d = ((cst == 12) || (cst == 13));
endmodule
