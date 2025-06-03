`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2025 15:29:41
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main #(parameter WAIT = 20)(input clk,rst,ped_NS,ped_EW, 
    output ns_red, ns_yellow, ns_green, ew_red, 
    ew_yellow, ew_green, output reg ped_wait);
    
    initial ped_wait = 1'b0;
          
    fsm ns1(.clk(clk),.rst(rst),.ped_mode(ped_NS),.ps2(ns_red),.ps1(ns_yellow),.ps0(ns_green));
    fsm ew1(.clk(clk),.rst(rst),.ped_mode(ped_EW),.ps2(ew_red),.ps1(ew_yellow),.ps0(ew_green));
    fsm ew2(.clk(clk),.rst(rst),.ped_mode(ped_EW),.ps2(ew_red),.ps1(ew_yellow),.ps0(ew_green));
    fsm ns2(.clk(clk),.rst(rst),.ped_mode(ped_NS),.ps2(ns_red),.ps1(ns_yellow),.ps0(ns_green));
    
    always @(posedge clk) begin //fsm
        if(ped_NS | ped_EW) begin
            if (ns_red | ew_red)
                ped_wait <= 1'b1;
            else
                ped_wait <= 1'b0;
        end
    end
endmodule
