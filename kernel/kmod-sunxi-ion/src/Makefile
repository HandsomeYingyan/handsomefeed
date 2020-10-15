uname_r=$(shell uname -r)

obj-m +=	ion.o ion-ioctl.o ion_heap.o \
			ion_page_pool.o ion_system_heap.o \
			ion_carveout_heap.o ion_chunk_heap.o ion_cma_heap.o \
			ion_of.o
obj-m += compat_ion.o
obj-m += sunxi/


all:
	make -C /lib/modules/$(uname_r)/build M=$(PWD) modules
	
clean:
	make -C /lib/modules/$(uname_r)/build M=$(PWD) clean
	
.PHONY: all clean
