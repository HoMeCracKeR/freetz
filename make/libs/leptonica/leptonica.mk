$(call PKG_INIT_LIB, 1.69)
$(PKG)_LIB_VERSION:=3.0.0
$(PKG)_SOURCE:=$(pkg)-$($(PKG)_VERSION).tar.bz2
$(PKG)_SOURCE_MD5:=3c442f4edaf0be25dc92dc0012f94a37
$(PKG)_SITE:=http://leptonica.googlecode.com/files

$(PKG)_BINARY:=$($(PKG)_DIR)/src/.libs/liblept.so.$($(PKG)_LIB_VERSION)
$(PKG)_STAGING_BINARY:=$(STAGING_DIR)/usr/lib/liblept.so.$($(PKG)_LIB_VERSION)
$(PKG)_TARGET_BINARY:=$($(PKG)_TARGET_DIR)/liblept.so.$($(PKG)_LIB_VERSION)

$(PKG)_DEPENDS_ON := jpeg libpng tiff zlib

# touch some autotools' files to prevent configure from being regenerated
$(PKG)_CONFIGURE_PRE_CMDS += touch -t 200001010000.00 configure.ac aclocal.m4;

$(PKG)_CONFIGURE_PRE_CMDS += $(call PKG_PREVENT_RPATH_HARDCODING,./configure)

$(PKG)_CONFIGURE_OPTIONS += --enable-shared
$(PKG)_CONFIGURE_OPTIONS += --enable-static
$(PKG)_CONFIGURE_OPTIONS += --without-giflib
$(PKG)_CONFIGURE_OPTIONS += --with-jpeg
$(PKG)_CONFIGURE_OPTIONS += --with-libpng
$(PKG)_CONFIGURE_OPTIONS += --with-libtiff
$(PKG)_CONFIGURE_OPTIONS += --with-zlib
$(PKG)_CONFIGURE_OPTIONS += --disable-programs

$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_CONFIGURE)

$($(PKG)_BINARY): $($(PKG)_DIR)/.configured
	$(SUBMAKE) -C $(LEPTONICA_DIR)

$($(PKG)_STAGING_BINARY): $($(PKG)_BINARY)
	$(SUBMAKE) -C $(LEPTONICA_DIR) \
		DESTDIR="$(STAGING_DIR)" \
		install
	$(PKG_FIX_LIBTOOL_LA) $(STAGING_DIR)/usr/lib/liblept.la

$($(PKG)_TARGET_BINARY): $($(PKG)_STAGING_BINARY)
	$(INSTALL_LIBRARY_STRIP)

$(pkg): $($(PKG)_STAGING_BINARY)

$(pkg)-precompiled: $($(PKG)_TARGET_BINARY)

$(pkg)-clean:
	-$(SUBMAKE) -C $(LEPTONICA_DIR) clean
	$(RM) -r \
		$(STAGING_DIR)/usr/lib/liblept* \
		$(STAGING_DIR)/usr/include/leptonica

$(pkg)-uninstall:
	$(RM) $(LEPTONICA_TARGET_DIR)/liblept*.so*

$(PKG_FINISH)
