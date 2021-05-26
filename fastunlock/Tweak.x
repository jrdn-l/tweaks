#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>
// Thanks to https://github.com/lgariv/Greet for showing me where to detect notifications

// Pref Variables
BOOL enable;
BOOL notifications = YES;
BOOL player = YES;

// Header which may get put into a header file
@interface SBLockScreenManager: NSObject
+(id)sharedInstance;
-(void)lockScreenViewControllerRequestsUnlock;
@end

@interface SBCoverSheetPresentationManager : NSObject
+(id)sharedInstance;
-(BOOL)hasBeenDismissedSinceKeybagLock;
@end

@interface NCNotificationStructuredListViewController : NSObject
@property (nonatomic,readonly) BOOL hasVisibleContent;
@end

@interface CSCombinedListViewController : NSObject {
    NCNotificationStructuredListViewController *_structuredListViewController;
}
@end

@interface CSMainPageContentViewController : NSObject
@property(readonly, nonatomic) CSCombinedListViewController *combinedListViewController;
@end

@interface CSCoverSheetViewController: NSObject
@property (retain, nonatomic) CSMainPageContentViewController *mainPageContentViewController;
-(BOOL)isShowingMediaControls;
@end

//Actual Tweak...
%hook CSCoverSheetViewController
-(BOOL)isAuthenticated{
	%log;
	if (enable && ![[NSClassFromString(@"SBCoverSheetPresentationManager") sharedInstance] hasBeenDismissedSinceKeybagLock]){
		NCNotificationStructuredListViewController *notf = [self.mainPageContentViewController.combinedListViewController valueForKey:@"_structuredListViewController"];
		if (notifications && [notf hasVisibleContent]){
			return %orig;
		}
		if (player && self.isShowingMediaControls){
			return %orig;
		}
		[[%c(SBLockScreenManager) sharedInstance] lockScreenViewControllerRequestsUnlock];
	}
	return %orig;
}
%end


// Hook in preferencess
%ctor {
  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.jordan.fastunlockprefs"];
  [preferences registerBool:&enable default:NO forKey:@"Enable"];
  [preferences registerBool:&notifications default:NO forKey:@"Notifications"];
  [preferences registerBool:&player default:NO forKey:@"MusicPlayer"];
}