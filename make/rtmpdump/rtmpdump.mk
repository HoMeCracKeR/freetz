$(call PKG_INIT_BIN, 3a1e20c08c)
$(PKG)_SOURCE:=$(pkg)-$($(PKG)_VERSION).tar.bz2
$(PKG)_SITE:=git://git.ffmpeg.org/rtmpdump.git

$(PKG)_BUILD_PREREQ += git
$(PKG)_BUILD_PREREQ_HINT := Hint: on Debian-like systems this binary is provided by the git package (sudo apt-get install git)

$(PKG)_BINARIES_ALL := rtmpdump rtmpgw
$(PKG)_BINARIES := $(call PKG_SELECTED_SUBOPTIONS,$($(PKG)_BINARIES_ALL))
$(PKG)_BINARIES_BUILD_DIR := $($(PKG)_BINARIES:%=$($(PKG)_DIR)/%)
$(PKG)_BINARIES_TARGET_DIR := $($(PKG)_BINARIES:%=$($(PKG)_DEST_DIR)/usr/bin/%)
$(PKG)_NOT_INCLUDED := $(patsubst %,$($(PKG)_DEST_DIR)/usr/bin/%,$(filter-out $($(PKG)_BINARIES),$($(PKG)_BINARIES_ALL)))

$(PKG)_DEPENDS_ON += $(if $(FREETZ_PACKAGE_RTMPDUMP_WITH_SSL),polarssl zlib)

$(PKG)_REBUILD_SUBOPTS += FREETZ_PACKAGE_RTMPDUMP_WITH_SSL

$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_NOP)

$($(PKG)_BINARIES_BUILD_DIR): $($(PKG)_DIR)/.configured
	$(PKG_MAKE) -C $(RTMPDUMP_DIR) \
		CC="$(TARGET_CC)" \
		LD="$(TARGET_CC)" \
		AR="$(TARGET_AR)" \
		OPT="$(TARGET_CFLAGS) -pthread" \
		SYS=posix \
		CRYPTO=$(if $(FREETZ_PACKAGE_RTMPDUMP_WITH_SSL),POLARSSL) \
		SHARED= \
		all

$($(PKG)_BINARIES_TARGET_DIR): $($(PKG)_DEST_DIR)/usr/bin/%: $($(PKG)_DIR)/%
	$(INSTALL_BINARY_STRIP)

$(pkg):

$(pkg)-precompiled: $($(PKG)_BINARIES_TARGET_DIR)

$(pkg)-clean:
	-$(PKG_MAKE) -C $(RTMPDUMP_DIR) clean

$(pkg)-uninstall:
	$(RM) $(RTMPDUMP_BINARIES_ALL:%=$(RTMPDUMP_DEST_DIR)/usr/bin/%)

$(PKG_FINISH)
