import uvm_pkg::*;

`include "uvm_macros.svh"

`include "interface.sv"

//`include "DESIGN.sv"

//`include "DUT.sv"

`include "dram_seq_item.sv"

`include "dram_seq.sv"

`include "dram_seqr.sv"

`include "dram_drv.sv"

`include "dram_cov.sv"

`include "dram_mon1.sv"

`include "dram_mon2.sv"

`include "dram_agent1.sv"

`include "dram_agent2.sv"

`include "dram_sb.sv"

`include "dram_env.sv"

`include "dram_test.sv"

module testbench();

bit clk;

initial

begin

clk=1'b0;

forever #5 clk=~clk;

end

intif inf(clk);

DUT dut(inf);

initial

begin

uvm_config_db#(virtual intif)::set(uvm_root::get(),"*","inf",inf);

run_test("dram_test");

end

endmodule// Code your testbench here
// or browse Examples
