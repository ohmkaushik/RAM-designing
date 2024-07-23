`timescale 1ns / 1ps
module dual_port_ram(
input [7:0] data_a,
input [7:0] data_b,
input [5:0] addr_a,
input [5:0] addr_b,
input RWE_a, RWE_b,
input clk,
output reg [7:0] data_outa,
output reg [7:0] data_outb
    );
    
 reg[7:0] ram[63:0];
 
 always@(posedge clk)
 begin
 if(RWE_a)
    ram[addr_a]=data_a;
  else
    data_outa<=ram[addr_a];
 end
 
 always@(posedge clk)
 begin
 if(RWE_b)
 ram[addr_b]<=data_b;
 else
 data_outb<=ram[addr_b];
 end
endmodule
