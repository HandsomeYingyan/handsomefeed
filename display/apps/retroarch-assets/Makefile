#
# Copyright (C) 2020-2021 HandsomeMod Project
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=retroarch-assets
PKG_VERSION:=0ac74a9b2503f5a19e0a9ab1985e5fab8c64993d
PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/libretro/retroarch-assets/archive/
PKG_MD5SUM:=c9a0b241a1f4e49139de7735c9d4b2a6

include $(INCLUDE_DIR)/package.mk

define Package/retroarch-assets
  SECTION:=retroarch
  CATEGORY:=RetroArch
  TITLE:=Assets needed for RetroArch
  URL:=https://retroarch.com
endef

define Package/retroarch-assets/decription
  Assets needed for RetroArch
endef

define Build/Configure
endef

define Build/Compile
endef

define Build/InstallDev
endef

define Package/retroarch-assets/install
	$(INSTALL_DIR) $(1)/usr/share/libretro/assets/branding
	$(CP) $(PKG_BUILD_DIR)/branding/* $(1)/usr/share/libretro/assets/branding
	$(INSTALL_DIR) $(1)/usr/share/libretro/assets/glui
	$(CP) $(PKG_BUILD_DIR)/glui/* $(1)/usr/share/libretro/assets/glui
	$(INSTALL_DIR) $(1)/usr/share/libretro/assets/menu_widgets
	$(CP) $(PKG_BUILD_DIR)/menu_widgets/* $(1)/usr/share/libretro/assets/menu_widgets
	$(INSTALL_DIR) $(1)/usr/share/libretro/assets/nxrgui
	$(CP) $(PKG_BUILD_DIR)/nxrgui/* $(1)/usr/share/libretro/assets/nxrgui
	$(INSTALL_DIR) $(1)/usr/share/libretro/assets/ozone
	$(CP) $(PKG_BUILD_DIR)/ozone/* $(1)/usr/share/libretro/assets/ozone
	$(INSTALL_DIR) $(1)/usr/share/libretro/assets/pkg
	$(CP) $(PKG_BUILD_DIR)/pkg/* $(1)/usr/share/libretro/assets/pkg
	$(INSTALL_DIR) $(1)/usr/share/libretro/assets/rgui
	$(CP) $(PKG_BUILD_DIR)/rgui/* $(1)/usr/share/libretro/assets/rgui
	$(INSTALL_DIR) $(1)/usr/share/libretro/assets/sounds
	$(CP) $(PKG_BUILD_DIR)/sounds/* $(1)/usr/share/libretro/assets/sounds
	$(INSTALL_DIR) $(1)/usr/share/libretro/assets/switch
	$(CP) $(PKG_BUILD_DIR)/switch/* $(1)/usr/share/libretro/assets/switch
	$(INSTALL_DIR) $(1)/usr/share/libretro/assets/wallpapers
	$(CP) $(PKG_BUILD_DIR)/wallpapers/* $(1)/usr/share/libretro/assets/wallpapers
	$(INSTALL_DIR) $(1)/usr/share/libretro/assets/xmb
	$(CP) $(PKG_BUILD_DIR)/xmb/* $(1)/usr/share/libretro/assets/xmb
endef

$(eval $(call BuildPackage,retroarch-assets))
