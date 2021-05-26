TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64e arm64
DEBUG = 0
FINALPACKAGE=1


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FastUnlock
$(TWEAK_NAME)_EXTRA_FRAMEWORKS = Cephei
FastUnlock_FILES = Tweak.x
FastUnlock_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += pref
include $(THEOS_MAKE_PATH)/aggregate.mk
