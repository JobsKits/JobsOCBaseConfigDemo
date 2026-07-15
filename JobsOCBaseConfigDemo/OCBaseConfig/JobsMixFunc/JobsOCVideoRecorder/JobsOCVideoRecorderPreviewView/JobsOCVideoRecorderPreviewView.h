//
//  JobsOCVideoRecorderPreviewView.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderPreviewView_h
#define JobsOCVideoRecorderPreviewView_h

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

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

-(void)playWithURL:(NSURL *)URL;
-(void)stop;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderPreviewView_h */
