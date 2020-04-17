# Copyright (C) 2020 HandsomeMod Project
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gpio3
PKG_VERSION:=3.0.1
PKG_RELEASE:=1

PKG_SOURCE:=gpio3-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/source/g/gpio3
PKG_HASH:=f9e0447de0876f37fb3a2e8bf521192e

PKG_MAINTAINER:=HandsomeYingyan
PKG_LICENSE:=LGPLV3
PKG_LICENSE_FILES:=COPYING-LGPL

PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)-gpio3-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)
$(call include_mk, python3-package.mk)

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

define Package/python-gpio3/Default
  CATEGORY:=HandsomeMod Packages
  SECTION:=lang
  SUBMENU:=IoT
  TITLE:=python-gpio3
  DEPENDS:=
endef

define Package/python-gpio3
$(call Package/python-gpio3/Default)
  DEPENDS+=+PACKAGE_python-gpio3:python
  VARIANT:=python
endef

define Package/python-gpio3/description
gpio3 is a comfy yet reasonably efficient GPIO interface for python.
endef

define Package/python3-gpio3
$(call Package/python-gpio3/Default)
  DEPENDS+=+PACKAGE_python3-gpio3:python3
  VARIANT:=python3
endef

define Package/python3-gpio3/description
$(call Package/python-gpio3/description)
.
(Variant for Python3)
endef

PYTHON_PKG_SETUP_ARGS:=
PYTHON3_PKG_SETUP_ARGS:=



$(eval $(call PyPackage,python-gpio3))
$(eval $(call BuildPackage,python-gpio3))


$(eval $(call Py3Package,python3-gpio3))
$(eval $(call BuildPackage,python3-gpio3))
