#!/bin/bash

# Simple shell script which automates the build process. Roughly analagous
# to build.bat in the same directory. Make sure you have set the script to
# executable: chmod u+x Build.sh

clear
echo "Executing NASM..."
nasm -g -f elf -o Kernel.o Kernel.asm
if [ $? -eq 0 ]
    then
    printf "Successful!\n\n"
    else
    printf "NASM failed :-(\n\n"
    exit
fi

echo "Executing linker (ld)"
ld -T linker.ld -m elf_i386 -o Kernel.bin Kernel.o
if [ $? -eq 0 ]
    then
    printf "Successful!\n\n"
    else
    printf "Linker failed :-(\n\n"
    exit
fi

echo "Copying Kernel.bin into ISO file"
cp Kernel.bin ISO/Kernel.bin
if [ $? -eq 0 ]
    then
    printf "Successful!\n\n"
    else
    printf "Copy failed :-(\n\n"
    exit
fi

echo "Generating ISO9660"
rm "SampleKernel.iso"
mkisofs -o SampleKernel.iso -b ISO/isolinux-debug.bin -no-emul-boot -boot-load-size 4 -boot-info-table . &>/dev/null
if [ $? -eq 0 ]
    then
    printf "Successful!\n\n"
    else
    echo "ISO generation failed :-(\n\n"
    exit
fi
