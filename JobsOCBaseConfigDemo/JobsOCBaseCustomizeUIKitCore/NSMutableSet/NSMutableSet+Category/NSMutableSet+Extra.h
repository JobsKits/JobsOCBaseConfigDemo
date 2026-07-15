//
//  NSMutableSet+Extra.h
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSMUTABLESET_EXTRA_B3DDA68994
#define JOBS_HEADER_GUARD_NSMUTABLESET_EXTRA_B3DDA68994

#pragma once

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableSet (Extra)
/// 阻止向可变集合添加空元素
-(JobsRetMutableSetByIDBlock _Nonnull)add;
-(JobsRetBOOLByIDBlock _Nonnull)containsObject;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSMUTABLESET_EXTRA_B3DDA68994 */
