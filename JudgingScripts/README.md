# CA-Practical-4042

## Prerequisites

To run this system, you have 2 available approahes: Docker and Baremetal

### Docker

for using Docker you just need to setup Iranian registries in your docker config so you can build the image and then use it.

if you are using Linux Operating Systems, just go to /etc/docker/daemon.json and write this inside it
```json
// daemon.json
{
  "registry-mirrors": [
    "https://docker.arvancloud.ir",
    "https://mirror-docker.runflare.com",
    "https://docker.iranserver.com",
    "https://registry.docker.ir",
    "https://focker.ir",
    "https://docker.haiocloud.com",
    "https://docker.mobinhost.com"
  ]
}
```

then you have to restart your docker with these commands to apply the changes:

```bash
sudo systemctl restart docker
```

if you are using Mac Os, go to your Docker Desktop->Settings->Docker Engine and write the given daemon.json file above inside it and then restart Docker Deskop.

after this you have to build the image described inside the Dockerfile. you can do this with running the command below inside the repo folder:
```bash
chmod +x ./scripts/build.sh
./scripts/build.sh
```

### Bare-metal
if you want to run the judge on your own Operating System, you need to install these:
```bash
# iverilog
# python (python-is-python3)
# ubuntu/debian (apt):
sudo apt install iverilog python3 python-is-python3
# arch (pacman)
sudo pacman -S iverilog python
# mac os
brew install icarus-verilog python
```

### How the Grading System Works

The grading system consists of two main components:


1. **Helper Scripts**:

   - `./synthesize.sh [circuit path]`:
     This script synthesizes your circuit description into Verilog code.
     The synthesized description is placed in the `~/logisim_evolution_workspace/` directory.

   - `./validate.sh [testbench path] [synthsized circuit path]`:
     This script takes the given test bench (related to the specific question)
     and the location of the synthesized description, tests the designed circuit, and assigns a score.

   - `./synth_valid.sh [circuit path] [testbench path]`:
     This script essentially combines the two previous scripts and ran the judge Baremetally. It first performs the synthesis process and then evaluates the synthesized output.

   - `./judge.sh [circuit path] [testbench path]`: 
     This script uses Docker run command to correctly run the image made for running tests with the given testbench.
   - `./build.sh`:
     This is the script that will run Docker Build command on the Dockerfile at base of the repo folder and name it myenv.
2. **Test Bench Files**:
   These files contain the logic for creating various tests and verifying the correctness
   of your circuit. Since these files include the scoring logic, you can use them to debug and fix issues in your circuits.


## Homework 1

In this homework, you will design a 32-bit adder/subtractor.

The ports of this circuit are as follows:

```verilog
input [31:0] a
input [31:0] b
input sub_notadd
output [31:0] s
output cout
```

Based on what you have learned in previous courses, such a circuit can be described as follows:

```verilog
!sub_notadd  :    {cout , s} = a + b
sub_notadd   :    {cout , s} = a + ~b + 1
```

The evaluation of this exercise is done with the following command:



```bash
# Docker
./judge.sh ./HW1/bench.circ ./HW1/tb.v
# Baremetal
./synth_valid.sh ./HW1/bench.circ ./HW1/tb.v
```

Since this is the first exercise, it is primarily intended for practice
and familiarization with the grading system. The answer is essentially provided
in the file `./HW1/bench.circ`, and you only need to execute and review it in your report.
However, given that you will encounter much more complex circuits later in the course,
I strongly recommend that you take this opportunity to get comfortable with using `logisim` and design this circuit on your own.

## Homework 2

### Question 1
Design a circuit that operates according to the following instructions:
```
load:   r1 <= in1
0:      r2 <= r1
1:      r1 <= r1 << 1
2:      r2 <= r1 xor r2
3:      out1 <= -r2
        r2   <= -r2
```

The ports of this circuit are as follows:

```verilog
input [31:0] in1
input load
input clk
output [31:0] out1
```

The evaluation of this question is done with the following command:

```bash
# Docker
./judge.sh schematic.circ ./HW2/tb1.v
# Baremetal
./synth_valid.sh schematic.circ ./HW2/tb1.v
```
### Question 2 – 32‑bit Unsigned Multiplier (16 cycles)

Design a 32‑bit unsigned multiplier that produces a 64‑bit product.  
The multiplication must be completed in **exactly 16 clock cycles** after the `start` signal is asserted.  

Your design must use:
- **carry‑save adder (CSA)** to sum multiple partial products efficiently.

#### Circuit specifications

The circuit has the following ports:

```verilog
input        clk
input        start
input        rst_n
input  [31:0] a
input  [31:0] b
output       done
output [31:0] res_hi
output [31:0] res_low
```

## Special Thanks:

