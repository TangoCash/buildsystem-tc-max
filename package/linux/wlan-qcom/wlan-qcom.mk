################################################################################
#
# wlan-qcom osmio4k | osmio4kplus
#
################################################################################

WLAN_QCOM_VERSION = 4.5.25.46
WLAN_QCOM_DIR     = qcacld-2.0-$(WLAN_QCOM_VERSION)
WLAN_QCOM_SOURCE  = qcacld-2.0-$(WLAN_QCOM_VERSION).tar.gz
WLAN_QCOM_SITE    = https://www.codeaurora.org/cgit/external/wlan/qcacld-2.0/snapshot
WLAN_QCOM_DEPENDS = bootstrap kernel wlan-qcom-firmware wireless-regdb

define WLAN_QCOM_INSTALL_BINARY
	$(INSTALL_DATA) wlan.ko $(TARGET_MODULES_DIR)/extra/wlan.ko
	mkdir -p ${TARGET_DIR}/etc/modules-load.d
	for i in wlan; do \
		echo $$i >> ${TARGET_DIR}/etc/modules-load.d/wlan.conf; \
	done
endef
WLAN_QCOM_PRE_INSTALL_TARGET_HOOKS += WLAN_QCOM_INSTALL_BINARY

define WLAN_QCOM_RUN_DEPMOD
	$(LINUX_RUN_DEPMOD)
endef
WLAN_QCOM_POST_INSTALL_TARGET_HOOKS += WLAN_QCOM_RUN_DEPMOD

$(D)/wlan-qcom:
	$(call PREPARE)
	$(CHDIR)/$($(PKG)_DIR); \
		$(MAKE) $(KERNEL_MAKE_VARS)
	$(call TARGET_FOLLOWUP)
