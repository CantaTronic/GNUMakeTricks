#the simplest Makefile ever for hello_world program
#with additions to test compilation, based on conditions

CXX:=g++
CXXFLAGS:= -g -Wall -O2 -std=c++0x 

NVCC:=nvcc
NVCCFL:=-arch=compute_35

CXX_INFO := $(shell which $(CXX) >/dev/null 2>&1;)
NVCC_INFO := $(shell which $(NVCC) >/dev/null 2>&1;)

# target:=all
target:=code
source:=hello.cu
todo:=$(NVCC) $(NVCCFLAGS) $(source) -o $(target)

# target=helloCPU

# @echo $(target) 

ifneq ($(СXX_INFO),0)
	target:=helloCPU 
	source:=hello.cc
	todo:=$(CXX) $(CXXFLAGS) $(source) -o $(target)
endif

code:	$(source)
	$(todo)

# all: 	helloCPU helloGPU
# 
helloCPU:  hello.cc
	$(CXX) $(CXXFLAGS) $^ -o $@
# 	
# helloGPU:  hello.cu
# 	$(NVCC) $(NVCCFLAGS) $^ -o $@

#условное удаление цели - как бы она не называлась 
clean:
	@if [ -f $(target) ] ; then echo "Found target to delete"; echo "Removing "$(target); rm $(target); exit 0; else echo "Nothing to delete"; echo $(target); exit 0; fi
# 	rm helloCPU helloGPU
