//
//  FileFolderHandleModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "JobsDefineProperty.h"

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
