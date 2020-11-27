`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2020 01:09:20 PM
// Design Name: 
// Module Name: modifiedBottomRCA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Tested individually, and works.
// 
//////////////////////////////////////////////////////////////////////////////////


module modifiedBottomRCA(input[1:0] A, input[2:0] B, output[2:0] Out);
// S0:
wire[1:0] S0Intermediate;
and(S0Intermediate[0], ~A[0], B[0]);
and(S0Intermediate[1], A[0], ~B[0]);
or(Out[0], S0Intermediate[0], S0Intermediate[1]);

// S1:
wire[3:0] S1Intermediate;
and(S1Intermediate[0], A[1], ~B[1]);
and(S1Intermediate[1], ~A[1], ~A[0], B[1]);
and(S1Intermediate[2], ~A[1], B[1], ~B[0]);
and(S1Intermediate[3], A[0], ~B[1], B[0]);
or(Out[1], S1Intermediate[0], S1Intermediate[1], S1Intermediate[2], S1Intermediate[3]);

// Cout:
wire[1:0] CoutIntermediate;
and(CoutIntermediate[0], A[1], B[1]);
and(CoutIntermediate[1], A[0], B[1], B[0]);
or(Out[2], B[2], CoutIntermediate[0], CoutIntermediate[1]);
endmodule