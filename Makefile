#/*Copyright 2019-2021 T-Head Semiconductor Co., Ltd.
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
#*/

include ./smart_cfg.mk


################################################################################
# Cases related
################################################################################
showcase:
	@echo "  Case lists:" \ 
	@for case in $(CASE_LIST) ; do \
          echo "    $$case"; \
        done

buildcase:
ifeq ($(CASE),)
	$(error Please specify CASE=xxx on the command line, like: \
        $(newline)   > make buildcase CASE=xxx... \
        $(newline)   The list of valid cases can be obtained by executing: \
        $(newline)   > make showcase ...)
endif
ifeq ($(findstring $(CASE), $(CASE_LIST)), $(CASE))
	@make -s cleancase
	@make -s $(CASE)_build
else
	$(error Argument CASE=xxx is not valid: \
        $(newline)   The list of valid cases can be obtained by executing: \
        $(newline)   > make showcase ...)
endif

cleancase:
	@cd ./work && rm -rf *.s *.S *.c *.o *.pat *.h *.lcf *.hex *.obj *.vh *.v *.report *.elf Makefile *.case.log

run_gdb:
	@$(TOOL_EXTENSION)/riscv64-unknown-elf-gdb work/$(CASE).elf -x ./gdbinit
################################################################################
# Combined flows
################################################################################
# Execute one case

################################################################################
# Misc
################################################################################
.DEFAULT_GOAL := help

clean:
	@cd ./work && rm -rf * 

	


