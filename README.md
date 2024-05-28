# Computer-Organization-Project-202406

Project of the course Computer Organization

Author: English version of the project: by Languisher

The PDF file can be found [here](report/build/report.pdf)


## Guidance to execute gtkwave in Exercise 5

First, reassure that `gtkwave` is installed on the server. If not, execute the following lines:

```bash
sudo apt-get update
sudo apt-get install gtkwave
```

You should then create a new folder containing all the necessary files (a VHDL file and a test-benchmark file), we will name them `circuit.vhdl` and `circuit-tb.vhdl` later on. Change the current directory into the upper folder of the files.

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