//
//  HXPhotoPickerModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "HXPhotoPickerModel+DSL.h"

@implementation HXPhotoPickerModel (DSL)

-(JobsRetHXPhotoPickerModelByUIViewControllerPointerBlock _Nonnull)byVc{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nullable(__kindof UIViewController * _Nullable data) {
        @jobs_strongify(self)
        self.vc = data;
        return self;
    };
}

-(JobsRetHXPhotoPickerModelByHXCustomCameraViewControllerPointerBlock _Nonnull)byCustomCameraVC{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nullable(HXCustomCameraViewController * _Nullable data) {
        @jobs_strongify(self)
        self.customCameraVC = data;
        return self;
    };
}

-(JobsRetHXPhotoPickerModelByHXPhotoManagerPointerBlock _Nonnull)byPhotoManager{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nullable(HXPhotoManager * _Nullable data) {
        @jobs_strongify(self)
        self.photoManager = data;
        return self;
    };
}

-(JobsRetHXPhotoPickerModelByHXPhotoModelPointerBlock _Nonnull)byPhotoModel{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nullable(HXPhotoModel * _Nullable data) {
        @jobs_strongify(self)
        self.photoModel = data;
        return self;
    };
}

-(JobsRetHXPhotoPickerModelByBOOLBlock _Nonnull)byIsOriginal{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isOriginal = data;
        return self;
    };
}

-(JobsRetHXPhotoPickerModelByArrBlock _Nonnull)byAllList{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nullable(NSArray <HXPhotoModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.allList = data;
        return self;
    };
}

-(JobsRetHXPhotoPickerModelByArrBlock _Nonnull)byPhotoList{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nullable(NSArray <HXPhotoModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.photoList = data;
        return self;
    };
}

-(JobsRetHXPhotoPickerModelByArrBlock _Nonnull)byVideoList{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nullable(NSArray <HXPhotoModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.videoList = data;
        return self;
    };
}

@end
