`timescale 1ns / 1ps
module single_port_RAM(
  input clk,
  input [7:0] data_in,
  input [5:0] addr,
  input RWE,
  output [7:0] data_out
    );
    
    reg [7:0] ram [63:0];
    reg [5:0] addr_reg;
    
    always@(posedge clk)
    begin
    if(RWE)
    ram[addr]<=data_in;
    else
    addr_reg <= addr;
    end
    assign data_out = ram[addr_reg];
endmodule
