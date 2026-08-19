//
//  JobsOCKeyboardResult.h
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JobsOCKeyboardResult_h
#define JobsOCKeyboardResult_h

#import <UIKit/UIKit.h>

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

@interface JobsOCKeyboardResult : NSObject

Prop_assign() BOOL keyboardVisible;
Prop_assign() BOOL shouldAdjust;
Prop_assign() CGFloat offsetY;
Prop_assign() CGRect keyboardFrameInContainer;
Prop_assign() CGRect accessoryFrameInContainer;
Prop_assign() CGRect obstructionFrameInContainer;
Prop_assign() CGRect targetFrameInContainer;
Prop_assign() CGRect triggerFrameInContainer;
Prop_assign() NSTimeInterval animationDuration;
Prop_assign() UIViewAnimationOptions animationOptions;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCKeyboardResult
-(JobsRetJobsOCKeyboardResultByBOOLBlock _Nonnull)byKeyboardVisible;
-(JobsRetJobsOCKeyboardResultByBOOLBlock _Nonnull)byShouldAdjust;
-(JobsRetJobsOCKeyboardResultByCGFloatBlock _Nonnull)byOffsetY;
-(JobsRetJobsOCKeyboardResultByCGRectBlock _Nonnull)byAccessoryFrameInContainer;
-(JobsRetJobsOCKeyboardResultByCGRectBlock _Nonnull)byKeyboardFrameInContainer;
-(JobsRetJobsOCKeyboardResultByCGRectBlock _Nonnull)byObstructionFrameInContainer;
-(JobsRetJobsOCKeyboardResultByCGRectBlock _Nonnull)byTargetFrameInContainer;
-(JobsRetJobsOCKeyboardResultByCGRectBlock _Nonnull)byTriggerFrameInContainer;
-(JobsRetJobsOCKeyboardResultByUIViewAnimationOptionsBlock _Nonnull)byAnimationOptions;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCKeyboardResult
@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCKeyboardResult_h */
