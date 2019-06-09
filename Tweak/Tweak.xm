#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <Cephei/HBPreferences.h>


//SBHomeScreenViewController
//_SBRemoteAlertHostViewController
//_UIRemoteView
HBPreferences *preferences;
BOOL enabled = true;
BOOL hsEnabled = true;
BOOL lsEnabled = true;
BOOL dpkgInvalid = false;

%group VCS

@interface _SBRemoteAlertHostViewController : UIViewController
    - (void)playerItemDidReachEnd:(NSNotification *)notification;
@end

@interface SBHomeScreenViewController : UIViewController
    - (void)playerItemDidReachEnd:(NSNotification *)notification;
@end

@interface SBLockScreenViewControllerBase : UIViewController
    - (void)playerItemDidReachEnd:(NSNotification *)notification;
@end

@interface _UIRemoteView : UIView
    - (id)_viewControllerForAncestor;
@end


%hook _UIRemoteView

 - (void)didMoveToSuperview {
    UIViewController *ancestor = [self _viewControllerForAncestor];

    if (ancestor != NULL && [ancestor class] == [NSClassFromString(@"_SBRemoteAlertHostViewController") class]) {
        self.alpha = 1;
    }
 }

%end


%hook _SBRemoteAlertHostViewController

-(void)viewDidAppear:(bool)something {

    %orig;

	NSString* const videoPath = @"/var/mobile/Documents/vcs.mp4";

   if (enabled && [[NSFileManager defaultManager] fileExistsAtPath:videoPath])
{
        NSURL *url = [NSURL fileURLWithPath:videoPath];
        AVPlayer *player = [AVPlayer playerWithURL:url];
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
        
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        player.volume = 0;
        player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
        
        playerLayer.frame = self.view.layer.bounds;
        [self.view.layer insertSublayer:playerLayer atIndex:0];

        NSError *sessionError = nil;
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setCategory:AVAudioSessionCategoryAmbient error:&sessionError];
        [session setActive:true error:&sessionError];
        
        [player play];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:[player currentItem]];

        [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:true block:^(NSTimer * _Nonnull timer) {
            if (player.timeControlStatus != AVPlayerTimeControlStatusPlaying) {
                [player play];
            }
        }];
    }
}

%new
- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero completionHandler:NULL];
}

%end

%hook SBHomeScreenViewController

-(void)viewDidAppear:(bool)something {

    %orig;

	NSString* const videoPath = @"/var/mobile/Documents/hsvcs.mp4";

   if (hsEnabled && [[NSFileManager defaultManager] fileExistsAtPath:videoPath])
{
        NSURL *url = [NSURL fileURLWithPath:videoPath];
        AVPlayer *player = [AVPlayer playerWithURL:url];
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
        
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        player.volume = 0;
        player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
        
        playerLayer.frame = self.view.layer.bounds;
        [self.view.layer insertSublayer:playerLayer atIndex:0];

        NSError *sessionError = nil;
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setCategory:AVAudioSessionCategoryAmbient error:&sessionError];
        [session setActive:true error:&sessionError];
        
        [player play];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:[player currentItem]];

        [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:true block:^(NSTimer * _Nonnull timer) {
            if (player.timeControlStatus != AVPlayerTimeControlStatusPlaying) {
                [player play];
            }
        }];
    }
}

%new
- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero completionHandler:NULL];
}

%end

%hook SBLockScreenViewControllerBase

-(void)viewDidAppear:(bool)something {

    %orig;

	NSString* const videoPath = @"/var/mobile/Documents/lsvcs.mp4";

   if (lsEnabled && [[NSFileManager defaultManager] fileExistsAtPath:videoPath])
{
        NSURL *url = [NSURL fileURLWithPath:videoPath];
        AVPlayer *player = [AVPlayer playerWithURL:url];
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
        
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        player.volume = 0;
        player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
        
        playerLayer.frame = self.view.layer.bounds;
        [self.view.layer insertSublayer:playerLayer atIndex:0];

        NSError *sessionError = nil;
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setCategory:AVAudioSessionCategoryAmbient error:&sessionError];
        [session setActive:true error:&sessionError];
        
        [player play];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:[player currentItem]];

        [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:true block:^(NSTimer * _Nonnull timer) {
            if (player.timeControlStatus != AVPlayerTimeControlStatusPlaying) {
                [player play];
            }
        }];
    }
}

%new
- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero completionHandler:NULL];
}

%end

%end
%group VCSFail

%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)arg1 {
    %orig;
    if (!dpkgInvalid) return;
    UIAlertController *alertController = [UIAlertController
        alertControllerWithTitle:@"Thank for install"
        message:@"Có vẻ như bạn đã tải về VCaller Screen không phải từ TTJB Repo. Các tweak được cung cấp bởi chúng tôi đã được kiểm duyệt kĩ để đảm bảo tính tương thích và không chứa phần mềm độc hại. Hãy gỡ bỏ và tải về nó từ nguồn của TTJB\n It looks like you downloaded VCaller Screen not from TTJB Repo. The tweaks provided by us have been moderated to ensure compatibility and contain no malware. Please remove and download it from TTJB Source\nThank!\nhttps:https://repo.thuthuatjb.com)"
        preferredStyle:UIAlertControllerStyleAlert
    ];

    [alertController addAction:[UIAlertAction actionWithTitle:@"I Know!" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [((UIApplication*)self).keyWindow.rootViewController dismissViewControllerAnimated:YES completion:NULL];
    }]];

    [((UIApplication*)self).keyWindow.rootViewController presentViewController:alertController animated:YES completion:NULL];
}

%end

%end
%ctor{
    dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/com.thuthuatjb.vcallers.md5sums"];

    if (dpkgInvalid) {
        %init(VCSFail);
        return;
    }
        preferences = [[HBPreferences alloc] initWithIdentifier:@"com.thuthuatjb.vcallers"];

[preferences registerBool:&enabled default:YES forKey:@"Enabled"];
[preferences registerBool:&hsEnabled default:YES forKey:@"HSEnabled"];
[preferences registerBool:&lsEnabled default:YES forKey:@"LSEnabled"];

        %init(VCS);
}