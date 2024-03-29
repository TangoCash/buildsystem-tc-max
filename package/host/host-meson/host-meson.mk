################################################################################
#
# host-meson
#
################################################################################

MESON_VERSION = 0.58.1
MESON_DIR = meson-$(MESON_VERSION)
MESON_SOURCE = meson-$(MESON_VERSION).tar.gz
MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)

HOST_MESON_DEPENDS = host-ninja host-python3 host-python3-setuptools

HOST_MESON_BINARY = $(HOST_DIR)/bin/meson

$(D)/host-meson: | bootstrap
	$(call host-python3-package)
