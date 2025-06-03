# About
This repo is used to test our XuantieC910-based FPGA prototype on NetSume board.
- tests: source files and lib files of test cases.
- setup: scripts to setup Xuantie RISC-V toolchain.
- smart_cfg.mk: test cases related command.
- gdbinit:gdb startup file.
# Usage
## Dependencies and Setup
### OS
This project has been successfully run at CentOS7 and Ubuntu22.04.
### T-Head RISC-V tool chain.
Currently use:Xuantie-900-gcc-linux-5.10.4-musl64-i386-V2.6.1-20220906
available:https://www.xrvm.cn/community/download?id=4224193099938729984
run the command below to setup the toolchain:
```
csh
source setup/setup.csh
bash
```
### T-Head DebugServer 
available:https://www.xrvm.cn/community/download?id=4380347564587814912
## Build Test Case
The test cases lists valid can be found in smart_cfg.mk.
Compiling related settings can be modified in ./test/lib.
run the command below to compile test cases.
```
make buildcase CASE=XXX
```
## Connect to Debug Server
run the command below to connect to T-head debug server console.
```
DebugServerConsole
```
## Debug Using GDB and Serial Tool
run the command below to debug using gdb:
```
run_gdb
```
Using serial tool(e.g. cutecom) to reveive uart data.

# Test Cases
In addition to the test cases provided by openC910, we also provide four Spectre Attack POC programs. 
The compilation settings required to run these programs are as follows:
| POC               | Compilation Condition                     |
|-------------------|------------------------------------------|
| Spectre - v1      | O1; mhcr=0x11df                          |
| Spectre - v2 v5   | O0 (non-O0 causes compilation errors, generating error loops) |
| Spectre - v4      | O1                                       |