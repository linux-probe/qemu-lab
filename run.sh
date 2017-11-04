#!/bin/bash

PATH_PWD=`pwd`
echo $PATH_PWD

QEMU_ARM64=$PATH_PWD/qemu/qemu/aarch64-softmmu/qemu-system-aarch64
KERNEL=$PATH_PWD/runninglinuxkernel_4.0-master/arch/arm64/boot/Image
CMDLINE='"rdinit=/linuxrc console=ttyAMA0"'

echo $CMDLINE

# open qemu console in telent
#$QEMU_ARM64 -machine virt -cpu cortex-a57 -nographic -m 1024 -smp 4 -kernel $KERNEL --append "rdinit=/linuxrc console=ttyAMA0" -s -S -monitor telnet:127.0.0.1:5555,server


#$QEMU_ARM64 -machine virt -cpu cortex-a57 -nographic -m 1024 -smp 4 -kernel $KERNEL --append "rdinit=/linuxrc console=ttyAMA0" -s -S -drive if=none,id=image,file=rootfs.img,id=hd0 -device virtio-blk-device,drive=image

$QEMU_ARM64 -machine virt -cpu cortex-a57 -nographic -m 1024 -smp 4 -kernel $KERNEL --append "rdinit=/linuxrc console=ttyAMA0"  -drive if=none,id=image,file=rootfs.img,id=hd0 -device virtio-blk-device,drive=image
