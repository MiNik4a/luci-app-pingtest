#!/bin/bash

# 定义应用的根目录
APP_DIR="pingtest"

# 创建LuCI应用目录结构
mkdir -p $APP_DIR/luasrc/controller
mkdir -p $APP_DIR/luasrc/model/cbi/pingtest
mkdir -p $APP_DIR/luasrc/view/pingtest
mkdir -p $APP_DIR/root/usr/share/rpcd/acl.d

# 创建启动脚本和配置文件目录
mkdir -p $APP_DIR/root/etc/init.d
mkdir -p $APP_DIR/root/etc/config

# 创建基础文件
touch $APP_DIR/Makefile
touch $APP_DIR/luasrc/controller/pingtest.lua
touch $APP_DIR/luasrc/model/cbi/pingtest/settings.lua
touch $APP_DIR/luasrc/view/pingtest/settings.htm
touch $APP_DIR/root/usr/share/rpcd/acl.d/pingtest.json

# 创建启动脚本和配置文件
touch $APP_DIR/root/etc/init.d/pingtest
touch $APP_DIR/root/etc/config/pingtest

echo "OpenWrt LuCI应用'pingtest'的目录结构及必要文件已初始化完成。"