//
//  FileFolderHandleModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>                       // 提供音视频采集、播放、编辑与处理能力，如媒体资源加载、缩略图提取、音频混合等。
#import "DefineProperty.h"

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
