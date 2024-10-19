################################################################################
# AASDK Buildroot Package
################################################################################

AASDK_VERSION = develop
AASDK_SITE = https://github.com/marco-porto/aasdk.git
AASDK_SITE_METHOD = git
AASDK_LICENSE = MIT
AASDK_LICENSE_FILES = LICENSE
AASDK_DEPENDENCIES = host-pkgconf libusb openssl boost protobuf

# Enable CMake support in Buildroot
AASDK_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release \
                  -DBOOST_ROOT=$(STAGING_DIR)/usr \
                  -DBOOST_LIBRARYDIR=$(STAGING_DIR)/usr/lib \
                  -DBOOST_INCLUDEDIR=$(STAGING_DIR)/usr/include


# Build and install commands
define AASDK_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -j$(PARALLEL_JOBS)
endef

define AASDK_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
endef

# Hook the package into Buildroot’s build system
$(eval $(cmake-package))

