//
//  HXPhotoPickerModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef HXPhotoPickerModel_h
#define HXPhotoPickerModel_h

#import <Foundation/Foundation.h>

#if __has_include(<HXPhotoPickerObjC/HXPhotoPicker.h>)
#import <HXPhotoPickerObjC/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

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

@class HXCustomCameraViewController;

NS_ASSUME_NONNULL_BEGIN

@interface HXPhotoPickerModel : NSObject

Prop_strong()__kindof UIViewController *vc;
Prop_strong()HXCustomCameraViewController *customCameraVC;
Prop_strong()HXPhotoManager *photoManager;
Prop_strong()HXPhotoModel *photoModel;
Prop_assign()BOOL isOriginal;
Prop_strong()NSArray<HXPhotoModel *> *allList;
Prop_strong()NSArray<HXPhotoModel *> *photoList;
Prop_strong()NSArray<HXPhotoModel *> *videoList;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof HXPhotoPickerModel *_Nonnull jobsMakeHXPhotoPickerModel(jobsByHXPhotoPickerModelBlock _Nonnull block){
    HXPhotoPickerModel *model = HXPhotoPickerModel.alloc.init;
    if (block) block(model);
    return model;
}

#endif /* HXPhotoPickerModel_h */
