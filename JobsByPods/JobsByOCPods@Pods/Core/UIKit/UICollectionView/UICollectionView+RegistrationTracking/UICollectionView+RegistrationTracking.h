//
//  UICollectionView+RegistrationTracking.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEW_REGISTRATIONTRACKING_ACF15BE277
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEW_REGISTRATIONTRACKING_ACF15BE277

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsByOCPods/NSMutableSet+Extra.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (RegistrationTracking)<BaseCollectionViewProtocol>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEW_REGISTRATIONTRACKING_ACF15BE277 */
