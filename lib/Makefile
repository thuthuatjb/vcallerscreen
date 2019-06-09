ARCHS = armv7 arm64 arm64e

include /Users/dabeecao/theos/makefiles/common.mk

LIBRARY_NAME = libvcspicker
libvcspicker_FILES = libvcspicker.mm LVCSvcsChooseCell.m
libvcspicker_FRAMEWORKS = UIKit Preferences Photos MobileCoreServices
libvcspicker_LDFLAGS += -FFrameworks/
libvcspicker_CFLAGS = -fobjc-arc

after-install::
	install.exec "killall -9 Preferences"

include $(THEOS_MAKE_PATH)/library.mk
