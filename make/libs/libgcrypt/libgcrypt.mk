$(call PKG_INIT_LIB, 1.5.0)
$(PKG)_LIB_VERSION:=11.7.0
$(PKG)_SOURCE:=$(pkg)-$($(PKG)_VERSION).tar.bz2
$(PKG)_SOURCE_MD5:=693f9c64d50c908bc4d6e01da3ff76d8
$(PKG)_SITE:=ftp://ftp.gnupg.org/gcrypt/libgcrypt

$(PKG)_BINARY:=$($(PKG)_DIR)/src/.libs/$(pkg).so.$($(PKG)_LIB_VERSION)
$(PKG)_STAGING_BINARY:=$(STAGING_DIR)/usr/lib/$(pkg).so.$($(PKG)_LIB_VERSION)
$(PKG)_TARGET_BINARY:=$($(PKG)_TARGET_DIR)/$(pkg).so.$($(PKG)_LIB_VERSION)

$(PKG)_DIGESTS            := crc md4 md5 rmd160 sha1 sha256 sha512 tiger whirlpool
$(PKG)_SYMMETRIC_CIPHERS  := aes arcfour blowfish camellia cast5 des rfc2268 seed serpent twofish
$(PKG)_ASYMMETRIC_CIPHERS := dsa ecc elgamal rsa
$(foreach i,DIGEST SYMMETRIC_CIPHER ASYMMETRIC_CIPHER, \
  $(eval $(PKG)_REBUILD_SUBOPTS += $(patsubst %,FREETZ_LIB_libgcrypt_WITH_$(i)_%,$($(PKG)_$(i)S))) \
)

$(PKG)_DEPENDS_ON := libgpg-error

$(PKG)_CONFIGURE_PRE_CMDS += $(call PKG_PREVENT_RPATH_HARDCODING,./configure)

$(PKG)_CONFIGURE_OPTIONS += --enable-shared
$(PKG)_CONFIGURE_OPTIONS += --enable-static
$(PKG)_CONFIGURE_OPTIONS += --disable-asm
$(PKG)_CONFIGURE_OPTIONS += --with-gpg-error-prefix="$(STAGING_DIR)/usr"
$(PKG)_CONFIGURE_OPTIONS += --enable-digests="$(call LIB_SELECTED_SUBOPTIONS,$($(PKG)_DIGESTS),WITH_DIGEST)"
$(PKG)_CONFIGURE_OPTIONS += --enable-ciphers="$(call LIB_SELECTED_SUBOPTIONS,$($(PKG)_SYMMETRIC_CIPHERS),WITH_SYMMETRIC_CIPHER)"
$(PKG)_CONFIGURE_OPTIONS += --enable-pubkey-ciphers="$(call LIB_SELECTED_SUBOPTIONS,$($(PKG)_ASYMMETRIC_CIPHERS),WITH_ASYMMETRIC_CIPHER)"

$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_CONFIGURE)

$($(PKG)_BINARY): $($(PKG)_DIR)/.configured
	$(SUBMAKE) -C $(LIBGCRYPT_DIR)

$($(PKG)_STAGING_BINARY): $($(PKG)_BINARY)
	$(SUBMAKE) -C $(LIBGCRYPT_DIR) \
		DESTDIR="$(STAGING_DIR)" \
		install
	$(PKG_FIX_LIBTOOL_LA) \
		$(STAGING_DIR)/usr/lib/libgcrypt.la \
		$(STAGING_DIR)/usr/bin/libgcrypt-config

$($(PKG)_TARGET_BINARY): $($(PKG)_STAGING_BINARY)
	$(INSTALL_LIBRARY_STRIP)

$(pkg): $($(PKG)_STAGING_BINARY)

$(pkg)-precompiled: $($(PKG)_TARGET_BINARY)

$(pkg)-clean:
	-$(SUBMAKE) -C $(LIBGCRYPT_DIR) clean
	$(RM) -r \
		$(STAGING_DIR)/usr/lib/libgcrypt* \
		$(STAGING_DIR)/usr/bin/{libgcrypt-config,dumpsexp,hmac256} \
		$(STAGING_DIR)/usr/include/gcrypt* \
		$(STAGING_DIR)/usr/share/aclocal/libgcrypt* \
		$(STAGING_DIR)/usr/share/info/gcrypt*

$(pkg)-uninstall:
	$(RM) $(LIBGCRYPT_TARGET_DIR)/libgcrypt*.so*

$(PKG_FINISH)
