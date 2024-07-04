`timescale 1ns / 1ps
module TLC_tb();

reg clk ,reset;
wire [2:0]m1;
wire [2:0]m2;
wire [2:0]mt;
wire [2:0]s;

traffic_light uut(.clk(clk) , .reset(reset) , .m1(m1),.m2(m2),.mt(mt), .s(s));

always #5 clk=~clk;

initial
begin
     clk=0;
     reset=0;
     #50;
     reset=1;
     #20;
     reset=0;
     #100;
     $finish;
     
end




endmodule
