#
# Copyright (C) 2020 HandsomeMod Project
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=sunxi-cedar
PKG_RELEASE:=2.0

include $(INCLUDE_DIR)/package.mk

define KernelPackage/$(PKG_NAME)
  SUBMENU:=Display Support
  TITLE:=Allwinner VPU encoder/decoder module
  DEPENDS:=@TARGET_sunxi @LINUX_5_4
  MAINTAINER:=HandsomeYingyan <handsomeyingyan@gmail.com>
  KCONFIG:= CONFIG_GENERIC_ALLOCATOR=y \
         CONFIG_STAGING_MEDIA=y \
         CONFIG_CMA_DEBUG=n \
         CONFIG_CMA_DEBUGFS=n \
         CONFIG_VIDEO_SUNXI=y \
         CONFIG_DMA_SHARED_BUFFER=y \
         CONFIG_VIDEO_SUNXI_CEDAR_ION=y \
         CONFIG_CMA=y \
         CONFIG_DMA_CMA=y \
         CONFIG_CMA_SIZE_MBYTES=21 \
         CONFIG_CMA_SIZE_SEL_MBYTES=y \
         CONFIG_CMA_ALIGNMENT=8 \
         CONFIG_CMA_AREAS=7
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
		$(KERNEL_MAKE_FLAGS) \
		M="$(PKG_BUILD_DIR)" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		modules
endef


$(eval $(call KernelPackage,$(PKG_NAME)))
