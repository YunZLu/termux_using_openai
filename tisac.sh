#!/bin/bash

echo "                                              
喵喵一键安卓脚本(one-api版)
作者: hoping喵，坏水秋，瑾年
来自: Claude2.1先行破限组
群号: 704819371 / 910524479 / 304690608
类脑Discord: https://discord.gg/HWNkueX34q
"

echo -e "\033[0;31m开魔法！开魔法！开魔法！\033[0m\n"

read -p "确保开了魔法后按回车继续"

current=/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu

yes | apt update
yes | apt upgrade

# 安装proot-distro
DEBIAN_FRONTEND=noninteractive pkg install proot-distro -y

# 创建并安装Ubuntu
DEBIAN_FRONTEND=noninteractive proot-distro install ubuntu

# Check Ubuntu installed successfully
 if [ ! -d "$current" ]; then
   echo "Ubuntu安装失败了，请更换魔法或者手动安装Ubuntu喵~"
    exit 1
 fi

    echo "Ubuntu成功安装到Termux"

echo "正在安装pkg软件喵~"
DEBIAN_FRONTEND=noninteractive pkg install git vim curl xz-utils -y

echo "正在安装apt软件喵~"
DEBIAN_FRONTEND=noninteractive apt-get install golang -y

# Check Ubuntu installed successfully
 if [ ! -d "$current" ]; then
   echo "Ubuntu安装失败了，请更换魔法或者手动安装Ubuntu喵~"
    exit 1
 fi
    echo "Ubuntu成功安装到Termux"

if [ -d "SillyTavern" ]; then
  cp -r SillyTavern $current/root/
fi

if [ -d "one-api" ]; then
  cp -r one-api $current/root/
fi

cd $current/root

echo "正在为Ubuntu安装node喵~"
if [ ! -d node-v20.10.0-linux-arm64.tar.xz ]; then
    curl -O https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-arm64.tar.xz

tar xf node-v20.10.0-linux-arm64.tar.xz

echo "export PATH=\$PATH:/root/node-v20.10.0-linux-arm64/bin" >>$current/etc/profile
fi

echo "正在为Ubuntu下载启动文件喵~"
curl -O https://raw.githubusercontent.com/YunZLu/termux_using_openai/main/sac.sh

if [ ! -f "$current/root/sac.sh" ]; then
   echo "启动文件下载失败了，换个魔法或者手动下载试试吧"
   exit
fi

echo "正在为你下载更新文件喵~"
curl -O https://raw.githubusercontent.com/YunZLu/termux_using_openai/main/update.sh

if [ ! -f "$current/root/update.sh" ]; then
   echo "更新文件下载失败了，换个魔法或者手动下载试试吧"
   exit
fi

ln -s /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root

echo "bash /root/sac.sh" >>$current/root/.bashrc

echo "proot-distro login ubuntu" >>/data/data/com.termux/files/home/.bashrc

source /data/data/com.termux/files/home/.bashrc

exit
