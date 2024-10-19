# OpenAuto Buildroot Package Makefile

OPENAUTO_VERSION = develop
OPENAUTO_SITE = https://github.com/marco-porto/openauto.git
OPENAUTO_SITE_METHOD = git
OPENAUTO_DEPENDENCIES = boost libusb openssl protobuf qt5base qt5multimedia qt5connectivity pulseaudio aasdk



# Configuration options for CMake
OPENAUTO_CONF_OPTS = \
    -DCMAKE_BUILD_TYPE=Release \
    -DRPI3_BUILD=TRUE \
    -DAASDK_INCLUDE_DIRS="$(STAGING_DIR)/usr/include" \
    -DAASDK_LIBRARIES="$(STAGING_DIR)/usr/lib/libaasdk.so" \
    -DAASDK_PROTO_INCLUDE_DIRS="$(STAGING_DIR)/usr/include" \
    -DAASDK_PROTO_LIBRARIES="$(STAGING_DIR)/usr/lib/libaasdk_proto.so"

# Specify the build system type (CMake)
OPENAUTO_INSTALL_STAGING = YES
OPENAUTO_INSTALL_TARGET = YES

$(eval $(cmake-package))

