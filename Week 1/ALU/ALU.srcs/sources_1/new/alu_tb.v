`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2024 00:09:40
// Design Name: 
// Module Name: alu_tb
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


module alu_tb; 
    reg [31:0]A,B;     
    reg [3:0]fun;       
    wire [31:0]Y; 
    wire c_out;      
        
    ALU U(.A(A),.B(B),.fun(fun),.Y(Y),.c_out(c_out));

    integer i,j;
    
    initial 
    begin
        A = 32'b0; 
        B = 32'b0;
        fun = 4'b0; 
        #10;
        for (i = 0; i < 8; i = i + 1) 
        begin
            A = A + 1;              
            for (j = 0; j < 8; j = j + 1)
            begin
               B = B + 1;  
               fun = j; 
               #10; 
               $display("A = %h , B = %h , fun = %b , Y = %h , c_out = %b ", A , B , fun , Y , c_out);
            end
        end    
        A = 32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;
        B = 32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;
        fun = 4'b0; //Z inputs
        #10; 
        $display("A = %h , B = %h , fun = %b , Y = %h , c_out = %b ", A , B , fun , Y , c_out);      
        A = 32'bXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
        B = 32'bXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
        fun = 4'b0; //X inputs
        #10;
        $display("A = %h , B = %h , fun = %b , Y = %h , c_out = %b ", A , B , fun , Y , c_out);
        $finish;
    end
endmodule

