`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kirthana P Rao
// 
// Create Date: 31.05.2025 21:04:30
// Design Name: Traffic Controller Testbench
// Module Name: main_tb
// Project Name: Traffic COntroller FSM
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


module main_tb #(parameter WAIT = 20);
    reg clk_tb,rst_tb,ped_NS,ped_EW;
    wire ns_g_tb,ns_r_tb,ns_y_tb,ew_g_tb,ew_r_tb,ew_y_tb;
    wire ped_w;
    //wire [4:0] ctr;
    
    main dut(.clk(clk_tb),.rst(rst_tb),.ped_NS(ped_NS),.ped_EW(ped_EW), 
    .ns_red(ns_r_tb),.ns_yellow(ns_y_tb),.ns_green(ns_g_tb),
    .ew_red(ew_r_tb),.ew_yellow(ew_y_tb),.ew_green(ew_g_tb),
    .ped_wait(ped_w));//,.ctr(ctr));
    
    always #10 clk_tb = ~clk_tb;
    initial begin
        clk_tb = 1'b1; rst_tb = 1'b0; 
        ped_NS = 1'b1; ped_EW = 1'b0; #1000//#430 
        //ped_EW = 1'b1; ped_NS = 1'b0; #430
        //ped_NS = 1'b1; ped_EW = 1'b0; #25
        //ped_NS_tb = 1'b1; #10
        $finish;
    end
endmodule
