include $(TOPDIR)/rules.mk

# 定义包名
PKG_NAME:=pingtest
# 定义包版本
PKG_VERSION:=1.0.0
# 定义包发布版本
PKG_RELEASE:=1

# 定义包来源类型，这里是本地源码
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

# 定义包描述
define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=PingTest for OpenWrt
  MAINTAINER:=Your Name <your.email@example.com>
endef

# 定义包描述，显示在LuCI界面上
define Package/$(PKG_NAME)/description
 This package provides a simple ping test utility for OpenWrt.
endef

# 定义构建和安装规则
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	# 如果有编译步骤，在这里定义
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	# 安装可执行文件到目标系统的/usr/bin目录
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/root/bin/pingtest $(1)/usr/bin/
	# 安装LuCI应用文件
	$(CP) ./luasrc/* $(1)/usr/lib/lua/luci/
	$(CP) ./root/* $(1)/
endef

# 这里告诉OpenWrt构建系统包含这个包
$(eval $(call BuildPackage,$(PKG_NAME)))