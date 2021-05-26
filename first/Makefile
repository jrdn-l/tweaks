TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64e arm64
FINALPACKAGE=1


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = First

First_FILES = Tweak.x
First_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS = AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk


