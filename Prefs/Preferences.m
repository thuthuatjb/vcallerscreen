#import "Preferences.h"
#import <AVFoundation/AVFoundation.h>
@implementation VCSPrefsListController
- (instancetype)init {
    self = [super init];

    if (self) {
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:1];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithWhite:0 alpha:0];
        self.hb_appearanceSettings = appearanceSettings;
    }

    return self;
}

- (id)specifiers {
    if(_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"Prefs" target:self] retain];
    }
    return _specifiers;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

    CGRect frame = self.table.bounds;
    frame.origin.y = -frame.size.height;
	
    [self.navigationController.navigationController.navigationBar setShadowImage: [UIImage new]];
    self.navigationController.navigationController.navigationBar.translucent = YES;
}
- (void)clearvcsVideo:(id)sender {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *videoPath = @"/var/mobile/Documents/vcs.mp4";
    NSError *error;
    if ([fileManager removeItemAtPath:videoPath error:&error]){
        NSLog(@"Remove Sucess");
    }
    else{
        NSLog(@"Remove error: %@", error);
    }
}
- (void)clearhsVideo:(id)sender {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *videoPath = @"/var/mobile/Documents/hsvcs.mp4";
    NSError *error;
    if ([fileManager removeItemAtPath:videoPath error:&error]){
        NSLog(@"Remove Sucess");
    }
    else{
        NSLog(@"Remove error: %@", error);
    }
}
- (void)clearlsVideo:(id)sender {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *videoPath = @"/var/mobile/Documents/lsvcs.mp4";
    NSError *error;
    if ([fileManager removeItemAtPath:videoPath error:&error]){
        NSLog(@"Remove Sucess");
    }
    else{
        NSLog(@"Remove error: %@", error);
    }
}
- (void)respring:(id)sender {
    NSTask *t = [[[NSTask alloc] init] autorelease];
    [t setLaunchPath:@"/usr/bin/killall"];
    [t setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
    [t launch];
}
@end
