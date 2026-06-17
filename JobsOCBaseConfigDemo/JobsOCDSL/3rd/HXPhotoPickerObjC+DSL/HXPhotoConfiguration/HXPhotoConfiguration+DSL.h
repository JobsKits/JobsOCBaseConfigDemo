//
//  HXPhotoConfiguration+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_HXPHOTOCONFIGURATION_DSL_0C333388A6
#define JOBS_HEADER_GUARD_HXPHOTOCONFIGURATION_DSL_0C333388A6

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

NS_ASSUME_NONNULL_BEGIN

@interface HXPhotoConfiguration (DSL)

-(JobsRetHXPhotoConfigurationByNSUIntegerBlock _Nonnull)byType;
-(JobsRetHXPhotoConfigurationByStringBlock _Nonnull)byLocalFileName;
-(JobsRetHXPhotoConfigurationByBOOLBlock _Nonnull)byShowOriginalBytes;
-(JobsRetHXPhotoConfigurationByBOOLBlock _Nonnull)byShowOriginalBytesLoading;
-(JobsRetHXPhotoConfigurationByNSIntegerBlock _Nonnull)byVideoMaximumSelectDuration;
-(JobsRetHXPhotoConfigurationByNSUIntegerBlock _Nonnull)byLimitVideoSize;
-(JobsRetHXPhotoConfigurationByBOOLBlock _Nonnull)bySelectVideoLimitSize;
-(JobsRetHXPhotoConfigurationByBOOLBlock _Nonnull)bySelectVideoBeyondTheLimitTimeAutoEdit;
-(JobsRetHXPhotoConfigurationByBOOLBlock _Nonnull)bySpecialModeNeedHideVideoSelectBtn;
-(JobsRetHXPhotoConfigurationByNSUIntegerBlock _Nonnull)byVideoMaxNum;
-(JobsRetHXPhotoConfigurationByNSUIntegerBlock _Nonnull)byMaxNum;
-(JobsRetHXPhotoConfigurationByNSUIntegerBlock _Nonnull)byPhotoMaxNum;
-(JobsRetHXPhotoConfigurationByBOOLBlock _Nonnull)bySelectTogether;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HXPHOTOCONFIGURATION_DSL_0C333388A6 */
