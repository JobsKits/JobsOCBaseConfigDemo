//
//  HAHandleDemoView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_HAHANDLEDEMOVIEW_B190D1474D
#define JOBS_HEADER_GUARD_HAHANDLEDEMOVIEW_B190D1474D

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@protocol HAHandleDemoViewDelegate <NSObject>
@optional
-(void)animationCompleted;
-(void)animationCancel;

@end

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface HAHandleDemoView : UIView

Prop_weak()id<HAHandleDemoViewDelegate> delegate;

-(void)handleBtnTouchDownAction;
-(void)handleBtnTouchUpOutsideAction;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HAHANDLEDEMOVIEW_B190D1474D */
