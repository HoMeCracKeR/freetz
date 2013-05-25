$(call PKG_INIT_LIB, 1.2.8)
$(PKG)_LIB_VERSION:=$($(PKG)_VERSION)
$(PKG)_SOURCE:=$(pkg)-$($(PKG)_VERSION).tar.xz
$(PKG)_SOURCE_MD5:=28f1205d8dd2001f26fec1e8c2cebe37
$(PKG)_SITE:=http://zlib.net

$(PKG)_BINARY:=$($(PKG)_DIR)/libz.so.$($(PKG)_LIB_VERSION)
$(PKG)_STAGING_BINARY:=$(STAGING_DIR)/usr/lib/libz.so.$($(PKG)_LIB_VERSION)
$(PKG)_TARGET_BINARY:=$($(PKG)_TARGET_DIR)/libz.so.$($(PKG)_LIB_VERSION)

$(PKG)_CONFIGURE_DEFOPTS := n
$(PKG)_CONFIGURE_ENV += CC="$(TARGET_CC)"
$(PKG)_CONFIGURE_ENV += CFLAGS="$(TARGET_CFLAGS)"
$(PKG)_CONFIGURE_ENV += AR="$(TARGET_AR)"
$(PKG)_CONFIGURE_ENV += RANLIB="$(TARGET_RANLIB)"
$(PKG)_CONFIGURE_ENV += NM="$(TARGET_NM)"
$(PKG)_CONFIGURE_ENV += CROSS_PREFIX="$(TARGET_CROSS)"
$(PKG)_CONFIGURE_ENV += prefix=/usr

# we could make a patch for it, but as all changes are absolutely identical it's simpler to do it per sed
$(PKG)_CONFIGURE_PRE_CMDS += $(SED) -i -r -e 's,test "`([(][^)]+[)] 2>)&1`" = "",\1>config.log,g' ./configure;

$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_CONFIGURE)

$($(PKG)_BINARY): $($(PKG)_DIR)/.configured
	$(SUBMAKE) -C $(ZLIB_DIR) \
		all

$($(PKG)_STAGING_BINARY): $($(PKG)_BINARY)
	$(SUBMAKE) -C $(ZLIB_DIR) \
		DESTDIR="$(STAGING_DIR)" \
		install
	$(call PKG_FIX_LIBTOOL_LA,prefix) \
		$(STAGING_DIR)/usr/lib/pkgconfig/zlib.pc

$($(PKG)_TARGET_BINARY): $($(PKG)_STAGING_BINARY)
	$(INSTALL_LIBRARY_STRIP)

$(pkg): $($(PKG)_STAGING_BINARY)

$(pkg)-precompiled: $($(PKG)_TARGET_BINARY)

$(pkg)-clean:
	-$(SUBMAKE) -C $(ZLIB_DIR) clean
	$(RM) \
		$(STAGING_DIR)/usr/lib/libz.* \
		$(STAGING_DIR)/usr/include/zlib.h \
		$(STAGING_DIR)/usr/include/zconf.h \
		$(STAGING_DIR)/usr/lib/pkgconfig/zlib.pc

$(pkg)-uninstall:
	$(RM) $(ZLIB_TARGET_DIR)/libz*.so*

$(PKG_FINISH)
