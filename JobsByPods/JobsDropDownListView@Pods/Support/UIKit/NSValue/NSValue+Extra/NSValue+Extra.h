//
//  NSValue+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSVALUE_EXTRA_195EE76FFA
#define JOBS_HEADER_GUARD_NSVALUE_EXTRA_195EE76FFA

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

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
#endif /* JOBS_HEADER_GUARD_NSVALUE_EXTRA_195EE76FFA */
