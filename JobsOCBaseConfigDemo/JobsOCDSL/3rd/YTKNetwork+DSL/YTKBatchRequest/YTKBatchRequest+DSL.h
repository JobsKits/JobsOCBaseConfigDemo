//
//  YTKBatchRequest+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_YTKBATCHREQUEST_DSL_E21A9C3484
#define JOBS_HEADER_GUARD_YTKBATCHREQUEST_DSL_E21A9C3484

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN


@interface YTKBatchRequest (DSL)

@property(nonatomic, strong, readonly) NSArray<YTKRequest *> *jobs_requests;
@property(nonatomic, strong, readonly, nullable) YTKRequest *jobs_failedRequest;
@property(nonatomic, assign, readonly) BOOL jobs_isFromCache;

-(JobsRetYTKBatchRequestByNSIntegerBlock _Nonnull)byTag;
-(JobsRetYTKBatchRequestByDelegateBlock _Nonnull)byDelegate;
-(JobsRetYTKBatchRequestByAccessoryBlock _Nonnull)byAddAccessory;
-(JobsRetYTKBatchRequestByAccessoriesBlock _Nonnull)byAccessories;
-(JobsRetYTKBatchRequestBySuccessBlock _Nonnull)bySuccess;
-(JobsRetYTKBatchRequestBySuccessBlock _Nonnull)byFailure;
-(JobsRetYTKBatchRequestByCompletionBlocks _Nonnull)byCompletion;
-(__kindof YTKBatchRequest *_Nonnull)byStart;
-(__kindof YTKBatchRequest *_Nonnull)byStop;
-(__kindof YTKBatchRequest *_Nonnull)byClearCompletion;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_YTKBATCHREQUEST_DSL_E21A9C3484 */
