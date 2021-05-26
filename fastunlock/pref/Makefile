TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FastUnlock

FastUnlock_FILES = prefRootListController.m
FastUnlock_FRAMEWORKS = UIKit
FastUnlock_PRIVATE_FRAMEWORKS = Preferences
FastUnlock_INSTALL_PATH = /Library/PreferenceBundles
FastUnlock_CFLAGS = -fobjc-arc
$(BUNDLE_NAME)_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk
