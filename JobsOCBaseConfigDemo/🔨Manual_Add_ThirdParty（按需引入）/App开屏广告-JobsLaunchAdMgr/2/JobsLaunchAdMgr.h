//
//  SplashAdManager.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/6/24.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

typedef NS_ENUM(NSUInteger, SkipButtonMode) {
    SkipButtonModeNormal,
    SkipButtonModeCountdown
};

#import "JobsDefineProperty.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN


@interface JobsLaunchAdMgr : NSObject

Prop_copy()NSString *buttonTitle;
Prop_assign()CGRect buttonFrame;
Prop_assign()SkipButtonMode buttonModel;
Prop_assign()NSInteger countdownDuration;
Prop_copy()NSString *redirectURL;
Prop_copy()AdInteractionCallback onDoubleTap;
Prop_copy()AdInteractionCallback onSingleTap;
Prop_copy()AdInteractionCallback onLongPress;
Prop_copy()AdInteractionCallback onShake;
Prop_copy()AdCompletionCallback onAdDidFinish;

+ (instancetype)sharedManager;
- (void)showAdWithLocalResource:(NSString *)resourcePath isVideo:(BOOL)isVideo;
- (void)showAdWithURLResource:(NSString *)url isVideo:(BOOL)isVideo shouldPreload:(BOOL)shouldPreload;

@end

NS_ASSUME_NONNULL_END
