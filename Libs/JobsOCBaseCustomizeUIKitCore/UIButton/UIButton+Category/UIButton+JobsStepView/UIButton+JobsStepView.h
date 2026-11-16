//
//  UIButton+JobsStepView.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_JOBSSTEPVIEW_D1AD540CDC
#define JOBS_HEADER_GUARD_UIBUTTON_JOBSSTEPVIEW_D1AD540CDC

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (JobsStepView)

Prop_strong()__kindof UILabel *leftLab;
Prop_strong()__kindof UILabel *rightLab;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBUTTON_JOBSSTEPVIEW_D1AD540CDC */
