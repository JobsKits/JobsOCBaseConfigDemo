//
//  YTKBaseRequest+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_YTKBASEREQUEST_DSL_B8E53EF6AA
#define JOBS_HEADER_GUARD_YTKBASEREQUEST_DSL_B8E53EF6AA

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByNSIntegerBlock)(NSInteger data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByDictionaryBlock)(NSDictionary *_Nullable data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByDelegateBlock)(id<YTKRequestDelegate> _Nullable data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByPriorityBlock)(YTKRequestPriority data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByStringBlock)(NSString *_Nullable data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByProgressBlock)(AFURLSessionTaskProgressBlock _Nullable data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByConstructingBlock)(AFConstructingBlock _Nullable data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByCompletionBlock)(YTKRequestCompletionBlock _Nullable data);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByCompletionBlocks)(YTKRequestCompletionBlock _Nullable success, YTKRequestCompletionBlock _Nullable failure);
typedef __kindof YTKBaseRequest *_Nullable(^JobsRetYTKBaseRequestByAccessoryBlock)(id<YTKRequestAccessory> _Nullable data);

@interface YTKBaseRequest (DSL)

-(JobsRetYTKBaseRequestByNSIntegerBlock _Nonnull)byTag;
-(JobsRetYTKBaseRequestByDictionaryBlock _Nonnull)byUserInfo;
-(JobsRetYTKBaseRequestByDelegateBlock _Nonnull)byDelegate;
-(JobsRetYTKBaseRequestByPriorityBlock _Nonnull)byPriority;
-(JobsRetYTKBaseRequestByStringBlock _Nonnull)byResumableDownloadPath;
-(JobsRetYTKBaseRequestByProgressBlock _Nonnull)byDownloadProgress;
-(JobsRetYTKBaseRequestByProgressBlock _Nonnull)byUploadProgress;
-(JobsRetYTKBaseRequestByConstructingBlock _Nonnull)byConstructBody;
-(JobsRetYTKBaseRequestByCompletionBlock _Nonnull)bySuccess;
-(JobsRetYTKBaseRequestByCompletionBlock _Nonnull)byFailure;
-(JobsRetYTKBaseRequestByCompletionBlocks _Nonnull)byCompletion;
-(JobsRetYTKBaseRequestByAccessoryBlock _Nonnull)byAddAccessory;
-(__kindof YTKBaseRequest *_Nonnull)byStart;
-(__kindof YTKBaseRequest *_Nonnull)byStop;
-(__kindof YTKBaseRequest *_Nonnull)byClearCompletion;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_YTKBASEREQUEST_DSL_B8E53EF6AA */
