//
//  HXPhotoPickerModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_HXPHOTOPICKERMODEL_DSL_658D736F506878C8
#define JOBS_HEADER_GUARD_HXPHOTOPICKERMODEL_DSL_658D736F506878C8

#if __has_include(<JobsModel/HXPhotoPickerModel.h>)
#import <JobsModel/HXPhotoPickerModel.h>
#else
#import "HXPhotoPickerModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface HXPhotoPickerModel (DSL)

#pragma mark —— 来自 HXPhotoPickerModel
-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(__kindof UIViewController * data))byVc;
-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(HXCustomCameraViewController * data))byCustomCameraVC;
-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(HXPhotoManager * data))byPhotoManager;
-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(HXPhotoModel * data))byPhotoModel;
-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(BOOL data))byIsOriginal;
-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(NSArray <HXPhotoModel *> * data))byAllList;
-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(NSArray <HXPhotoModel *> * data))byPhotoList;
-(__kindof HXPhotoPickerModel *_Nonnull (^ _Nonnull)(NSArray <HXPhotoModel *> * data))byVideoList;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HXPHOTOPICKERMODEL_DSL_658D736F506878C8 */
