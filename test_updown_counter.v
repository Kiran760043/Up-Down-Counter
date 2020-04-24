//////////////////////////////////////////////////////////////////////////////////
// Design: Test bench for UP/DOWN Counter
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module test_updown_counter( );

    parameter N=4;

    //inputs for DUT
    reg  ud  = 1'b0;          //control signal
    reg  clk = 1'b1;
    reg  rst = 1'b1;
    //outputs for DUT
    wire [N-1:0] out;
    //counter for loop
    reg [N:0] k = 4'h0;

    up_down_counter DUT (.ud(ud), .clk(clk), .rst(rst), .out(out));

    initial
        begin
            $display($time, " << Simulation Results >>");
            $monitor($time, "Up_down control = %b, Clk = %b, rst = %b, OUT = %b", ud, clk, rst, out);
        end

    initial
        begin
            forever #10 clk = ~clk;
        end



    initial
        begin
            #30;
            rst = 1'b1;
            forever begin
                #20;
                rst = 1'b0;
                k = k+1;
                if (k == 32) begin
                    $finish;
                end else begin
                    if (k <= 16)
                        ud = 1'b0;
                    else
                        ud = 1'b1;
                    end
                end
            end

endmodule
