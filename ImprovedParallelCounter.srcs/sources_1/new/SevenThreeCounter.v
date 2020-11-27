`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2020 01:26:21 PM
// Design Name: 
// Module Name: SevenThreeCounter
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


module SevenThreeCounter(input[6:0] A, output[2:0] Out);
wire[5:0] Intermediates;
and(Intermediates[5], A[6], A[5]);
xor(Intermediates[4], A[6], A[5]);
and(Intermediates[3], A[4], A[3]);
xor(Intermediates[2], A[4], A[3]);
and(Intermediates[1], A[2], A[1]);
xor(Intermediates[0], A[2], A[1]);

wire[2:0] topRCAOut;
modifiedTopRCA mtr(Intermediates[3:2], Intermediates[1:0], A[0], topRCAOut[2:0]);
modifiedBottomRCA mbr(Intermediates[5:4], topRCAOut[2:0], Out[2:0]);
endmodule
