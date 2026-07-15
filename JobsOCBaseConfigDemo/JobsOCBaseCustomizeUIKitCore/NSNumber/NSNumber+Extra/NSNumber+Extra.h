//
//  NSNumber+Extra.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSNUMBER_EXTRA_3825F80BCE
#define JOBS_HEADER_GUARD_NSNUMBER_EXTRA_3825F80BCE

#pragma once

#import <Foundation/Foundation.h>
#import "JobsStringUtilsHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

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
#endif /* JOBS_HEADER_GUARD_NSNUMBER_EXTRA_3825F80BCE */
