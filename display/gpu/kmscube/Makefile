#
# Copyright (C) 2020 HandsomeMod Project
#


include $(TOPDIR)/rules.mk

PKG_NAME:=kmscube
PKG_SOURCE_DATE:=2020-8-17
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://gitlab.freedesktop.org/mesa/kmscube.git
PKG_SOURCE_VERSION:=4660a7dca6512b6e658759d00cff7d4ad2a2059d
PKG_BUILD_DEPENDS:=meson/host 

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=0
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/devel/meson/meson.mk


define Package/kmscube
  SECTION:=demo
  CATEGORY:=HandsomeMod Packages
  DEPENDS:=+libpng +libdrm +mali400-um +libump
  TITLE:=little demonstration program for opengl
endef

define Package/kmscube/description
  kmscube is a little demonstration program for how to drive bare metal graphics
without a compositor like X11, wayland or similar, using DRM/KMS (kernel mode
setting), GBM (graphics buffer manager) and EGL for rendering content using
OpenGL or OpenGL ES.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/kmscube/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/lib/libweston-8
	$(INSTALL_DIR) $(1)/usr/lib/weston
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share
	$(INSTALL_DIR) $(1)/etc/xdg
	$(INSTALL_DIR) $(1)/etc/init.d
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libweston-8/*.so* $(1)/usr/lib/libweston-8/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/weston/*.so* $(1)/usr/lib/weston/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libweston-* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/
	$(CP) ./weston.ini $(1)/etc/xdg
	$(CP) ./weston $(1)/etc/init.d
endef

$(eval $(call BuildPackage,kmscube))
