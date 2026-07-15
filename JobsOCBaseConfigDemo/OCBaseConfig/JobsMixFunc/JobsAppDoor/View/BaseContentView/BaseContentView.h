//
//  BaseContentView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASECONTENTVIEW_CA7C7BDB1E
#define JOBS_HEADER_GUARD_BASECONTENTVIEW_CA7C7BDB1E

#import <UIKit/UIKit.h>
#import "JobsBaseUI.h"
#import "JobsByOCPods.h"
#import "JobsDefines.h"

static const CGFloat btnWidth = 64;

NS_ASSUME_NONNULL_BEGIN

@interface BaseContentView : BaseView

-(void)showContentViewWithOffsetY:(CGFloat)offsetY;
-(void)removeContentViewWithOffsetY:(CGFloat)offsetY;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASECONTENTVIEW_CA7C7BDB1E */
