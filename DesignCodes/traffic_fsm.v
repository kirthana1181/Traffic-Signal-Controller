`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kirthana P Rao
// 
// Create Date: 26.05.2025 23:52:57
// Design Name: Pedestrian Control
// Module Name: fsm
// Project Name: Traffic Signal Controller
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
//mode = 1 means ped_EW/ped_NS = 1
//mode = 0 means ped_EW/ped_NS = 0

module fsm #(parameter WAIT = 20)
(input clk,rst,ped_mode,output reg ps2,ps1,ps0);
reg [4:0]ctr;
reg [2:0]sig;

initial ctr = 0;
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            case(ped_mode)
                1'b0: begin
                        {ps2,ps1,ps0} <= 3'b001;
                        if((ctr > 2) && (ctr <= 8)) {ps2,ps1,ps0} <= 3'b001; //green
                        if(ctr <= 2) {ps2,ps1,ps0} <= 3'b010;  //yellow
                        if((ctr > 8) && (ctr <= 20)) {ps2,ps1,ps0} <= 3'b100;  //red
                        end
                1'b1: begin
                        {ps2,ps1,ps0} <= 3'b100;
                        if(ctr <= 2){ps2,ps1,ps0} <= 3'b010; //yellow
                        if((ctr > 2) && (ctr <= 8)){ps2,ps1,ps0} <= 3'b100;//red
                        if((ctr > 8) && (ctr <= 20)){ps2,ps1,ps0} <= 3'b001; //green
                        end
            endcase
        end
        else
            sig <= 3'b000;
    end
      
  always @(posedge clk or negedge rst) begin  //counter
    if(rst || (ctr > WAIT))
        ctr <= 0;
    else
        ctr <= ctr + 1; 
  end

endmodule
