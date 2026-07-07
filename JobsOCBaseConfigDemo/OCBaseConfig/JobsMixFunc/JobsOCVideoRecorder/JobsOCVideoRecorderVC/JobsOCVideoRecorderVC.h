//
//  JobsOCVideoRecorderVC.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderVC_h
#define JobsOCVideoRecorderVC_h

#import <TargetConditionals.h>
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

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import "JobsByOCPods.h"
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import "JobsOCDSL.h"
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import "JobsMakes.h"
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCVideoRecorderVC : UIViewController

Prop_strong(readonly) JobsOCVideoRecorderConfig *config;

-(instancetype)initWithConfig:(JobsOCVideoRecorderConfig *)config NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithNibName:(NSString *_Nullable)nibNameOrNil bundle:(NSBundle *_Nullable)nibBundleOrNil NS_UNAVAILABLE;
-(instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderVC_h */
