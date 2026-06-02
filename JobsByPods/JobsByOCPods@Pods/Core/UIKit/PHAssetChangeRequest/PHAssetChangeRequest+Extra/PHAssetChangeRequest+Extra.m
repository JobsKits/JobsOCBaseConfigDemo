//
//  PHAssetChangeRequest+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PHAssetChangeRequest+Extra.h"

@implementation PHAssetChangeRequest (Extra)
/// 对系统方法 creationRequestForAssetFromVideoAtFileURL 的二次封装
+(JobsRetPHAssetChangeRequestByURLBlock _Nonnull)initByURL{
    return ^PHAssetChangeRequest *_Nonnull(NSURL *_Nullable url){
        return [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:url];
    };
}

@end
