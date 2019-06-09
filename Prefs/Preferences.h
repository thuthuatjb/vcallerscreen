#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <libvcspicker.h>
#import "NSTask.h"

#define BUNDLE_ID @"com.thuthuatjb.vcallers"

@interface VCSPrefsListController : HBRootListController
- (void)clearvcsVideo:(id)sender;
- (void)clearhsVideo:(id)sender;
- (void)clearlsVideo:(id)sender;
- (void)respring:(id)sender;
@end
