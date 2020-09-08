#Computer Architecture Weekly Labs
We are using the Icarus Verilog Tool for compiling the verilog code and using the GTKWave Tool for plotting the resultant waveforms.

##Commands to run the code

~$ iverilog -o executable_name file_name.v
~$ vvp executable_name //This will display the name of a .vcd file which will be created using the testbench. We can change its name within the testbench module.
~$ gtkwave file_name_provided_by_the_above_command.vcd
