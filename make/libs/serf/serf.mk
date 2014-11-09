$(call PKG_INIT_LIB, 1.3.8)
$(PKG)_LIB_VERSION:=1.3.0
$(PKG)_SOURCE:=$(pkg)-$($(PKG)_VERSION).tar.bz2
$(PKG)_SOURCE_SHA1:=1d45425ca324336ce2f4ae7d7b4cfbc5567c5446
$(PKG)_SITE:=http://serf.googlecode.com/svn/src_releases

$(PKG)_BINARY:=$($(PKG)_DIR)/libserf-1.so.$($(PKG)_LIB_VERSION)
$(PKG)_STAGING_BINARY:=$(TARGET_TOOLCHAIN_STAGING_DIR)/lib/libserf-1.so.$($(PKG)_LIB_VERSION)
$(PKG)_TARGET_BINARY:=$($(PKG)_TARGET_DIR)/libserf-1.so.$($(PKG)_LIB_VERSION)

$(PKG)_DEPENDS_ON += apr apr-util openssl zlib

$(PKG)_REBUILD_SUBOPTS += FREETZ_PACKAGE_E2FSPROGS_STATIC
$(PKG)_REBUILD_SUBOPTS += FREETZ_OPENSSL_SHLIB_VERSION

$(PKG)_SCONS_OPTIONS += CC="$(FREETZ_LD_RUN_PATH) $(TARGET_CC)"
$(PKG)_SCONS_OPTIONS += CFLAGS="$(TARGET_CFLAGS)"
$(PKG)_SCONS_OPTIONS += AR="$(TARGET_AR)"
$(PKG)_SCONS_OPTIONS += RANLIB="$(TARGET_RANLIB)"
$(PKG)_SCONS_OPTIONS += PREFIX="/usr"
$(PKG)_SCONS_OPTIONS += APR="$(TARGET_TOOLCHAIN_STAGING_DIR)/usr"
$(PKG)_SCONS_OPTIONS += APU="$(TARGET_TOOLCHAIN_STAGING_DIR)/usr"
$(PKG)_SCONS_OPTIONS += OPENSSL="$(TARGET_TOOLCHAIN_STAGING_DIR)/usr"
$(PKG)_SCONS_OPTIONS += ZLIB="$(TARGET_TOOLCHAIN_STAGING_DIR)/usr"

$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_NOP)

$($(PKG)_BINARY): $($(PKG)_DIR)/.configured | scons-host
	$(SCONS_HOST) -C $(SERF_DIR) $(SERF_SCONS_OPTIONS)

$($(PKG)_STAGING_BINARY): $($(PKG)_BINARY)
	$(SUBMAKE) serf-clean-staging
	$(SCONS_HOST) -C $(SERF_DIR) \
		--install-sandbox="$(TARGET_TOOLCHAIN_STAGING_DIR)" \
		install
	$(call PKG_FIX_LIBTOOL_LA,prefix libdir) \
		$(TARGET_TOOLCHAIN_STAGING_DIR)/usr/lib/pkgconfig/serf-1.pc
	touch -c $@

$($(PKG)_TARGET_BINARY): $($(PKG)_STAGING_BINARY)
	$(INSTALL_LIBRARY_STRIP)

$(pkg): $($(PKG)_STAGING_BINARY)

$(pkg)-precompiled: $($(PKG)_TARGET_BINARY)

$(pkg)-clean: $(pkg)-clean-staging
	-$(SCONS_HOST) -C $(SERF_DIR) -c

$(pkg)-clean-staging:
	$(RM) -r \
		$(TARGET_TOOLCHAIN_STAGING_DIR)/usr/lib/libserf-1.* \
		$(TARGET_TOOLCHAIN_STAGING_DIR)/usr/lib/pkgconfig/serf-1.pc \
		$(TARGET_TOOLCHAIN_STAGING_DIR)/usr/include/{serf.h,serf_*.h}

$(pkg)-uninstall:
	$(RM) $(SERF_TARGET_DIR)/libserf-1.so*

$(PKG_FINISH)
