TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64e arm64
FINALPACKAGE=1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FiveIconDock

FiveIconDock_FILES = Tweak.xm
FiveIconDock_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
