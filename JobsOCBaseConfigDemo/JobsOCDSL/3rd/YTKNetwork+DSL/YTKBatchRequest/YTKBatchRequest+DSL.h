//
//  YTKBatchRequest+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_YTKBATCHREQUEST_DSL_E21A9C3484

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#define JOBS_HEADER_GUARD_YTKBATCHREQUEST_DSL_E21A9C3484

#import <Foundation/Foundation.h>

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface YTKBatchRequest (DSL)

Prop_strong(readonly)NSArray<YTKRequest *> *jobs_requests;
Prop_strong(readonly,nullable)YTKRequest *jobs_failedRequest;
Prop_assign(readonly)BOOL jobs_isFromCache;

-(JobsRetYTKBatchRequestByNSIntegerBlock _Nonnull)byTag;
-(JobsRetYTKBatchRequestByDelegateBlock _Nonnull)byDelegate;
-(JobsRetYTKBatchRequestByAccessoryBlock _Nonnull)byAddAccessory;
-(JobsRetYTKBatchRequestByAccessoriesBlock _Nonnull)byAccessories;
-(JobsRetYTKBatchRequestBySuccessBlock _Nonnull)bySuccess;
-(JobsRetYTKBatchRequestBySuccessBlock _Nonnull)byFailure;
-(JobsRetYTKBatchRequestByCompletionBlocks _Nonnull)byCompletion;
-(JobsRetYTKBatchRequestByVoidBlock _Nonnull)byStart;
-(JobsRetYTKBatchRequestByVoidBlock _Nonnull)byStop;
-(JobsRetYTKBatchRequestByVoidBlock _Nonnull)byClearCompletion;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_YTKBATCHREQUEST_DSL_E21A9C3484 */
