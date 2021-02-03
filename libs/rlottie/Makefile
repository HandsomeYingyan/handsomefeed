#
# Copyright (C) 2020 - 2021 HandsomeMod Project
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rlottie
PKG_VERSION:=2021-2-3
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Samsung/rlottie.git
PKG_SOURCE_VERSION:= bd4c4e1f844c3c54378eada915f1d6e851ed39d2
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=HandsomeYingyan <handsomeyingyan@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk


define Package/rlottie
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=rlottie library
  URL:=https://github.com/Samsung/rlottie
endef

define Package/rlottie/description
  rlottie is a platform independent standalone c++ library for rendering vector based animations and art in realtime.
endef

define Package/rlottie/install
	#$(INSTALL_DIR) $(1)/usr/lib
	#$(CP) $(PKG_INSTALL_DIR)/usr/lib/libwebp.s* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,rlottie))
