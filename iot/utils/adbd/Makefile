include $(TOPDIR)/rules.mk


PKG_NAME:=adbd
PKG_VERSION:=4.2
PKG_RELEASE:=1


PKG_BUILD_DIR := $(PKG_NAME)


include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:= +kmod-usb-gadget-functionfs
  TITLE:=Android Debug Briage D
endef


define Package/$(PKG_NAME)/description
	it comes form Android 4.2!!
endef


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -r ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
endef

define Build/Compile/$(PKG_NAME)
	#compile libmincrypt.a (Android)
	$(MAKE) -C $(PKG_BUILD_DIR)/libs/libmincrypt \
		ARCH="$(TARGET_ARCH)" \
		AR="$(TARGET_AR)" \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)"\
		LDFLAGS="$(TARGET_LDFLAGS)"

	#complie libcutils.a (Android)
	$(MAKE) -C $(PKG_BUILD_DIR)/libs/libcutils \
		ARCH="$(TARGET_ARCH)" \
		AR="$(TARGET_AR)" \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"

	#copy static lib
	$(CP) -r $(PKG_BUILD_DIR)/*/*/*.a $(PKG_BUILD_DIR)/

	#complie adbd (Android)
	$(MAKE) -C $(PKG_BUILD_DIR)/ \
		ARCH="$(TARGET_ARCH)" \
		AR="$(TARGET_AR)" \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"

endef

define Build/Compile
	$(call Build/Compile/$(PKG_NAME))
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) ./adb_shell $(1)/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./adbd.init $(1)/etc/init.d/adbd; \
	$(INSTALL_DATA) ./adb_profile $(1)/etc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/adbd $(1)/bin/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
