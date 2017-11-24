#the simplest Makefile ever for hello_world program
#with additions to test compilation, based on conditions

CXX:=g++
CXXFLAGS:= -g -Wall -O2 -std=c++0x 

NVCC:=nvcc
NVCCFL:=-arch=compute_35

ICC:=icpc
ICCFL:= -g -Wall -O2 -std=c++0x 

CXX_INFO := $(shell which $(CXX) >/dev/null 2>&1; echo $$?)
NVCC_INFO := $(shell which $(NVCC) >/dev/null 2>&1; echo $$?)
ICC_INFO := $(shell which $(ICC) >/dev/null 2>&1; echo $$?)

info:	
	@echo "Compiler info: "
	@echo "g++:"$(CXX_INFO)
	@echo "nvcc:"$(NVCC_INFO)
	@echo "icpc:"$(ICC_INFO)

helloCPU:  hello.cc
	@if [ $(CXX_INFO) = 0 ] ;\
	then echo "CPU compilation..."; \
	$(CXX) $(CXXFLAGS) $^ -o $@ ; exit 0;\
	else echo "No g++ compiler has found =(( Please, install it before use!";\
	exit 0; fi
	
helloGPU:  hello.cu
	@if [ $(NVCC_INFO) = 0 ] ;\
	then echo "GPU compilation...";\
	$(NVCC) $(NVCCFLAGS) $^ -o $@ ;exit 0;\
	else echo "No nvcc compiler has found =(( Please, install it before use!";\
	exit 0; fi
	
helloPHI:  hello.cc
	@if [ $(ICC_INFO) = 0 ] ;\
	then echo "PHI compilation..."; \
	$(ICC) $(ICCFLAGS) $^ -o $@ ; exit 0;\
	else echo "No icpc compiler has found =(( Please, install it before use!";\
	exit 0; fi
	
clean:
	@if [ -f helloCPU ] ; then echo "Found target to delete"; echo "Removing helloCPU..."; rm helloCPU; exit 0; else echo "Nothing to delete"; exit 0; fi
	@if [ -f helloGPU ] ; then echo "Found target to delete"; echo "Removing helloGPU..."; rm helloGPU; exit 0; else echo "Nothing to delete"; exit 0; fi
	@if [ -f helloPHI ] ; then echo "Found target to delete"; echo "Removing helloCPU..."; rm helloPHI; exit 0; else echo "Nothing to delete"; exit 0; fi
