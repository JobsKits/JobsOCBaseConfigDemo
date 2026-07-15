//
//  NSValue+Extra.h
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSVALUE_EXTRA_94C4B2700D
#define JOBS_HEADER_GUARD_NSVALUE_EXTRA_94C4B2700D

#pragma once

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSValue (Extra)

+(JobsRetValueByCGSizeBlock _Nonnull)bySize;
+(JobsRetValueByPointerBlock _Nonnull)byPointer;
+(JobsRetValueByPointBlock _Nonnull)byPoint;
+(JobsRetValueByVectorBlock _Nonnull)byVector;
+(JobsRetValueByFrameBlock _Nonnull)byRect;
+(JobsRetValueByAffineTransformBlock _Nonnull)byAffineTransform;
+(JobsRetValueByEdgeInsetsBlock _Nonnull)byEdgeInsets;
+(JobsRetValueByDirectionalEdgeInsetsBlock _Nonnull)byDirectionalEdgeInsets;
+(JobsRetValueByOffsetBlock _Nonnull)byOffset;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSVALUE_EXTRA_94C4B2700D */
