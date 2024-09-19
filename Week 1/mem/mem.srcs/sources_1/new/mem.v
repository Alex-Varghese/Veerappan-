`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2024 16:21:09
// Design Name: 
// Module Name: mem
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


module mem(
    input rst,
    input clk,
    input wr,
    input rd,
    input [3:0]addr,
    input [7:0]Datain,
    output reg [7:0]Dataout
);
reg [7:0]mem[0:10];
always @(posedge clk) 
        if(rst)
        begin
            mem[0] <= 8'b0;
            mem[1] <= 8'b0;
            mem[2] <= 8'b0;
            mem[3] <= 8'b0;
            mem[4] <= 8'b0;
            mem[5] <= 8'b0;
            mem[6] <= 8'b0;
            mem[7] <= 8'b0;
            mem[8] <= 8'b0;
            mem[9] <= 8'b0;
            mem[10] <= 8'b0;
        end
        else if(wr==0 & rd==0)
                Dataout <= 8'b0;
            else if(wr==1 & rd==0)
                    mem[addr] <= Datain; 
                else if(wr==0 & rd==1)
                        Dataout <= mem[addr];
                    else if(wr==1 & rd==1)
                            Dataout <= 8'b0;
                        else
                            Dataout <= 8'b0;
                        
endmodule
