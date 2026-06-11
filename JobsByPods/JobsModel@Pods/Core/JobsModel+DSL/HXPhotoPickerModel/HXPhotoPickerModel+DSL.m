//
//  HXPhotoPickerModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "HXPhotoPickerModel+DSL.h"

@implementation HXPhotoPickerModel (DSL)

#pragma mark —— 来自 HXPhotoPickerModel
-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(__kindof UIViewController * data))byVc{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nonnull(__kindof UIViewController * data) {
        @jobs_strongify(self)
        self.vc = data;
        return self;
    };
}

-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(HXCustomCameraViewController * data))byCustomCameraVC{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nonnull(HXCustomCameraViewController * data) {
        @jobs_strongify(self)
        self.customCameraVC = data;
        return self;
    };
}

-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(HXPhotoManager * data))byPhotoManager{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nonnull(HXPhotoManager * data) {
        @jobs_strongify(self)
        self.photoManager = data;
        return self;
    };
}

-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(HXPhotoModel * data))byPhotoModel{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nonnull(HXPhotoModel * data) {
        @jobs_strongify(self)
        self.photoModel = data;
        return self;
    };
}

-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(BOOL data))byIsOriginal{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isOriginal = data;
        return self;
    };
}

-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(NSArray <HXPhotoModel *> * data))byAllList{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nonnull(NSArray <HXPhotoModel *> * data) {
        @jobs_strongify(self)
        self.allList = data;
        return self;
    };
}

-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(NSArray <HXPhotoModel *> * data))byPhotoList{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nonnull(NSArray <HXPhotoModel *> * data) {
        @jobs_strongify(self)
        self.photoList = data;
        return self;
    };
}

-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(NSArray <HXPhotoModel *> * data))byVideoList{
    @jobs_weakify(self)
    return ^__kindof HXPhotoPickerModel *_Nonnull(NSArray <HXPhotoModel *> * data) {
        @jobs_strongify(self)
        self.videoList = data;
        return self;
    };
}

@end
