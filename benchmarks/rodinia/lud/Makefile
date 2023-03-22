all: lud_cuda 

lud_common:
	$(MAKE) -C common

lud_base:
	$(MAKE) -C base

lud_cuda: lud_common lud_base
	$(MAKE) -C cuda
	rm -f lud.cupbop lud.hipify
	ln -s cuda/lud.cupbop lud.cupbop
	ln -s cuda/lud.hipify lud.hipify

clean:
	$(MAKE) -C cuda clean
	$(MAKE) -C common clean
	$(MAKE) -C base clean
	rm -f lud.cupbop lud.hipify
