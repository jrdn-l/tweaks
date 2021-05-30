// Header stuff
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

// Preference Variables
BOOL enable;

// Round CC Modules... NOT MY TWEAK, TAKEN FROM JOHNZARO'S PERFECSTCONTROLCENTER FOUND HERE:
// https://github.com/johnzaro/iOS-13-Perfect-Series-of-Tweaks/blob/main/PerfectControlCenter/PerfectControlCenter.xm
%hook CCUIContentModuleContentContainerView

	- (void)layoutSubviews
	{
		%orig;
		
		if (enable){
			BOOL tvModule = NO;
			for(UIView *subview in [self subviews])
			{
				if([[subview _viewControllerForAncestor] isKindOfClass: %c(TVRMContentViewController)])
				{
					tvModule = YES;
					break;
				}
			}

			BOOL expanded = MSHookIvar<BOOL>(self, "_expanded");
			int radius = expanded ? 65 : 34;
			//int numberOfSelfSubviews = [[self subviews] count];
			
			if(!tvModule || !expanded)
			{
				[self setClipsToBounds: YES];
				[[self layer] setCornerRadius: radius];
				//[self setBackgroundColor:[UIColor blueColor]];
			}

			/*
			if(numberOfSelfSubviews == 1)
			{
				UIView *subview1 = [self subviews][0];
				if([[subview1 subviews] count] >= 1)
				{
					UIView *subview2 = [subview1 subviews][0];
					if([subview2 isKindOfClass: %c(MediaControlsVolumeSliderView)])
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
									if([subview5 isKindOfClass: %c(MTMaterialView)])
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
				if([subview isKindOfClass: %c(CCUIContinuousSliderView)])
					[[subview layer] setCornerRadius: radius];
			}*/
		}
	}

%end



%ctor {
  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.jordan.customcc"];
  [preferences registerBool:&enable default:NO forKey:@"Enable"];
}