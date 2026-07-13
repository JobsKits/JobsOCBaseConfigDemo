//
//  JobsOCVideoRecorderRecordButton.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderRecordButton_h
#define JobsOCVideoRecorderRecordButton_h

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class JobsOCVideoRecorderRecordButton;

@protocol JobsOCVideoRecorderRecordButtonDelegate <NSObject>

-(void)recordButtonDidBeginLongPress:(JobsOCVideoRecorderRecordButton *)recordButton;
-(void)recordButtonDidEndLongPress:(JobsOCVideoRecorderRecordButton *)recordButton;

@end

@interface JobsOCVideoRecorderRecordButton : UIView

Prop_weak(nullable) id<JobsOCVideoRecorderRecordButtonDelegate> delegate;
Prop_assign() CGFloat progress;

-(void)startProgressWithDuration:(NSTimeInterval)duration;
-(void)stopProgress;
-(void)resetProgress;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderRecordButton_h */
