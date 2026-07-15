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
#import "AVAssetImageGenerator+Extra.h"
#import "UIImage+Extra.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVURLAsset (Extra)
/// 获取视频第一帧
-(UIImage *_Nullable)videoPreViewImage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_AVURLASSET_EXTRA_56D990CFBB */
