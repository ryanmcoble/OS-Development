#
# OLD COMMANDS
#
# clear;
# qemu-system-x86_64 -drive file=bin/os.raw,format=raw,index=0,media=disk;
# qemu-system-x86_64 bin/os.bin;
# qemu-system-x86_64 bin/boot.bin;
# qemu-system-i386 bin/os.bin;
# gobjdump -M intel,i386 -d bin/build/kernel_v1.o
# sudo dd if=/dev/disk0 of=/tmp/os_bootsector bs=512 count=1 &&
# qemu-system-x86_64 -drive file=bin/build/os.iso,format=iso,index=0,media=disk
# qemu-system-x86_64 -hda bin/os.img -cdrom bin/os.iso -m 512 -enable-kvm;
# ld bin/build/kernel_v1.o -T linker.d -o bin/build/kernel_v1.bin

#kernel_v = 'v1'

#
# Build Bootloader
#
nasm src/boot_loader/boot_loader.asm -f bin -o bin/build/boot.bin

#
# Build C Kernel
#
gcc -ffreestanding -c 'src/kernel/kernel_v1.c' -o 'bin/build/kernel_v1.o' -m32
gobjcopy -O binary 'bin/build/kernel_v1.o' 'bin/build/kernel_v1.bin'

#
# Generate OS Binary/ISO Image File
#
cat bin/build/boot.bin 'bin/build/kernel_v1.bin' > bin/os.bin
truncate bin/os.bin -s 1200k
mkisofs -o bin/os.iso -b os.bin bin

