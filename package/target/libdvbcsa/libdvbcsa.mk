################################################################################
#
# libdvbcsa
#
################################################################################

LIBDVBCSA_VERSION = git
LIBDVBCSA_DIR = libdvbcsa.git
LIBDVBCSA_SOURCE = libdvbcsa.git
LIBDVBCSA_SITE = https://code.videolan.org/videolan

LIBDVBCSA_AUTORECONF = YES

$(D)/libdvbcsa: | bootstrap
	$(call autotools-package)
