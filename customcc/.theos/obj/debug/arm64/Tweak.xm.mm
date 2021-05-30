#line 1 "Tweak.xm"

#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>
#import <UIKit/UIView.h>

#import <UIKit/UIVisualEffect.h>
#import <UIKit/UIColor.h>

#import <UIKit/UIViewController.h>
#import <UIKit/UIBlurEffect.h>

@interface UIView ()
- (id)_viewControllerForAncestor;
@end


@interface MTMaterialView : UIView
@end

@interface CCUIContentModuleContentContainerView: UIView
- (void)setCompactContinuousCornerRadius: (double)arg1;
- (void)setExpandedContinuousCornerRadius: (double)arg1;
@end

@interface CCUIHeaderPocketView: UIView
@end

@interface CCUIModularControlCenterOverlayViewController: UIViewController
- (long long)overlayInterfaceOrientation;
- (UIView*)overlayContainerView;
- (UIScrollView*)overlayScrollView;
- (CCUIHeaderPocketView*)overlayHeaderView;
- (void)fixStatusBarOnDismiss;
- (void)moveToBottom;
@end

@interface CCUIBaseSliderView: UIView
@property(nonatomic, retain) UILabel *percentLabel;
- (float)value;
@end

@interface CCUILabeledRoundButton
@property(nonatomic, copy, readwrite) NSString *title;
@end

@interface SBWiFiManager
- (id)sharedInstance;
- (void)setWiFiEnabled: (BOOL)enabled;
- (bool)wiFiEnabled;
@end

@interface BluetoothManager
- (id)sharedInstance;
- (void)setEnabled: (BOOL)enabled;
- (bool)enabled;
- (void)setPowered: (BOOL)powered;
- (bool)powered;
@end


BOOL enable;




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

@class TVRMContentViewController; @class CCUIContentModuleContentContainerView; 
static void (*_logos_orig$_ungrouped$CCUIContentModuleContentContainerView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL CCUIContentModuleContentContainerView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$CCUIContentModuleContentContainerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL CCUIContentModuleContentContainerView* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$TVRMContentViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("TVRMContentViewController"); } return _klass; }
#line 65 "Tweak.xm"



	static void _logos_method$_ungrouped$CCUIContentModuleContentContainerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL CCUIContentModuleContentContainerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
		_logos_orig$_ungrouped$CCUIContentModuleContentContainerView$layoutSubviews(self, _cmd);
		
		if (enable){
			BOOL tvModule = NO;
			for(UIView *subview in [self subviews])
			{
				if([[subview _viewControllerForAncestor] isKindOfClass: _logos_static_class_lookup$TVRMContentViewController()])
				{
					tvModule = YES;
					break;
				}
			}

			BOOL expanded = MSHookIvar<BOOL>(self, "_expanded");
			int radius = expanded ? 65 : 34;
			
			
			if(!tvModule || !expanded)
			{
				[self setClipsToBounds: YES];
				[[self layer] setCornerRadius: radius];
				
			}

			




































		}
	}





static __attribute__((constructor)) void _logosLocalCtor_2cde6470(int __unused argc, char __unused **argv, char __unused **envp) {
  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.jordan.customcc"];
  [preferences registerBool:&enable default:NO forKey:@"Enable"];
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CCUIContentModuleContentContainerView = objc_getClass("CCUIContentModuleContentContainerView"); { MSHookMessageEx(_logos_class$_ungrouped$CCUIContentModuleContentContainerView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$CCUIContentModuleContentContainerView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$CCUIContentModuleContentContainerView$layoutSubviews);}} }
#line 141 "Tweak.xm"
