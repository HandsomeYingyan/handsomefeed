# Copyright (C) 2020 HandsomeMod Project
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=py-wiringpi
PKG_VERSION:=2.60.0
PKG_RELEASE:=1

PKG_SOURCE:=py-wiringpi-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/source/w/wiringpi
PKG_HASH:=ea3da098468018930761e165d2d6f157

PKG_MAINTAINER:=HandsomeYingyan
PKG_LICENSE:=LGPL
PKG_LICENSE_FILES:=COPYING-LGPL

PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)-wiringpi-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)
$(call include_mk, python3-package.mk)

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

define Package/python-wiringpi/Default
  CATEGORY:=HandsomeMod Packages
  SECTION:=lang
  SUBMENU:=IoT
  TITLE:=python-wringpi
  URL:=https://libraries.io/pypi/wiringpi
  DEPENDS:=+wiringPi +swig
endef

define Package/python-wiringpi
$(call Package/python-wiringpi/Default)
  DEPENDS+=+PACKAGE_python-wiringpi:python
  VARIANT:=python
endef

define Package/python-wiringpi/description
This package contains Python bindings for wiringpi2.
endef

define Package/python3-wiringpi
$(call Package/python-wiringpi/Default)
  DEPENDS+=+PACKAGE_python3-wiringpi:python3
  VARIANT:=python3
endef

define Package/python3-wiringpi/description
$(call Package/python-wiringpi/description)
.
(Variant for Python3)
endef



$(eval $(call PyPackage,python-wiringpi))
$(eval $(call BuildPackage,python-wiringpi))


$(eval $(call Py3Package,python3-wiringpi))
$(eval $(call BuildPackage,python3-wiringpi))
