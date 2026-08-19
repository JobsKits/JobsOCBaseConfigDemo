//
//  AVURLAsset+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_AVURLASSET_EXTRA_56D990CFBB
#define JOBS_HEADER_GUARD_AVURLASSET_EXTRA_56D990CFBB

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <JobsByOCPods/AVAssetImageGenerator+Extra.h>
#import <JobsByOCPods/UIImage+Extra.h>

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

@interface AVURLAsset (Extra)
/// 获取视频第一帧
-(JobsRetImageByVoidBlock _Nonnull)videoPreViewImage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_AVURLASSET_EXTRA_56D990CFBB */
