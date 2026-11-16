//
//  NSPointerArray+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSPOINTERARRAY_EXTRA_C5A0D422C7
#define JOBS_HEADER_GUARD_NSPOINTERARRAY_EXTRA_C5A0D422C7

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSPointerArray (Extra)

-(JobsRetPointerByNSUIntegerBlock _Nonnull)pointerByIndex;
-(JobsRetPointerArrayByPointerBlock _Nonnull)add;
-(JobsRetPointerArrayByNSUIntegerBlock _Nonnull)removePointerBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSPOINTERARRAY_EXTRA_C5A0D422C7 */
