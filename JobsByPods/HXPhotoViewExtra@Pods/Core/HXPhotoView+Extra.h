//
//  HXPhotoView+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_HXPHOTOVIEW_EXTRA_95624E9240
#define JOBS_HEADER_GUARD_HXPHOTOVIEW_EXTRA_95624E9240

#import <UIKit/UIKit.h>

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

@interface HXPhotoView (Extra)

+(JobsReturnHXPhotoViewByPhotoManagerBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END

//initBy
#endif /* JOBS_HEADER_GUARD_HXPHOTOVIEW_EXTRA_95624E9240 */
