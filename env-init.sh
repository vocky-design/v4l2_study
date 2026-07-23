#!/bin/bash
set -e
sudo apt update
sudo apt install -y build-essential libncurses-dev bison flex libssl-dev libelf-dev dwarves git
sudo apt install -y qemu-system-x86 qemu-utils openssh-server gdb-multiarch
echo "基础依赖安装完成！"
