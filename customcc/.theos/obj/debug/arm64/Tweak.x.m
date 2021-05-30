#line 1 "Tweak.x"
#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>

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

@class MTMaterialView; @class TVRMContentViewController; @class CCUIContentModuleContentContainerView; @class MediaControlsVolumeSliderView; @class CCUIContinuousSliderView; 
static void (*_logos_orig$_ungrouped$CCUIContentModuleContentContainerView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL CCUIContentModuleContentContainerView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$CCUIContentModuleContentContainerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL CCUIContentModuleContentContainerView* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MediaControlsVolumeSliderView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MediaControlsVolumeSliderView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CCUIContinuousSliderView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CCUIContinuousSliderView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MTMaterialView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MTMaterialView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$TVRMContentViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("TVRMContentViewController"); } return _klass; }
#line 53 "Tweak.x"



	static void _logos_method$_ungrouped$CCUIContentModuleContentContainerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL CCUIContentModuleContentContainerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
		_logos_orig$_ungrouped$CCUIContentModuleContentContainerView$layoutSubviews(self, _cmd);

		BOOL tvModule = NO;
		for(UIView *subview in [self subviews])
		{
			if([[subview _viewControllerForAncestor] isKindOfClass: _logos_static_class_lookup$TVRMContentViewController()])
			{
				tvModule = YES;
				break;
			}
		}

		BOOL expanded = self._expanded;
		int radius = expanded ? 65 : 34;
		int numberOfSelfSubviews = [[self subviews] count];
		
		if(!tvModule || !expanded)
		{
			[self setClipsToBounds: YES];
			[[self layer] setCornerRadius: radius];
		}

		if(numberOfSelfSubviews == 1)
		{
			UIView *subview1 = [self subviews][0];
			if([[subview1 subviews] count] >= 1)
			{
				UIView *subview2 = [subview1 subviews][0];
				if([subview2 isKindOfClass: _logos_static_class_lookup$MediaControlsVolumeSliderView()])
				{
					[subview2 setClipsToBounds: YES];
					[[subview2 layer] setCornerRadius: radius];
				}
				else
				{
					if([[subview2 subviews] count] > 0)
					{
						UIView *subview3 = [subview2 subviews][0];
						if([[subview3 subviews] count] > 0)
						{
							UIView *subview4 = [subview3 subviews][0];
							if([[subview4 subviews] count] > 0)
							{
								UIView *subview5 = [subview4 subviews][0];
								if([subview5 isKindOfClass: _logos_static_class_lookup$MTMaterialView()])
									[[subview5 layer] setCornerRadius: radius];
							}
						}
					}
				}
			}
		}
		else if(numberOfSelfSubviews > 1)
		{
			UIView *subview = [self subviews][1];
			if([subview isKindOfClass: _logos_static_class_lookup$CCUIContinuousSliderView()])
				[[subview layer] setCornerRadius: radius];
		}
	}

	
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CCUIContentModuleContentContainerView = objc_getClass("CCUIContentModuleContentContainerView"); { MSHookMessageEx(_logos_class$_ungrouped$CCUIContentModuleContentContainerView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$CCUIContentModuleContentContainerView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$CCUIContentModuleContentContainerView$layoutSubviews);}} }
#line 118 "Tweak.x"
