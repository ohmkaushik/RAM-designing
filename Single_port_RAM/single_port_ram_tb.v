`timescale 1ns / 1ps
module single_port_ram_tb();
reg [7:0] data_in;
reg [5:0] addr;
reg RWE;
reg clk;
wire [7:0] data_out;

single_port_RAM dut(
.data_in(data_in),
.addr(addr),
.clk(clk),
.data_out(data_out),
.RWE(RWE)
);

initial
begin
clk=1'b1;
forever #5 clk=~clk;
end

initial
begin
data_in=8'h01;
addr=5'd0;
RWE=1'B1;
#10;

data_in=8'h02;
addr=5'd1;
#10;

data_in=8'h03;
addr=5'd2;
#10;

addr=5'd0;
RWE=1'B0;
#10;

addr=5'd1;
#10;

addr=5'd2;
#10;

data_in=8'h04;
addr=5'd1;
RWE=1'B1;
#10;

addr=5'd1;
RWE=1'b0;
end
endmodule
