//
//  UIImageView+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月10日，星期三。
//

#ifndef JOBS_HEADER_GUARD_UIIMAGEVIEW_DSL_7D8A6E1C2B
#define JOBS_HEADER_GUARD_UIIMAGEVIEW_DSL_7D8A6E1C2B

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (DSL)

-(JobsRetImageViewByImageBlock _Nonnull)byImage;
-(JobsRetImageViewByImageBlock _Nonnull)byHighlightedImage;
-(JobsRetImageViewByArrBlock _Nonnull)byAnimationImages;
-(JobsRetImageViewByNSTimeIntervalBlock _Nonnull)byAnimationDuration;
-(JobsRetImageViewByNSIntegerBlock _Nonnull)byAnimationRepeatCount;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIIMAGEVIEW_DSL_7D8A6E1C2B */
