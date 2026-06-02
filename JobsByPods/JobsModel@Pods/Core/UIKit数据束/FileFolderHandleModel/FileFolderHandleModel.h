//
//  FileFolderHandleModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef FileFolderHandleModel_h
#define FileFolderHandleModel_h

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>                       // 提供音视频采集、播放、编辑与处理能力，如媒体资源加载、缩略图提取、音频混合等。

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

@interface FileFolderHandleModel : NSObject

Prop_strong(nullable)AVAsset *asset;
Prop_strong(nullable)AVAudioMix *audioMix;
Prop_strong(nullable)NSDictionary *info;
Prop_strong(nullable)NSData *data;
Prop_strong(nullable)UIImage *image;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FileFolderHandleModel *_Nonnull jobsMakeFileFolderHandleModel(jobsByFileFolderHandleModelBlock _Nonnull block){
    FileFolderHandleModel *data = FileFolderHandleModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* FileFolderHandleModel_h */
