//
//  HXPhotoManager+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_HXPHOTOMANAGER_EXTRA_CA7B072693
#define JOBS_HEADER_GUARD_HXPHOTOMANAGER_EXTRA_CA7B072693

#import <Foundation/Foundation.h>

#if __has_include(<HXPhotoPickerObjC/HXPhotoPicker.h>)
#import <HXPhotoPickerObjC/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

#import "JobsBlock.h"

#import "JobsDefines.h"

@class HXPhotoConfiguration;

NS_ASSUME_NONNULL_BEGIN

@interface HXPhotoManager (Extra)

+(JobsRetHXPhotoManagerByNSUIntegerBlock _Nonnull)initByType;
/// 只显示图片
+(HXPhotoManager *)initByTypePhoto;
/// 只显示视频
+(HXPhotoManager *)initByTypeVideo;
/// 图片和视频一起显示
+(HXPhotoManager *)initByTypePhotoAndVideo;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof HXPhotoConfiguration *_Nonnull jobsMakeHXPhotoConfiguration(jobsByHXPhotoConfigurationBlock _Nonnull block){
    HXPhotoConfiguration *data = HXPhotoConfiguration.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof HXPhotoManager *_Nonnull jobsMakeHXPhotoManagerBySelectedTypePhoto(jobsByHXPhotoManagerBlock _Nonnull block){
    HXPhotoManager *data = HXPhotoManager.initByTypePhoto;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof HXPhotoManager *_Nonnull jobsMakeHXPhotoManagerBySelectedTypeVideo(jobsByHXPhotoManagerBlock _Nonnull block){
    HXPhotoManager *data = HXPhotoManager.initByTypeVideo;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof HXPhotoManager *_Nonnull jobsMakeHXPhotoManagerBySelectedTypePhotoAndVideo(jobsByHXPhotoManagerBlock _Nonnull block){
    HXPhotoManager *data = HXPhotoManager.initByTypePhotoAndVideo;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_HXPHOTOMANAGER_EXTRA_CA7B072693 */
