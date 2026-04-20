ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpaceXitV4
SpaceXitV4_FILES = Tweak.xm
SpaceXitV4_CFLAGS = -fobjc-arc
SpaceXitV4_FRAMEWORKS = UIKit Foundation CoreGraphics QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk
