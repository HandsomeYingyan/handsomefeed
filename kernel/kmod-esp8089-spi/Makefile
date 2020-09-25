#
# Copyright (C) 2020 HandsomeMod Project
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=esp8089-spi
PKG_RELEASE:=1.0
STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h

include $(INCLUDE_DIR)/package.mk

define KernelPackage/$(PKG_NAME)
  SUBMENU:=Wireless Drivers
  TITLE:=Esp8089 cfg80211 wifi driver though spi
  DEPENDS:=+kmod-spi-gpio +kmod-cfg80211 +kmod-mac80211
  MAINTAINER:=HandsomeYingyan <handsomeyingyan@gmail.com>
  KCONFIG:=
  FILES:=$(PKG_BUILD_DIR)/esp8089-spi.ko
#  AUTOLOAD:=$(call AutoProbe,esp8089-spi)
endef

include $(INCLUDE_DIR)/kernel-defaults.mk

NOSTDINC_FLAGS = \
	-I$(PKG_BUILD_DIR) \
	-I$(PKG_BUILD_DIR)/include \
	-I$(STAGING_DIR)/usr/include/mac80211-backport \
	-I$(STAGING_DIR)/usr/include/mac80211-backport/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211 \
	-I$(STAGING_DIR)/usr/include/mac80211/uapi \
	-include backport/backport.h

NOSTDINC_FLAGS+=-DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT -DBUILD_OPENWRT


define Build/Prepare
	$(call Build/Prepare/Default)
	#mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
cd $(PKG_BUILD_DIR)
	+$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
		$(KERNEL_MAKE_FLAGS) \
		M="$(PKG_BUILD_DIR)" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		modules
endef


$(eval $(call KernelPackage,$(PKG_NAME)))
