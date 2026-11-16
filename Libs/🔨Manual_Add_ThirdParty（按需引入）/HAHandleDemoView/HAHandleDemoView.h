//
//  HAHandleDemoView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_HAHANDLEDEMOVIEW_B190D1474D
#define JOBS_HEADER_GUARD_HAHANDLEDEMOVIEW_B190D1474D

#import <UIKit/UIKit.h>

#import "JobsDefines.h"

@protocol HAHandleDemoViewDelegate <NSObject>
@optional
-(void)animationCompleted;
-(void)animationCancel;

@end

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface HAHandleDemoView : UIView

Prop_weak()id<HAHandleDemoViewDelegate> delegate;

-(void)handleBtnTouchDownAction;
-(void)handleBtnTouchUpOutsideAction;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HAHANDLEDEMOVIEW_B190D1474D */
