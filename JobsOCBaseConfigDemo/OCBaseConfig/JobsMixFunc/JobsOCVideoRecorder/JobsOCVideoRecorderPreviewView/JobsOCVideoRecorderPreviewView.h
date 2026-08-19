//
//  JobsOCVideoRecorderPreviewView.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderPreviewView_h

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#define JobsOCVideoRecorderPreviewView_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <AVFoundation/AVFoundation.h>

#import "JobsByOCPods.h"
#import "JobsOCDSL.h"
#import "JobsMakes.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@class JobsOCVideoRecorderPreviewView;

typedef void(^JobsOCVideoRecorderPreviewActionBlock)(JobsOCVideoRecorderPreviewView *previewView);

@interface JobsOCVideoRecorderPreviewView : UIView

Prop_copy(nullable) JobsOCVideoRecorderPreviewActionBlock cancelBlock;
Prop_copy(nullable) JobsOCVideoRecorderPreviewActionBlock saveBlock;

-(jobsByURLBlock _Nonnull)playWithURL;
-(jobsByVoidBlock _Nonnull)jobsStop;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderPreviewView_h */
