`timescale 1ns / 1ps
module dual_port_ram_tb();
reg [7:0] data_a, data_b;
reg [5:0] addr_a, addr_b;
reg RWE_a, RWE_b, clk;
wire [7:0] data_outa, data_outb;

dual_port_ram dut(
.data_a(data_a),
.data_b(data_b),
.addr_a(addr_a),
.addr_b(addr_b),
.clk(clk),
.RWE_a(RWE_a),
.RWE_b(RWE_b),
.data_outa(data_outa),
.data_outb(data_outb)
);

initial
begin
clk=1'b1;
forever
#5 clk=~clk;
end

initial
begin
data_a=8'h33;
addr_a=6'h01;

data_b=8'h44;
addr_b=6'h02;

RWE_a=1'b1;
RWE_b=1'b1;
#10;

data_a=8'h33;
addr_a=6'h01;

data_b=8'h44;
addr_b=6'h02;

RWE_a=1'b1;
RWE_b=1'b1;
#10;

data_a=8'h55;
addr_a=6'h03;

addr_b=6'h01;

RWE_b=1'b0;
#10;

addr_a=6'h02;

addr_b=6'h03;

RWE_a=1'b0;
#10;

addr_a=6'h01;

data_b=8'h77;
addr_b=6'h02;

RWE_b=1'b1;
#10;
end

initial
#40
$stop;
endmodule
