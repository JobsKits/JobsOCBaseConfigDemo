//
//  WMZBannerControl.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "WMZBannerParam.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface WMZBannerControl : UIControl

Prop_strong()UIImage *currentImage;
Prop_strong()UIImage *inactiveImage;
Prop_assign()CGSize currentImageSize;
Prop_assign()CGSize inactiveImageSize;
Prop_assign()NSInteger numberOfPages;
Prop_assign()NSInteger currentPage;
Prop_strong()UIColor *currentPageIndicatorTintColor;
Prop_strong()UIColor *pageIndicatorTintColor;
Prop_strong()WMZBannerParam *param;

- (instancetype)initWithFrame:(CGRect)frame WithModel:(WMZBannerParam *)param;

@end

NS_ASSUME_NONNULL_END
