ifeq ($(KERNELRELEASE),)
KVERS_UNAME ?= $(shell uname -r)

# KBUILD is the path to the Linux kernel build tree.  It is usually the
# same as the kernel source tree, except when the kernel was compiled in
# a separate directory.

KBUILD ?= $(shell readlink -f /lib/modules/$(KVERS_UNAME)/build)
SRC_DIR=$(shell pwd)
endif

MODULE := cedar_ve.ko
obj-m += cedar_ve.o


all: modules
modules:
	$(MAKE) -C $(KBUILD) M=$(SRC_DIR)

$(MODULE):
	$(MAKE) modules
	
clean:
	rm -f *.o *.ko .*.cmd *.mod.c *.symvers modules.order
	rm -rf .tmp_versions
	
.PHONY: all clean
