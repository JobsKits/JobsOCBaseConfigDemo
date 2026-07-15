//
//  YTKBatchRequest+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_YTKBATCHREQUEST_EXTRA_750B1BC454
#define JOBS_HEADER_GUARD_YTKBATCHREQUEST_EXTRA_750B1BC454

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface YTKBatchRequest (Extra)

+(JobsRetBatchRequestByArrBlock _Nonnull)initByRequestArray;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_YTKBATCHREQUEST_EXTRA_750B1BC454 */
