TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64e arm64
THEOS_DEVICE_IP = 192.168.50.254

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CustomCC
$(TWEAK_NAME)_EXTRA_FRAMEWORKS = Cephei
$(TWEAK_NAME)_FRAMEWORKS += UIKit AudioToolbox QuartzCore

CustomCC_FILES = Tweak.xm
CustomCC_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += pref
include $(THEOS_MAKE_PATH)/aggregate.mk
