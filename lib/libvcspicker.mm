#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import "libvcspicker.h"

UIImage *LVCSParseImage(NSData *imageDataFromPrefs)
{
    return [UIImage imageWithData:imageDataFromPrefs];
}

// vim:ft=objc
