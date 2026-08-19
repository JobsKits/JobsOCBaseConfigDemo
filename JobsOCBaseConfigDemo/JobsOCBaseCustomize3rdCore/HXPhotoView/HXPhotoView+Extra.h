//
//  HXPhotoView+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_HXPHOTOVIEW_EXTRA_95624E9240

#if __has_include(<HXPhotoPickerObjC/HXPhotoPicker.h>)
#import <HXPhotoPickerObjC/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

#define JOBS_HEADER_GUARD_HXPHOTOVIEW_EXTRA_95624E9240

#import <UIKit/UIKit.h>

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface HXPhotoView (Extra)

+(JobsRetHXPhotoViewByPhotoMgrBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END

//initBy
#endif /* JOBS_HEADER_GUARD_HXPHOTOVIEW_EXTRA_95624E9240 */
