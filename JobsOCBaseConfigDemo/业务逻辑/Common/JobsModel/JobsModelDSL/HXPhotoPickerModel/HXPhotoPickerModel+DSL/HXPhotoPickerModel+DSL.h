//
//  HXPhotoPickerModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_HXPHOTOPICKERMODEL_DSL_23718279DC2FA626
#define JOBS_HEADER_GUARD_HXPHOTOPICKERMODEL_DSL_23718279DC2FA626

#import "JobsModel.h"
#import "JobsBlock.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface HXPhotoPickerModel (DSL)

-(JobsRetHXPhotoPickerModelByUIViewControllerPointerBlock _Nonnull)byVc;
-(JobsRetHXPhotoPickerModelByHXCustomCameraViewControllerPointerBlock _Nonnull)byCustomCameraVC;
-(JobsRetHXPhotoPickerModelByHXPhotoManagerPointerBlock _Nonnull)byPhotoManager;
-(JobsRetHXPhotoPickerModelByHXPhotoModelPointerBlock _Nonnull)byPhotoModel;
-(JobsRetHXPhotoPickerModelByBOOLBlock _Nonnull)byIsOriginal;
-(JobsRetHXPhotoPickerModelByArrBlock _Nonnull)byAllList;
-(JobsRetHXPhotoPickerModelByArrBlock _Nonnull)byPhotoList;
-(JobsRetHXPhotoPickerModelByArrBlock _Nonnull)byVideoList;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HXPHOTOPICKERMODEL_DSL_23718279DC2FA626 */
