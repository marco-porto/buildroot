################################################################################
# rtaudio
################################################################################

RTAUDIO_VERSION = 6.0.1
RTAUDIO_SITE = https://github.com/thestk/rtaudio.git
RTAUDIO_SITE_METHOD = git
RTAUDIO_DEPENDENCIES = alsa-lib jack2

# Enable autotools
RTAUDIO_AUTORECONF = YES

define RTAUDIO_CONFIGURE_CMDS
	(cd $(@D) && ./autogen.sh && ./configure --prefix=$(STAGING_DIR)/usr --enable-static)
endef

define RTAUDIO_BUILD_CMDS
	$(MAKE) -C $(@D)
endef

define RTAUDIO_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/usr/include/rtaudio
	$(INSTALL) -m 0644 $(@D)/include/*.h $(TARGET_DIR)/usr/include/rtaudio/
	$(INSTALL) -m 0644 $(@D)/.libs/librtaudio.a $(TARGET_DIR)/usr/lib/
endef

define RTAUDIO_INSTALL_STAGING_CMDS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/rtaudio
	$(INSTALL) -m 0644 $(@D)/include/*.h $(STAGING_DIR)/usr/include/rtaudio/
	$(INSTALL) -m 0644 $(@D)/.libs/librtaudio.a $(STAGING_DIR)/usr/lib/
endef

$(eval $(generic-package))

