lib-y		:= bitops.o delay.o clear_user.o			\
		   copy_from_user.o copy_to_user.o copy_in_user.o	\
		   copy_page.o clear_page.o				\
		   memchr.o memmove.o memset.o memcpy.o			\
		   strchr.o strrchr.o					\
		   string.o tishift.o

ifeq ($(CONFIG_KERNEL_MODE_NEON), y)
obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
CFLAGS_REMOVE_xor-neon.o	+= -mgeneral-regs-only
CFLAGS_xor-neon.o		+= -ffreestanding
endif
