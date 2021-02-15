#
# Copyright (C) 2020-2021 HandsomeMod Project
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=retroarch
PKG_VERSION:=1.9.0
PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/libretro/RetroArch/archive/v1.9.0.tar.gz
PKG_MD5SUM:=3f57a0b5e752921b6e1e5587bf546eb9
PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/retroarch
  SECTION:=retroarch
  CATEGORY:=RetroArch
  TITLE:=Reference frontend for the libretro API
  DEPENDS:=+retroarch-assets +zlib +RETROARCH_FFMPEG:ffmpeg \
  	+RETROARCH_QT5:qt5-core +RETROARCH_DRM:libdrm \
  	+RETROARCH_ALSA:alsa-lib  +RETROARCH_V4L2:libv4l \
   	+RETROARCH_EUDEV:eudev +RETROARCH_SDL2:SDL2 \
   	+RETROARCH_MALI:mali400-um +RETROARCH_MESA:mesa \
   	+RETROARCH_OPENSSL:openssl +RETROARCH_PULSEAUDIO:pulseaudio \
   	+RETROARCH_WAYLAND:wayland
  URL:=https://retroarch.com
endef

define Package/retroarch/decription
  Reference frontend for the libretro API
endef


define Package/retroarch/config
  source "$(SOURCE)/Config.in"
endef

CONFIGURE_ARGS += \
	--prefix=/usr \
	--enable-dynamic \
	--disable-gdi \
	--disable-d3dx \
	--disable-d3d8 \
	--disable-d3d9 \
	--disable-d3d10 \
	--disable-d3d11 \
	--disable-d3d12 \
	--disable-metal \
	--disable-opengl1 \
	--disable-builtinflac \
	--disable-builtinmbedtls \
	--disable-builtinminiupnpc \
	--disable-builtinzlib \ 
	--disable-systemd \
	--disable-xvideo \
	--disable-sdl \
	--enable-zlib \
	--disable-jack \
	--disable-tinyalsa \
	--disable-egl
		
ifeq ($(CONFIG_RETROARCH_ALSA),y)
CONFIGURE_ARGS += --enable-alsa
else
CONFIGURE_ARGS += --disable-alsa
endif

ifeq ($(CONFIG_RETROARCH_OPENSSL),y)
CONFIGURE_ARGS += --enable-ssl
else
CONFIGURE_ARGS += --disable-ssl
endif

ifeq ($(CONFIG_RETROARCH_PULSEAUDIO),y)
CONFIGURE_ARGS += --enable-pulse
else
CONFIGURE_ARGS += --disable-pulse
endif

ifeq ($(CONFIG_RETROARCH_EUDEV),y)
CONFIGURE_ARGS += --enable-udev
else
CONFIGURE_ARGS += --disable-udev
endif

ifeq ($(CONFIG_RETROARCH_MESA),y)
CONFIGURE_ARGS += --enable-opengl
else
CONFIGURE_ARGS += --disable-opengl
endif

ifeq ($(CONFIG_RETROARCH_MESA),y)
CONFIGURE_ARGS += --enable-opengles
else
CONFIGURE_ARGS += --disable-opengles
endif

ifeq ($(CONFIG_RETROARCH_MALI),y)
CONFIGURE_ARGS += --enable-opengl
else
CONFIGURE_ARGS += --disable-opengl
endif

ifeq ($(CONFIG_RETROARCH_MALI),y)
CONFIGURE_ARGS += --enable-opengles
else
CONFIGURE_ARGS += --disable-opengles
endif


ifeq ($(CONFIG_RETROARCH_FFMPEG),y)
CONFIGURE_ARGS += --enable-ffmpeg
else
CONFIGURE_ARGS += --disable-ffmpeg
endif

ifeq ($(CONFIG_RETROARCH_QT5),y)
CONFIGURE_ARGS += --enable-qt
else
CONFIGURE_ARGS += --disable-qt
endif

ifeq ($(CONFIG_RETROARCH_DRM),y)
CONFIGURE_ARGS += --enable-kms
else
CONFIGURE_ARGS += --disable-kms
endif

ifeq ($(CONFIG_RETROARCH_SDL2),y)
CONFIGURE_ARGS += --enable-sdl2
else
CONFIGURE_ARGS += --disable-sdl2
endif

ifeq ($(CONFIG_RETROARCH_WAYLAND),y)
CONFIGURE_ARGS += --enable-wayland
else
CONFIGURE_ARGS += --disable-wayland
endif

ifeq ($(CONFIG_RETROARCH_V4L2),y)
CONFIGURE_ARGS += --enable-v4l2
else
CONFIGURE_ARGS += --disable-v4l2
endif

ifeq ($(CONFIG_RETROARCH_MENU_OZONE),y)
CONFIGURE_ARGS += --enable-rgui
else
CONFIGURE_ARGS += --disable-rgui
endif

ifeq ($(CONFIG_RETROARCH_MENU_MATERIAUI),y)
CONFIGURE_ARGS += --enable-materialui
else
CONFIGURE_ARGS += --disable-materialui
endif

ifeq ($(CONFIG_RETROARCH_MENU_XMB),y)
CONFIGURE_ARGS += --enable-xmb
else
CONFIGURE_ARGS += --disable-xmb
endif

ifeq ($(CONFIG_RETROARCH_MENU_OZONE),y)
CONFIGURE_ARGS += --enable-ozone
else
CONFIGURE_ARGS += --disable-ozone
endif

define Build/InstallDev
	$(MAKE) install
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/share
	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share
endef

define Package/retroarch/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib
endef

$(eval $(call BuildPackage,retroarch))
