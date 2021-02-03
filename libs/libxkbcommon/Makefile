#
# Copyright (C) 2006-2015 OpenWrt.org
# Copyroght (C) 2020 HandsomeMod Project
#
# This is free and open source software.
# It is available to be redistributed and/or modified under the terms of the MIT license.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libxkbcommon
PKG_VERSION:=0.10.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://xkbcommon.org/download/
PKG_MD5SUM:=2d9ad3a46b317138b5e72a91cf105451
PKG_MAINTAINER:=Ran Benita<ran234@gmail.com>
PKG_BUILD_DEPENDS:=meson/host 

PKG_LICENSE:=MIT/X11
PKC_LICENSE_FILES:=LICENSE

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=0

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/devel/meson/meson.mk

define Package/libxkbcommon
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+xkeyboard-config 
  TITLE:=xkbcommon is a library to handle keyboard descriptions
  URL:=https://xkbcommon.org/
endef

define Package/libxkbcommon/description
  xkbcommon is a library to handle keyboard descriptions, including loading them from disk,
parsing them and handling their state. It's mainly meant for client toolkits, window systems,
and other system applications; currently that includes Wayland, kmscon, GTK+, Qt, Clutter,
KWin and more. It is also used by some XCB applications for proper keyboard support.

endef

MESON_ARGS+=-Denable-x11=false -Denable-docs=false

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/xkbcommon
	$(CP) $(PKG_INSTALL_DIR)/usr/include/xkbcommon/xkbcommon*.h $(1)/usr/include/xkbcommon
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libxkbcommon.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/xkbcommon.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libxkbcommon/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libxkbcommon.so* $(1)/usr/lib/
endef


$(eval $(call BuildPackage,libxkbcommon))
