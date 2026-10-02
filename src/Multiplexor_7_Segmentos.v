`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2026 13:45:27
// Design Name: 
// Module Name: Multiplexor_7_Segmentos
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


module Multiplexor_7_Segmentos(
    input clk,
    input [15:0] sw,            // 4 bits para cada display
    output [6:0] seg,           // segmentos a-g
    output [3:0] an             // ánodos de los displays
);

    wire [1:0] sel;
    wire clk_2kHz;
    wire [3:0] mux_out;

    // Divisor de frecuencia a 2kHz
    clkdiv_2khz div2k (.clk(clk), .clk_out(clk_2kHz));

    // Contador de 2 bits (para los 4 displays)
    counter_2bit counter (.clk(clk_2kHz), .out(sel));

    // Multiplexor 4x1 (4 bits cada entrada)
    mux4x1_4bit mux (
        .a(sw[3:0]),
        .b(sw[7:4]),
        .c(sw[11:8]),
        .d(sw[15:12]),
        .sel(sel),
        .out(mux_out)
    );

    // Decodificador BCD/HEX a 7 segmentos
    DEC_7seg bcd (.bcd(mux_out), .seg(seg));

    // Decodificador de 2 a 4 para los ánodos
    decoder_2to4 dec (.sel(sel), .an(an));

endmodule
