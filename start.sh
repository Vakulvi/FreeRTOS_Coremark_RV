#!/bin/bash
echo cleaning in progress.. &&
echo &&
make -C build/gcc/ clean &&
echo &&
echo compilation in progress.. &&
echo &&
make -C build/gcc/ &&
echo &&
echo emulation in progress.. &&
qemu-system-riscv32 \
  -machine virt \
  -nographic \
  -net none \
  -chardev stdio,id=con,mux=on \
  -serial chardev:con \
  -mon chardev=con,mode=readline \
  -bios none \
  -smp 4 \
  -kernel ./build/gcc/output/FreeRTOS_Coremark_RV.elf