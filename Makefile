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

# ifneq '$(СXX_INFO)' '1'
# 	target+=helloCPU 
# endif


# else
# 	@echo "СXX_INFO = 1";

# ifneq ($(NVCC_INFO),0)
# 	target+=helloGPU 
# # 	source:=hello.cu
# # 	todo:=$(NVCC) $(NVCCFL) $(source) -o $(target)
# endif
# 
# # ifneq ($(ICС_INFO),0)
# # 	target:=helloCPU 
# # 	source:=hello.cc
# # 	todo:=$(ICC) $(ICCFL) $(source) -o $(target)
# # endif

# all: $(target)
# 	@echo "Target is "$(target)
# 	@if [ $(CXX_INFO) = 0 ] ; then echo "yes g++"; exit 0; else echo "no g++"; exit 0; fi
# 	@if [ $(NVCC_INFO) = 0 ] ; then echo "yes nvcc"; exit 0; else echo "no nvcc"; exit 0; fi
# 	@if [ $(ICC_INFO) = 0 ] ; then echo "yes icc"; exit 0; else echo "no icc"; exit 0; fi
# 	@if [[ $(CXX_INFO) = 1 || $(NVCC_INFO) = 1 || $(ICC_INFO) = 0 ]] ; then echo "yes"; exit 0; else echo "no"; exit 0; fi

info:	$(source)
	@echo "Compiler info: "
	@echo "g++:"$(CXX_INFO)
	@echo "nvcc:"$(NVCC_INFO)
	@echo "icpc:"$(ICC_INFO)

helloCPU:  hello.cc
	$(CXX) $(CXXFLAGS) $^ -o $@
	
helloGPU:  hello.cu
	@if [ $(NVCC_INFO) = 0 ] ;\
	then echo "GPU compilation...";\
	$(NVCC) $(NVCCFLAGS) $^ -o $@ ;exit 0;\
	else echo "No nvcc compiler =(( Please, install it before use!";\
	exit 0; fi
# 	$(NVCC) $(NVCCFLAGS) $^ -o $@

#условное удаление цели - как бы она не называлась 
clean:
	@if [ -f helloCPU ] ; then echo "Found target to delete"; echo "Removing helloCPU..."; rm helloCPU; exit 0; else echo "Nothing to delete"; exit 0; fi
# 	rm helloCPU helloGPU
