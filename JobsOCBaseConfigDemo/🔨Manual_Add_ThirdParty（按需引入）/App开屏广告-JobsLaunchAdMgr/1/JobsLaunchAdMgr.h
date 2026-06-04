#import <UIKit/UIKit.h>

typedef void(^JobsLaunchAdMgrCallback)(void);

typedef NS_ENUM(NSUInteger, JobsLaunchAdMode) {
    JobsLaunchAdModeNormal,
    JobsLaunchAdModeCountdown
};

#import "DefineProperty.h"

@interface JobsLaunchAdMgr : NSObject

Prop_strong()NSString *buttonTitle;
Prop_assign()CGRect buttonFrame;
Prop_assign()JobsLaunchAdMode adMode;
Prop_assign()NSTimeInterval imageDisplayDuration;
Prop_strong()NSURL *adURL;
Prop_assign()BOOL preloadResources;
Prop_assign()BOOL shouldPlayVideoSound;
Prop_copy()JobsLaunchAdMgrCallback doubleTapCallback;
Prop_copy()JobsLaunchAdMgrCallback singleTapCallback;
Prop_copy()JobsLaunchAdMgrCallback shakeCallback;

+ (instancetype)sharedInstance;
- (void)configureWithAdMode:(JobsLaunchAdMode)adMode;
- (void)showAd;

@end
