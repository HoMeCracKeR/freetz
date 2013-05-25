$(call PKG_INIT_LIB, 3.0.13)
$(PKG)_LIB_VERSION:=6.0.1
$(PKG)_SOURCE:=$(pkg)-$($(PKG)_VERSION).tar.gz
$(PKG)_SOURCE_MD5:=45f3b6dbc9ee7c7dfbbbc5feba571529
$(PKG)_SITE:=ftp://sourceware.org/pub/libffi

$(PKG)_BINARY:=$($(PKG)_DIR)/$(TARGET_ARCH)-unknown-linux-gnu/.libs/libffi.so.$($(PKG)_LIB_VERSION)
$(PKG)_STAGING_BINARY:=$(STAGING_DIR)/usr/lib/libffi.so.$($(PKG)_LIB_VERSION)
$(PKG)_TARGET_BINARY:=$($(PKG)_TARGET_DIR)/libffi.so.$($(PKG)_LIB_VERSION)

$(PKG)_CONFIGURE_OPTIONS += --enable-shared
$(PKG)_CONFIGURE_OPTIONS += --enable-static
$(PKG)_CONFIGURE_OPTIONS += --disable-debug

$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_CONFIGURE)

$($(PKG)_BINARY): $($(PKG)_DIR)/.configured
	$(SUBMAKE) -C $(LIBFFI_DIR)

$($(PKG)_STAGING_BINARY): $($(PKG)_BINARY)
	$(SUBMAKE) -C $(LIBFFI_DIR) \
		DESTDIR="$(STAGING_DIR)" \
		install
	$(PKG_FIX_LIBTOOL_LA) \
		$(STAGING_DIR)/usr/lib/libffi.la \
		$(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc

$($(PKG)_TARGET_BINARY): $($(PKG)_STAGING_BINARY)
	$(INSTALL_LIBRARY_STRIP)

$(pkg): $($(PKG)_STAGING_BINARY)

$(pkg)-precompiled: $($(PKG)_TARGET_BINARY)

$(pkg)-clean:
	-$(SUBMAKE) -C $(LIBFFI_DIR) clean
	$(RM) \
		$(STAGING_DIR)/usr/lib/libffi* \
		$(STAGING_DIR)/usr/include/{ffi.h,ffitarget.h} \
		$(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc

$(pkg)-uninstall:
	$(RM) $(LIBFFI_TARGET_DIR)/libffi*.so*

$(PKG_FINISH)
