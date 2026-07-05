//
//  JobsOCVideoRecorderVC.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderVC_h
#define JobsOCVideoRecorderVC_h

#import <UIKit/UIKit.h>
#import "JobsOCVideoRecorderConfig.h"
#import "JobsOCVideoRecorderCIFilterProcessor.h"
#import "JobsOCVideoRecorderResult.h"
#import "JobsOCVideoRecorderCaptureManager.h"
#import "JobsOCVideoRecorderAssetWriter.h"
#import "JobsOCVideoRecorderRecordButton.h"
#import "JobsOCVideoRecorderPreviewView.h"
#import "JobsOCVideoRecorderAlbumSaver.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<TKPermissionKit/TKPermissionKit.h>)
#import <TKPermissionKit/TKPermissionKit.h>
#else
#import "TKPermissionKit.h"
#endif

#import "JobsByOCPods.h"

#import "JobsOCDSL.h"

#import "JobsMakes.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCVideoRecorderVC : UIViewController

Prop_strong(readonly) JobsOCVideoRecorderConfig *config;

-(instancetype)initWithConfig:(JobsOCVideoRecorderConfig *)config NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithNibName:(NSString *_Nullable)nibNameOrNil bundle:(NSBundle *_Nullable)nibBundleOrNil NS_UNAVAILABLE;
-(instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderVC_h */
