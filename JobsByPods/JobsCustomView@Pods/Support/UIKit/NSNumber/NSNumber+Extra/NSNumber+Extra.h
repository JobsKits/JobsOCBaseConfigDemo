//
//  NSNumber+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSNUMBER_EXTRA_2B6DA6CADD
#define JOBS_HEADER_GUARD_NSNUMBER_EXTRA_2B6DA6CADD

#import <Foundation/Foundation.h>

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
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

@interface NSNumber (Extra)

Prop(readonly)NSString *stringValueOrEmpty;

+(JobsRetNumberByCharBlock _Nonnull)initByChar;
+(JobsRetNumberByUnsignedCharBlock _Nonnull)initByUnsignedChar;
+(JobsRetNumberByShortBlock _Nonnull)initByShort;
+(JobsRetNumberByUnsignedShortBlock _Nonnull)initByUnsignedShort;
+(JobsRetNumberByIntBlock _Nonnull)initByInt;
+(JobsRetNumberByUnsignedIntBlock _Nonnull)initByUnsignedInt;
+(JobsRetNumberByLongBlock _Nonnull)initByLong;
+(JobsRetNumberByUnsignedLongBlock _Nonnull)initByUnsignedLong;
+(JobsRetNumberByLongLongBlock _Nonnull)initByLongLong;
+(JobsRetNumberByUnsignedLongLongBlock _Nonnull)initByUnsignedLongLong;
+(JobsRetNumberByFloatBlock _Nonnull)initByFloat;
+(JobsRetNumberByDoubleBlock _Nonnull)initByDouble;
+(JobsRetNumberByBOOLBlock _Nonnull)initByBOOL;
+(JobsRetNumberByNSIntegerBlock _Nonnull)initByNSInteger;
+(JobsRetNumberByNSUIntegerBlock _Nonnull)initByNSUInteger;
+(JobsRetNumberByCGFloatBlock _Nonnull)initByCGFloat; /// 特殊处理 CGFloat 类型

-(CGFloat)byFloat;
-(JobsRetStrByNumberBlock _Nonnull)toString;
-(JobsRetNumberByNSIntegerBlock _Nonnull)updateByStepInt;
-(JobsRetNumberByCGFloatBlock _Nonnull)updateByStepFloat;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSNUMBER_EXTRA_2B6DA6CADD */
