//
//  NSObject+Extra.h
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_7A22904AD6
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_7A22904AD6

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif


NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extra)
/**

     NSMutableArray <UIViewModel *>*dataMutArr = popupView.valueForKey(@"dataMutArr");
     [dataMutArr removeAllObjects];
     [dataMutArr addObjectsFromArray:self.createDataMutArr2];

     // dataMutArr = self.createDataMutArr2; 这一段无效
 */
- (JobsRetIDByIDBlock _Nonnull)valueForKey;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_7A22904AD6 */
