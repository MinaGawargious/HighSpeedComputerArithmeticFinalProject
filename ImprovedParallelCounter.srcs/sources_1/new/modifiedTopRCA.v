`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2020 12:46:27 PM
// Design Name: 
// Module Name: modifiedTopRCA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Tested individually and works.q
// 
//////////////////////////////////////////////////////////////////////////////////

                        //      A B           C D         E
module modifiedTopRCA(input[1:0] A, input[1:0] B, input Cin, output[2:0] Out);
// S0:
wire[3:0] S0Intermediate;
and(S0Intermediate[0], ~A[0], ~B[0], Cin);
and(S0Intermediate[1], ~A[0], B[0], ~Cin);
and(S0Intermediate[2], A[0], ~B[0], ~Cin);
and(S0Intermediate[3], A[0], B[0], Cin);
or(Out[0], S0Intermediate[0], S0Intermediate[1], S0Intermediate[2], S0Intermediate[3]);

// S1:
wire[5:0] S1Intermediate;
or(S1Intermediate[0], ~A[1], ~B[1]);
or(S1Intermediate[1], ~A[0], ~B[1], ~Cin);
or(S1Intermediate[2], ~A[1], ~B[0], ~Cin);
or(S1Intermediate[3], A[1], A[0], B[1], B[0]);
or(S1Intermediate[4], A[1], A[0], B[1], Cin);
or(S1Intermediate[5], A[1], B[1], B[0], Cin);
and(Out[1], S1Intermediate[0], S1Intermediate[1], S1Intermediate[2], S1Intermediate[3], S1Intermediate[4], S1Intermediate[5]);

// Cout:
wire[2:0] CoutIntermediate;
and(CoutIntermediate[0], A[1], B[1]);
and(CoutIntermediate[1], A[0], B[1], Cin);
and(CoutIntermediate[2], A[1], B[0], Cin);
or(Out[2], CoutIntermediate[0], CoutIntermediate[1], CoutIntermediate[2]);
endmodule