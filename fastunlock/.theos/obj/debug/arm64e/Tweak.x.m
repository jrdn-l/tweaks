#line 1 "Tweak.x"
#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>
#import <AudioToolbox/AudioToolbox.h>



BOOL enable;
BOOL notifications = YES;
BOOL player = YES;


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



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class CSCoverSheetViewController; @class SBLockScreenManager; 
static BOOL (*_logos_orig$_ungrouped$CSCoverSheetViewController$isAuthenticated)(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$CSCoverSheetViewController$isAuthenticated(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBLockScreenManager(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBLockScreenManager"); } return _klass; }
#line 41 "Tweak.x"

static BOOL _logos_method$_ungrouped$CSCoverSheetViewController$isAuthenticated(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	NSLog(@"-[<CSCoverSheetViewController: %p> isAuthenticated]", self);
	if (enable && ![[NSClassFromString(@"SBCoverSheetPresentationManager") sharedInstance] hasBeenDismissedSinceKeybagLock]){
		NCNotificationStructuredListViewController *notf = [self.mainPageContentViewController.combinedListViewController valueForKey:@"_structuredListViewController"];
		if (notifications && [notf hasVisibleContent]){
			return _logos_orig$_ungrouped$CSCoverSheetViewController$isAuthenticated(self, _cmd);
		}
		if (player && self.isShowingMediaControls){
			return _logos_orig$_ungrouped$CSCoverSheetViewController$isAuthenticated(self, _cmd);
		}
		[[_logos_static_class_lookup$SBLockScreenManager() sharedInstance] lockScreenViewControllerRequestsUnlock];
	}
	return _logos_orig$_ungrouped$CSCoverSheetViewController$isAuthenticated(self, _cmd);
}




static __attribute__((constructor)) void _logosLocalCtor_3856978e(int __unused argc, char __unused **argv, char __unused **envp) {
  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.jordan.fastunlockprefs"];
  [preferences registerBool:&enable default:NO forKey:@"Enable"];
  [preferences registerBool:&notifications default:NO forKey:@"Notifications"];
  [preferences registerBool:&player default:NO forKey:@"MusicPlayer"];
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CSCoverSheetViewController = objc_getClass("CSCoverSheetViewController"); { MSHookMessageEx(_logos_class$_ungrouped$CSCoverSheetViewController, @selector(isAuthenticated), (IMP)&_logos_method$_ungrouped$CSCoverSheetViewController$isAuthenticated, (IMP*)&_logos_orig$_ungrouped$CSCoverSheetViewController$isAuthenticated);}} }
#line 66 "Tweak.x"
