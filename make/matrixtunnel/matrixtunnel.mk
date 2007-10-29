PACKAGE_LC:=matrixtunnel
PACKAGE_UC:=MATRIXTUNNEL
$(PACKAGE_UC)_VERSION:=0.2
$(PACKAGE_INIT_BIN)
$(PACKAGE_UC)_SOURCE:=matrixtunnel-$($(PACKAGE_UC)_VERSION).tar.gz
$(PACKAGE_UC)_SITE:=http://znerol.ch/files
$(PACKAGE_UC)_DIR:=$(SOURCE_DIR)/matrixtunnel
$(PACKAGE_UC)_BINARY:=$($(PACKAGE_UC)_DIR)/src/matrixtunnel
$(PACKAGE_UC)_TARGET_BINARY:=$($(PACKAGE_UC)_DEST_DIR)/usr/sbin/matrixtunnel

$(PACKAGE_UC)_CONFIGURE_OPTIONS += --without-libiconv-prefix
$(PACKAGE_UC)_CONFIGURE_OPTIONS += --without-libintl-prefix
$(PACKAGE_UC)_CONFIGURE_OPTIONS += --with-matrixssl-src="$(DSMOD_BASE_DIR)/$(MATRIXSSL_DIR)"
$(PACKAGE_UC)_CONFIGURE_OPTIONS += LDFLAGS="-lpthread"


$(PACKAGE_SOURCE_DOWNLOAD)
$(PACKAGE_UNPACKED)
$(PACKAGE_CONFIGURED_CONFIGURE)

$($(PACKAGE_UC)_BINARY): $($(PACKAGE_UC)_DIR)/.configured
	PATH="$(TARGET_PATH)" \
		$(MAKE) -C $(MATRIXTUNNEL_DIR)/src all
		
$($(PACKAGE_UC)_TARGET_BINARY): $($(PACKAGE_UC)_BINARY) 
	$(INSTALL_BINARY_STRIP)

matrixtunnel:

matrixtunnel-precompiled: uclibc matrixssl-precompiled matrixtunnel $($(PACKAGE_UC)_TARGET_BINARY) 

matrixtunnel-clean:
	-$(MAKE) -C $(MATRIXTUNNEL_DIR)/src clean
	rm -f $(PACKAGES_BUILD_DIR)/$(MATRIXTUNNEL_PKG_SOURCE)

matrixtunnel-uninstall: 
	rm -f $(MATRIXTUNNEL_TARGET_BINARY)
  
$(PACKAGE_FINI)
