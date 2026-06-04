//
//  WMZBannerFadeLayout.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "WMZBannerParam.h"

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface WMZBannerFadeLayout : UICollectionViewFlowLayout

Prop_strong()WMZBannerParam *param;
Prop_assign()BOOL right;

- (instancetype)initConfigureWithModel:(WMZBannerParam *)param;

@end

NS_ASSUME_NONNULL_END
