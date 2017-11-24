
CMD := gcc
# CMD := nvcc

# which $(CMD) = Does system have CMD ? 0: 1

# >/dev/null 2>&1 discards all output
# echo $? prints the return value of last command, thus assigning it to CMD_INFO
# as $ is a control character in makefiles,
# double $$ in makefile is converted to a single $ when passed to shell
# CMD_INFO := $(shell which $(CMD) >/dev/null 2>&1; echo $$?)
CMD_INFO := $(shell which $(CMD))

OBJS     := object0 object1
# object_1 object_2
# if CMD was found, CMD_INFO equals 0 and conditionals are added to OBJS
ifeq ($(CMD_INFO),0)
	echo "System has ".$(CMD)
  OBJS += conditional_object_0 
  OBJS -= object1
endif

run:
	@echo $(OBJS)

.PHONY: run
