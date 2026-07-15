//
//  JobsOCAudioRecorder.h
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

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
@end

@interface JobsOCAudioRecordingStore : NSObject
@property(nonatomic,strong,readonly)NSURL *directoryURL;
+(instancetype)shared;
-(NSURL *)makeURLWithMode:(JobsOCAudioRecordingMode)mode;
-(NSArray<JobsOCAudioRecording *> *)recordings;
-(BOOL)deleteRecording:(JobsOCAudioRecording *)recording error:(NSError **)error;
@end

@class JobsOCAudioRecorderEngine;
@protocol JobsOCAudioRecorderEngineDelegate <NSObject>
@optional
-(void)audioRecorderEngineDidStart:(JobsOCAudioRecorderEngine *)engine;
-(void)audioRecorderEngine:(JobsOCAudioRecorderEngine *)engine didFinishAtURL:(nullable NSURL *)url error:(nullable NSError *)error;
@end

@interface JobsOCAudioRecorderEngine : NSObject
@property(nonatomic,weak,nullable)id<JobsOCAudioRecorderEngineDelegate> delegate;
@property(nonatomic,assign,readonly)JobsOCAudioRecordingMode mode;
@property(nonatomic,assign,readonly,getter=isRecording)BOOL recording;
@property(nonatomic,assign,readonly)NSTimeInterval currentTime;
+(instancetype)shared;
-(void)requestPermission:(void(^)(BOOL granted))completion;
-(BOOL)startWithMode:(JobsOCAudioRecordingMode)mode maximumDuration:(NSTimeInterval)duration error:(NSError **)error;
-(void)stopAndSave;
-(void)cancel;
@end

@interface JobsOCAudioPlayerEngine : NSObject
@property(nonatomic,strong,readonly,nullable)NSURL *playingURL;
+(instancetype)shared;
-(BOOL)toggleURL:(NSURL *)url error:(NSError **)error;
-(void)stop;
@end

@interface JobsOCAudioRecordButton : UIButton
@property(nonatomic,assign)NSTimeInterval duration;
@property(nonatomic,assign)NSTimeInterval minimumValidDuration;
@property(nonatomic,copy,nullable)BOOL(^onBegin)(void);
@property(nonatomic,copy,nullable)void(^onFinish)(void);
@property(nonatomic,copy,nullable)void(^onCancel)(void);
@property(nonatomic,copy,nullable)void(^onTooShort)(void);
+(instancetype)button;
@end

NS_ASSUME_NONNULL_END
