#
# Copyright (C) 2020 HandsomeMod Project
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=sunxi-cedar
PKG_RELEASE:=4.9

include $(INCLUDE_DIR)/package.mk

define KernelPackage/$(PKG_NAME)
  SUBMENU:=Display Support
  TITLE:=Allwinner VPU decoder module
  DEPENDS:=@TARGET_sunxi +kmod-sunxi-ion @LINUX_5_4
  MAINTAINER:=HandsomeYingyan <handsomeyingyan@gmail.com>
  KCONFIG:= CONFIG_DMA_SHARED_BUFFER=y
  FILES:= $(PKG_BUILD_DIR)/cedar_ve.ko
  AUTOLOAD:=$(call AutoProbe,cedar_ve)
endef

include $(INCLUDE_DIR)/kernel-defaults.mk

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
        CROSS_COMPILE="$(TARGET_CROSS)" \
        ARCH="$(LINUX_KARCH)" \
        SUBDIRS="$(PKG_BUILD_DIR)" \
        EXTRA_CFLAGS="$(BUILDFLAGS)" \
        modules
endef


$(eval $(call KernelPackage,$(PKG_NAME)))
