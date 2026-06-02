//
//  UICollectionViewLayoutAttributes+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEWLAYOUTATTRIBUTES_EXTRA_38881E8208
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEWLAYOUTATTRIBUTES_EXTRA_38881E8208

#import <UIKit/UIKit.h>

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

@interface UICollectionViewLayoutAttributes (Extra)

+(JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEWLAYOUTATTRIBUTES_EXTRA_38881E8208 */
