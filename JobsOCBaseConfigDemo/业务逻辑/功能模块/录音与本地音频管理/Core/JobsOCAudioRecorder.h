//
//  JobsOCAudioRecorder.h
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#import <AVFoundation/AVFoundation.h>

#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsOCTimer.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsOCDSL.h"
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JobsOCAudioRecordingMode) {
    JobsOCAudioRecordingModeShort,
    JobsOCAudioRecordingModeLong
};

@interface JobsOCAudioRecording : NSObject
@property(nonatomic,strong)NSURL *url;
@property(nonatomic,assign)JobsOCAudioRecordingMode mode;
@property(nonatomic,strong)NSDate *createdAt;
@property(nonatomic,assign)NSTimeInterval duration;
@property(nonatomic,assign)long long fileSize;
-(JobsRetJobsOCAudioRecordingByURLBlock _Nonnull)byUrl;
-(JobsRetJobsOCAudioRecordingByModeBlock _Nonnull)byMode;
-(JobsRetJobsOCAudioRecordingByDateBlock _Nonnull)byCreatedAt;
-(JobsRetJobsOCAudioRecordingByTimeIntervalBlock _Nonnull)byDuration;
-(JobsRetJobsOCAudioRecordingByLongLongBlock _Nonnull)byFileSize;
@end

@interface AVAudioRecorder (JobsOCAudioRecorderDSL)
-(JobsRetAVAudioRecorderByIDBlock _Nonnull)byDelegate;
@end

@interface AVAudioPlayer (JobsOCAudioRecorderDSL)
-(JobsRetAVAudioPlayerByIDBlock _Nonnull)byDelegate;
@end

@interface JobsOCAudioRecordingStore : NSObject
@property(nonatomic,strong,readonly)NSURL *directoryURL;
+(JobsRetIDByVoidBlock _Nonnull)shared;
-(JobsRetNSURLByJobsOCAudioRecordingModeBlock _Nonnull)makeURLWithMode;
-(JobsRetNSArrayJobsOCAudioRecordingByVoidBlock _Nonnull)recordings;
-(BOOL)deleteRecording:(JobsOCAudioRecording *)recording error:(NSError **)error;
@end

@class JobsOCAudioRecorderEngine;
@protocol JobsOCAudioRecorderEngineDelegate <NSObject>
@optional
-(void)audioRecorderEngineDidStart:(JobsOCAudioRecorderEngine *)engine;
-(jobsByJobsOCAudioRecorderEngineBlock _Nonnull)jobsAudioRecorderEngineDidStart;
-(void)audioRecorderEngine:(JobsOCAudioRecorderEngine *)engine didFinishAtURL:(nullable NSURL *)url error:(nullable NSError *)error;
@end

@interface JobsOCAudioRecorderEngine : NSObject
@property(nonatomic,weak,nullable)id<JobsOCAudioRecorderEngineDelegate> delegate;
@property(nonatomic,assign,readonly)JobsOCAudioRecordingMode mode;
@property(nonatomic,assign,readonly,getter=isRecording)BOOL recording;
@property(nonatomic,assign,readonly)NSTimeInterval currentTime;
+(JobsRetIDByVoidBlock _Nonnull)shared;
-(jobsByvoidBOOLBlock _Nonnull)requestPermission;
-(BOOL)startWithMode:(JobsOCAudioRecordingMode)mode maximumDuration:(NSTimeInterval)duration error:(NSError **)error;
-(jobsByVoidBlock _Nonnull)stopAndSave;
-(void)cancel;
-(jobsByVoidBlock _Nonnull)jobsCancel;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCAudioRecorderEngine
-(JobsRetJobsOCAudioRecorderEngineByAVAudioRecorderBlock _Nonnull)byRecorder;
-(JobsRetJobsOCAudioRecorderEngineByBOOLBlock _Nonnull)byKeepFile;
-(JobsRetJobsOCAudioRecorderEngineByJobsOCAudioRecordingModeBlock _Nonnull)byMode;
-(JobsRetJobsOCAudioRecorderEngineByNSURLBlock _Nonnull)byCurrentURL;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCAudioRecorderEngine
@end

@interface JobsOCAudioPlayerEngine : NSObject
@property(nonatomic,strong,readonly,nullable)NSURL *playingURL;
+(JobsRetIDByVoidBlock _Nonnull)shared;
-(BOOL)toggleURL:(NSURL *)url error:(NSError **)error;
-(jobsByVoidBlock _Nonnull)jobsStop;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCAudioPlayerEngine
-(JobsRetJobsOCAudioPlayerEngineByNSURLBlock _Nonnull)byPlayingURL;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCAudioPlayerEngine
@end

@interface JobsOCAudioRecordButton : UIButton
@property(nonatomic,assign)NSTimeInterval duration;
@property(nonatomic,assign)NSTimeInterval minimumValidDuration;
@property(nonatomic,copy,nullable)BOOL(^onBegin)(void);
@property(nonatomic,copy,nullable)void(^onFinish)(void);
@property(nonatomic,copy,nullable)void(^onCancel)(void);
@property(nonatomic,copy,nullable)void(^onTooShort)(void);
-(JobsRetJobsOCAudioRecordButtonByTimeIntervalBlock _Nonnull)byDuration;
-(JobsRetJobsOCAudioRecordButtonByTimeIntervalBlock _Nonnull)byMinimumValidDuration;
-(JobsRetJobsOCAudioRecordButtonByRetBOOLByVoidBlock _Nonnull)byAudioOnBegin;
-(JobsRetJobsOCAudioRecordButtonByVoidBlockBlock _Nonnull)byAudioOnFinish;
-(JobsRetJobsOCAudioRecordButtonByVoidBlockBlock _Nonnull)byAudioOnCancel;
-(JobsRetJobsOCAudioRecordButtonByVoidBlockBlock _Nonnull)byAudioOnTooShort;
+(instancetype)button;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCAudioRecordButton
-(JobsRetJobsOCAudioRecordButtonByBOOLBlock _Nonnull)byActive;
-(JobsRetJobsOCAudioRecordButtonByCFTimeIntervalBlock _Nonnull)byRecordingStartedAt;
-(JobsRetJobsOCAudioRecordButtonByNSStringBlock _Nonnull)byAccessibilityLabel;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCAudioRecordButton
@end

NS_ASSUME_NONNULL_END
