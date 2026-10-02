`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2026 13:53:08
// Design Name: 
// Module Name: clkdiv_2khz
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


module clkdiv_2khz(input clk, output reg clk_out);
    reg [15:0] count = 0;
    always @(posedge clk) begin
        if (count == 24999) begin     // 100 MHz / (2*25000) = 2 kHz
            count <= 0;
            clk_out <= ~clk_out;
        end else
            count <= count + 1;
    end
endmodule

