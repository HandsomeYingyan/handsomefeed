#
# Copyright (C) 2007-2015 OpenWrt.org
#
# It is licensed under the GPLv3 (see COPYING).
#

include $(TOPDIR)/rules.mk

PKG_NAME:=glmark2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/glmark2/glmark2.git
PKG_SOURCE_VERSION:=  88bbc8383fbf8c0ddf5cd133c086df5173975d82


PKG_LICENSE:=GPLv3+ SGIv1
PKG_LICENSE_FILES:=COPYING COPYING.SGI


include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)/config
  source "$(SOURCE)/Config.in"
endef

define Package/glmark2
  SECTION:=gui
  CATEGORY:=Wayland
  TITLE:=glmark2 is an OpenGL 2.0 and ES 2.0 benchmark
  URL:=https://launchpad.net/glmark2/
  MAINTAINER:=
  DEPENDS:= +libstdcpp +libpng +libjpeg  +GLMARK2_WAYLAND:wayland
endef

define Package/glmark2/description
  glmark2 is developed by Alexandros Frantzis and Jesse Barker based on the
original glmark benchmark by Ben Smith.
endef

GLMARK2_FLAVORS_FBDEV += 
GLMARK2_FLAVORS_WAYLAND += wayland-glesv2 drm-glesv2

ifeq ($(CONFIG_GLMARK2_FBDEV), y)
CONFIGURE_ARGS = \
	--with-flavors=$(subst $(space),$(comma),$(GLMARK2_FLAVORS_FBDEV)) \
	--prefix=$(CONFIGURE_PREFIX)
endif
ifeq ($(CONFIG_GLMARK2_WAYLAND), y)
CONFIGURE_ARGS = \
	--with-flavors=$(subst $(space),$(comma),$(GLMARK2_FLAVORS_WAYLAND)) \
	--prefix=$(CONFIGURE_PREFIX)
endif


define Build/Configure
	(cd $(PKG_BUILD_DIR); $(MAKE_FLAGS) ./waf configure $(CONFIGURE_ARGS) XXFLAGS=-std=c++11)
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR); ./waf)
endef

define Build/Install
	(cd $(PKG_BUILD_DIR); ./waf install --destdir=$(PKG_INSTALL_DIR))
endef

define Package/glmark2/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/glmark2
	$(CP) $(PKG_INSTALL_DIR)/usr/share/glmark2/* $(1)/usr/share/glmark2
endef

$(eval $(call BuildPackage,glmark2))
