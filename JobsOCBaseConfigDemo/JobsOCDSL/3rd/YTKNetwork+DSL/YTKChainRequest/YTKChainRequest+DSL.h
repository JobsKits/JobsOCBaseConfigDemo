//
//  YTKChainRequest+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_YTKCHAINREQUEST_DSL_7FBF7B04B2
#define JOBS_HEADER_GUARD_YTKCHAINREQUEST_DSL_7FBF7B04B2

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "JobsBlock.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN



@interface YTKChainRequest (DSL)

@property(nonatomic, strong, readonly) NSArray<YTKBaseRequest *> *jobs_requests;

-(JobsRetYTKChainRequestByDelegateBlock _Nonnull)byDelegate;
-(JobsRetYTKChainRequestByAccessoryBlock _Nonnull)byAddAccessory;
-(JobsRetYTKChainRequestByAccessoriesBlock _Nonnull)byAccessories;
-(JobsRetYTKChainRequestByRequestCallbackBlock _Nonnull)byAdd;
-(JobsRetYTKChainRequestByRequestsBlock _Nonnull)byAddRequests;
-(JobsRetYTKChainRequestBySuccessBlock _Nonnull)bySuccess;
-(JobsRetYTKChainRequestByFailureBlock _Nonnull)byFailure;
-(JobsRetYTKChainRequestByCompletionBlocks _Nonnull)byCompletion;
-(JobsRetYTKChainRequestByCompletionBlocks _Nonnull)byJobsVoidBlock;
-(__kindof YTKChainRequest *_Nonnull)byStart;
-(__kindof YTKChainRequest *_Nonnull)byStop;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_YTKCHAINREQUEST_DSL_7FBF7B04B2 */
