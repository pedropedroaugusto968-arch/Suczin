ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpaceV4
SpaceV4_FILES = Tweak.xm
SpaceV4_CFLAGS = -fobjc-arc
SpaceV4_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
