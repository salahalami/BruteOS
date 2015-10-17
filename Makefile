GCC = gcc.exe
NASM = nasm.exe
OBJCOPY = objcopy.exe
QEMU = "qemu-system-i386.exe"

build:
	$(GCC) -ffreestanding -c kernel.c -o kernel.o
	$(NASM) kernel_entry.asm -f elf -o kernel_entry.o
	$(GCC) -T linker.ld -o kernel.tmp -ffreestanding -O2 -nostdlib kernel_entry.o kernel.o -lgcc
	$(OBJCOPY) -O binary -j .text kernel.tmp kernel.bin
	$(NASM)  bootsect.asm -f bin -o bootsect.bin
	copy /b bootsect.bin + kernel.bin os-image.bin
	$(QEMU) -fda os-image.bin

clean:
	del kernel.o
	del kernel_entry.o
	del kernel.tmp
	del kernel.bin
	del bootsect.bin
	del os-image.bin
