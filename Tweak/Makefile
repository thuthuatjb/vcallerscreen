include /Users/dabeecao/theos/makefiles/common.mk
CFLAGS = -fobjc-arc

TWEAK_NAME = VCallerScreen
$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_FRAMEWORKS = UIKit MessageUI Social QuartzCore CoreGraphics Foundation AVFoundation Accelerate GLKit AudioToolbox
$(TWEAK_NAME)_LDFLAGS += -Wl,-segalign,4000
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk