#
# Copyright (C) 2020 HandsomeMod Project
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=sunxi-ion
PKG_RELEASE:=4.9
#PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/$(PKG_NAME)
  SUBMENU:=Display Support
  TITLE:=Allwinner ion module
  DEPENDS:=@TARGET_sunxi @LINUX_5_4
  MAINTAINER:=HandsomeYingyan <handsomeyingyan@gmail.com>
  KCONFIG:= CONFIG_GENERIC_ALLOCATOR=y \
         CONFIG_DMA_SHARED_BUFFER=y \
         CONFIG_CMA=y \
         CONFIG_DMA_CMA=y \
         CONFIG_CMA_SIZE_MBYTES=21 \
         CONFIG_CMA_ALIGNMENT=8
  FILES:= $(PKG_BUILD_DIR)/ion.ko
     
  AUTOLOAD:=$(call AutoProbe,ion)
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
