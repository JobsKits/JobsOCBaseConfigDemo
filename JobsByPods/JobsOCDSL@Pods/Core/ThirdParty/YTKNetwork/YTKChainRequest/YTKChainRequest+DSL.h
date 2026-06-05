//
//  YTKChainRequest+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_YTKCHAINREQUEST_DSL_7FBF7B04B2
#define JOBS_HEADER_GUARD_YTKCHAINREQUEST_DSL_7FBF7B04B2

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef void(^JobsYTKChainSuccessBlock)(__kindof YTKChainRequest *_Nonnull chainRequest);
typedef void(^JobsYTKChainFailureBlock)(__kindof YTKChainRequest *_Nonnull chainRequest, __kindof YTKBaseRequest *_Nonnull failedRequest);

typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByDelegateBlock)(id<YTKChainRequestDelegate> _Nullable data);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByAccessoryBlock)(id<YTKRequestAccessory> _Nullable data);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByAccessoriesBlock)(NSArray<id<YTKRequestAccessory>> *_Nullable data);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByRequestCallbackBlock)(__kindof YTKBaseRequest *_Nonnull request, YTKChainCallback _Nullable callback);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByRequestsBlock)(NSArray<__kindof YTKBaseRequest *> *_Nullable data);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestBySuccessBlock)(JobsYTKChainSuccessBlock _Nullable data);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByFailureBlock)(JobsYTKChainFailureBlock _Nullable data);
typedef __kindof YTKChainRequest *_Nullable(^JobsRetYTKChainRequestByCompletionBlocks)(JobsYTKChainSuccessBlock _Nullable success, JobsYTKChainFailureBlock _Nullable failure);

@interface YTKChainRequest (DSL)

@property(nonatomic, strong, readonly) NSArray<YTKBaseRequest *> *jobs_requests;

- (JobsRetYTKChainRequestByDelegateBlock _Nonnull)byDelegate;
- (JobsRetYTKChainRequestByAccessoryBlock _Nonnull)byAddAccessory;
- (JobsRetYTKChainRequestByAccessoriesBlock _Nonnull)byAccessories;
- (JobsRetYTKChainRequestByRequestCallbackBlock _Nonnull)byAdd;
- (JobsRetYTKChainRequestByRequestsBlock _Nonnull)byAddRequests;
- (JobsRetYTKChainRequestBySuccessBlock _Nonnull)bySuccess;
- (JobsRetYTKChainRequestByFailureBlock _Nonnull)byFailure;
- (JobsRetYTKChainRequestByCompletionBlocks _Nonnull)byCompletion;
- (JobsRetYTKChainRequestByCompletionBlocks _Nonnull)byJobsVoidBlock;
- (__kindof YTKChainRequest *_Nonnull)byStart;
- (__kindof YTKChainRequest *_Nonnull)byStop;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_YTKCHAINREQUEST_DSL_7FBF7B04B2 */
