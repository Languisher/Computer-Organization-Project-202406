# Computer-Organization-Project-202406

Project of the course Computer Organization

Author: Nan Lin and Yanxu Meng

The requirement of the project can be found [here](assignment/Projet.pdf).

The PDF version of the report can be found [here](report/build/report.pdf).


## Guidance to execute gtkwave in Exercise 5

Reassure that `gtkwave` is installed on the server. If not, execute the following lines:

```bash
sudo apt-get update
sudo apt-get install gtkwave
```

For [Digital](https://github.com/hneemann/Digital) users: If you're using Digital, First export the circuit using `File -> Export -> Export to VHDL`. Ensure that Test cases have been written (`Components -> Misc. -> Test`) and has been tested correct (`Simulation -> Run Tests`). If all the requirements have been satisfied, you would find two files exported in your selected directory.

You should then create a new folder containing all of the two necessary files (a VHDL file and a test-benchmark file), we will name them `circuit.vhdl` and `circuit_tb.vhdl` later on. Change the current directory into the upper folder of the files.

Now create a bash file, suppose that the name is `execute.sh`, type in the following command:

```bash
ghdl -a circuit.vhdl
ghdl -a circuit_tb.vhdl
ghdl -e circuit_tb
ghdl -r circuit_tb --vcd=circuit_tb.vcd
```

Return to the command line, type-in `chmod a+x execute.sh` then execute the bash command file: `./execute.sh`.

Now you should find a file named `circuit_tb.vcd` in the same folder. Then execute

```bash
gtkwave circuit_tb.vcd
```

and the window should appear.