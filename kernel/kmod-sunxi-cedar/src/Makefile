uname_r=$(shell uname -r)
obj-m += cedar_ve.o

all:
	make -C /lib/modules/$(uname_r)/build M=$(PWD) modules
	
clean:
	make -C /lib/modules/$(uname_r)/build M=$(PWD) clean
	
.PHONY: all clean
