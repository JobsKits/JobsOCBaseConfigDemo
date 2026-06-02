//
//  TFPopupLoading.h
//  TFPopup
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <TFPopup/TFPopupConst.h>
#import <TFPopup/UIView+TFPopup.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

@class TFPopupLoading;
typedef void(^TFPopupLoadingBlock)(TFPopupLoading *toast);

@interface TFPopupLoading : UIView

Prop_strong()UIActivityIndicatorView *indicatorView;
Prop_strong()UILabel  *msgLabel;

+(void)tf_show:(UIView *)inView animationType:(TFAnimationType)animationType;
+(void)tf_hide:(UIView *)inView;

@end

