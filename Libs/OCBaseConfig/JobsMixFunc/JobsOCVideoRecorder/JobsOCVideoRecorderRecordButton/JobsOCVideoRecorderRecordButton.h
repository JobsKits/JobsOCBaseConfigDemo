//
//  JobsOCVideoRecorderRecordButton.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderRecordButton_h
#define JobsOCVideoRecorderRecordButton_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <QuartzCore/QuartzCore.h>
#import "JobsMakes.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@class JobsOCVideoRecorderRecordButton;

@protocol JobsOCVideoRecorderRecordButtonDelegate <NSObject>

-(void)recordButtonDidBeginLongPress:(JobsOCVideoRecorderRecordButton *)recordButton;
-(jobsByJobsOCVideoRecorderRecordButtonBlock _Nonnull)jobsRecordButtonDidBeginLongPress;
-(void)recordButtonDidEndLongPress:(JobsOCVideoRecorderRecordButton *)recordButton;
-(jobsByJobsOCVideoRecorderRecordButtonBlock _Nonnull)jobsRecordButtonDidEndLongPress;

@end

@interface JobsOCVideoRecorderRecordButton : UIView

Prop_weak(nullable) id<JobsOCVideoRecorderRecordButtonDelegate> delegate;
Prop_assign() CGFloat progress;

-(jobsByTimeIntervalBlock _Nonnull)startProgressWithDuration;
-(jobsByVoidBlock _Nonnull)stopProgress;
-(jobsByVoidBlock _Nonnull)resetProgress;
-(JobsRetJobsOCVideoRecorderRecordButtonByCGFloatBlock _Nonnull)byProgress;
-(JobsRetJobsOCVideoRecorderRecordButtonByDelegateBlock _Nonnull)byDelegate;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderRecordButton_h */
