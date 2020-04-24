//////////////////////////////////////////////////////////////////////////////////
// Design: UP/DOWN Counter
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module up_down_counter(ud, clk, rst, out);

    parameter N=4;
    
    input  wire ud;   //up or down control
    input  wire clk;
    input  wire rst;
    output reg  [N-1:0] out;
    
    always @(posedge clk)
        begin
            if(rst == 1'b1) begin
                out = 4'h0;
            end else if (ud == 1'b1) begin
                    out = out + 1;
                end else begin
                    out = out - 1;
                end     
        end   
endmodule
