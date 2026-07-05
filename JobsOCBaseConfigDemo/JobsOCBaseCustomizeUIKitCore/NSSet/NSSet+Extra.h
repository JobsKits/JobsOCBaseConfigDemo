//
//  NSSet+Extra.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSET_EXTRA_036F559DFB
#define JOBS_HEADER_GUARD_NSSET_EXTRA_036F559DFB

#pragma once

#import <Foundation/Foundation.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSSet (Extra)
/// 对系统方法 setWithArray 的二次封装
+(JobsRetSetByArrBlock _Nonnull)initByArr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSET_EXTRA_036F559DFB */
