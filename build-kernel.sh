#!/bin/bash
set -e
VER=6.10
KERNEL_DIR=linux-${VER}

if [ ! -d ${KERNEL_DIR} ];then
    wget -c https://mirrors.hust.edu.cn/kernel.org/linux/kernel/v6.x/linux-${VER}.tar.xz
    tar -xf linux-${VER}.tar.xz
fi

cd ${KERNEL_DIR}
make x86_64_defconfig
# 开启模块支持、调试信息
scripts/config --set-val CONFIG_MODVERSIONS y
scripts/config --set-val CONFIG_ASM_MODVERSIONS y
scripts/config --set-val CONFIG_PRINTK_CALLER y
scripts/config --set-val CONFIG_DEBUG_INFO_NONE n
scripts/config --set-val CONFIG_DEBUG_INFO y
scripts/config --set-val CONFIG_DEBUG_INFO_DWARF5 y
make -j$(nproc)
cd ..
echo "内核编译完成: ${KERNEL_DIR}/arch/x86/boot/bzImage"
