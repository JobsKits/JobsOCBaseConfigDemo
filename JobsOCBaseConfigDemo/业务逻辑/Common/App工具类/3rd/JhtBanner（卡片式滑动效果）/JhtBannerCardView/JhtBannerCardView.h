//
//  JhtBannerCardView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

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
/// banner cardView（单张卡片）
@interface JhtBannerCardView : UIView
/// 图片
Prop_strong(nullable)UIImageView *cardImageView;
Prop_strong(nullable)UILabel *cardLab;
/// 蒙板 View（覆盖在cardImageView上）
Prop_strong(nullable)UIView *coverView;

+(JobsReturnJhtBannerCardViewByFrameBlock _Nonnull)initByFrame;

@end
