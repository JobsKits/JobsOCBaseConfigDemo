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
#import "JobsMakes.h"
#import "JobsDefines.h"

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
