//
//  UIImageView+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIIMAGEVIEW_EXTRA_BFFF61E28D
#define JOBS_HEADER_GUARD_UIIMAGEVIEW_EXTRA_BFFF61E28D

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Extra)

+(JobsRetImageViewByImageBlock _Nonnull)initBy;
-(JobsRetImageViewByImageBlock _Nonnull)byImage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIIMAGEVIEW_EXTRA_BFFF61E28D */
