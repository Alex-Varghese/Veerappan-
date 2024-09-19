`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2024 16:40:53
// Design Name: 
// Module Name: mem_tb
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


module testbench;
    reg rst;
    reg clk;
    reg wr;
    reg rd;
    reg [3:0] addr;
    reg [7:0] Datain;
    wire [7:0] Dataout;
   
    mem U(.rst(rst),.clk(clk),.wr(wr),.rd(rd),.addr(addr),.Datain(Datain),.Dataout(Dataout));
    
    integer i;
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        rst = 1;
        wr = 0;
        rd = 0;
        addr = 4'b0000;
        Datain = 8'b00000000;
        #10 rst = 1;  
        #5 $display("Reset applied. Memory should be cleared.");
        #10 rst = 0; 
        #10 rd = 1; 
        addr = 4'b1000; 
        #5 $display(" Reading nondeclared memory: Address = %d, Datain = %d, Dataout = %d at time %t", addr, Datain, Dataout, $time);        
        for (i = 0; i <= 10; i = i + 1) 
        begin
             #10 wr = 1; 
             rd = 0;
             addr = i; 
             Datain = i * 8'h11;  
            $display("Writing %d : Address = %d at time %t", Datain, addr, $time);
        end
        for (i = 0; i <= 10; i = i + 1) 
        begin
            #10 wr = 0; 
            rd = 1; 
            addr = i;
            #5 $display("Address = %d, Datain = %d, Dataout = %d at time %t", addr, Datain, Dataout, $time);
        end
        #10 rst = 1;  
        #5 $display("Reset done");
        #10 rst = 0;         
        for (i = 0; i <= 10; i = i + 1) 
        begin
            #10 wr = 0;
            rd = 1; 
            addr = i;
            #5 $display("After reset: Address = %d, Datain = %d, Dataout = %d at time %t", addr, Datain, Dataout, $time);
        end        
        #10 wr = 1; 
        rd = 0; 
        addr = 4'b0011; 
        Datain = 8'hEE;  
        $display("Writing %d to Address = %d at time %t", Datain, addr, $time);
        #4 wr = 0; 
        rd = 1; 
        addr = 4'b0011; 
        $display("Read from Address = %d, Dataout = %d at time %t", addr, Dataout, $time);
        #20 $finish;
    end
endmodule

