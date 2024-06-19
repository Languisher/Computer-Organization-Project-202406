ghdl -a circuit.vhdl
ghdl -a circuit_tb.vhdl
ghdl -e circuit_tb
ghdl -r circuit_tb --vcd=circuit_tb.vcd
