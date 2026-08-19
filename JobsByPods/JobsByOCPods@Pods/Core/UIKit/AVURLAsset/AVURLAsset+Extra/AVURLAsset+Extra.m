//
//  AVURLAsset+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AVURLAsset+Extra.h"

@implementation AVURLAsset (Extra)
/// 获取视频第一帧
-(JobsRetImageByVoidBlock _Nonnull)videoPreViewImage{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        AVAssetImageGenerator *assetGen = AVAssetImageGenerator.initBy(self);
        assetGen.byAppliesPreferredTrackTransform(YES);
        NSError *error = nil;
        CMTime actualTime;
        CGImageRef image = [assetGen copyCGImageAtTime:CMTimeMakeWithSeconds(0.0, 600)
                                            actualTime:&actualTime
                                                 error:&error];
        if(error){
            JobsLog(@"error = %@",error.description);
            return nil;
        }else{
            UIImage *videoImage = UIImage.imageWithCGImage(image);
            CGImageRelease(image);
            return videoImage;
        }
    };
}

@end
