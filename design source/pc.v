
// Module:  pc_reg
// File:    pc_reg.v
// Author:  
// E-mail:  
// Description: command pointer register PC
// Revision: 1.0
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module pc_reg(

	input	wire									clk,
	input wire										rst,
	
	output reg[`InstAddrBus]			pc,//32 bits address 
	output reg                    ce//enable signal for next stage 
	
);

	always @ (posedge clk) begin
		if (ce == `ChipDisable) begin
			pc <= 32'h00000000;
		end else begin
	 		pc <= pc + 4'h4;//Byte addressing 32bit= 4bytes
		end
	end
	
	always @ (posedge clk) begin
		if (rst == `RstEnable) begin
			ce <= `ChipDisable;
		end else begin
			ce <= `ChipEnable;
		end
	end

endmodule
