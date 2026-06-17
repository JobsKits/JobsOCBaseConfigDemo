//
//  HXPhotoPickerModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "JobsDefineProperty.h"
#import "HXPhotoModel.h"

#if __has_include(<HXPhotoPickerObjC/HXPhotoPicker.h>)
#import <HXPhotoPickerObjC/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
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
