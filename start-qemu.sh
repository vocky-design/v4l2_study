#!/bin/bash
KERNEL=./linux-6.10/arch/x86/boot/bzImage
ROOTFS=./rootfs.ext4

qemu-system-x86_64 \
    -kernel $KERNEL \
    -drive format=raw,file=$ROOTFS \
    -append "root=/dev/sda rw console=ttyS0" \
    -nographic \
    -serial stdio
