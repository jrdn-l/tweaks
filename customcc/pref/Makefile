TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CustomCC

CustomCC_FILES = prefRootListController.m
CustomCC_FRAMEWORKS = UIKit
CustomCC_PRIVATE_FRAMEWORKS = Preferences
CustomCC_INSTALL_PATH = /Library/PreferenceBundles
CustomCC_CFLAGS = -fobjc-arc
$(BUNDLE_NAME)_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk
