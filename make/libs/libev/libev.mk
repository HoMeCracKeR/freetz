$(call PKG_INIT_LIB, 4.15)
$(PKG)_SHLIB_VERSION:=4.0.0
$(PKG)_SOURCE:=$(pkg)-$($(PKG)_VERSION).tar.gz
$(PKG)_SOURCE_MD5:=3a73f247e790e2590c01f3492136ed31
$(PKG)_SITE:=http://dist.schmorp.de/libev

$(PKG)_LIBNAME=$(pkg).so.$($(PKG)_SHLIB_VERSION)
$(PKG)_BINARY:=$($(PKG)_DIR)/.libs/$($(PKG)_LIBNAME)
$(PKG)_STAGING_BINARY:=$(STAGING_DIR)/usr/lib/$($(PKG)_LIBNAME)
$(PKG)_TARGET_BINARY:=$($(PKG)_TARGET_DIR)/$($(PKG)_LIBNAME)

$(PKG)_CONFIGURE_OPTIONS += --enable-shared
$(PKG)_CONFIGURE_OPTIONS += --enable-static

$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_CONFIGURE)

$($(PKG)_BINARY): $($(PKG)_DIR)/.configured
	$(PKG_MAKE) -C $(LIBEV_DIR)

$($(PKG)_STAGING_BINARY): $($(PKG)_BINARY)
	$(PKG_MAKE) -C $(LIBEV_DIR) \
		DESTDIR="$(STAGING_DIR)" \
		install
	$(PKG_FIX_LIBTOOL_LA) \
		$(STAGING_DIR)/usr/lib/libev.la

$($(PKG)_TARGET_BINARY): $($(PKG)_STAGING_BINARY)
	$(INSTALL_LIBRARY_STRIP)

$(pkg): $($(PKG)_STAGING_BINARY)

$(pkg)-precompiled: $($(PKG)_TARGET_BINARY)

$(pkg)-clean:
	-$(PKG_MAKE) -C $(LIBEV_DIR) clean
	$(RM) -r \
		$(STAGING_DIR)/usr/lib/libev.* \
		$(STAGING_DIR)/usr/include/ev.h \
		$(STAGING_DIR)/usr/include/ev++.h

$(pkg)-uninstall:
	$(RM) $(LIBEV_TARGET_DIR)/libev.*.so*

$(PKG_FINISH)
