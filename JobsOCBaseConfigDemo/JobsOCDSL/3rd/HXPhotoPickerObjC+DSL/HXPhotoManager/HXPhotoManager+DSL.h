//
//  HXPhotoManager+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_HXPHOTOMANAGER_DSL_E0AB6AA0BB

#if __has_include(<HXPhotoPickerObjC/HXPhotoPicker.h>)
#import <HXPhotoPickerObjC/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

#define JOBS_HEADER_GUARD_HXPHOTOMANAGER_DSL_E0AB6AA0BB

#import <Foundation/Foundation.h>

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface HXPhotoManager (DSL)

-(JobsRetHXPhotoManagerByConfigurationBlock _Nonnull)byConfiguration;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HXPHOTOMANAGER_DSL_E0AB6AA0BB */
