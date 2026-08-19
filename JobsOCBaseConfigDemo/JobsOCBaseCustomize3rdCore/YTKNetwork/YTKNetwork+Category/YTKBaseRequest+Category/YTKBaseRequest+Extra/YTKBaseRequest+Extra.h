//
//  YTKBaseRequest+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_YTKBASEREQUEST_EXTRA_9885F1E727

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#define JOBS_HEADER_GUARD_YTKBASEREQUEST_EXTRA_9885F1E727

#import <objc/runtime.h>
#import <Foundation/Foundation.h>

#import "JobsBaseProtocolHeader.h"
#import "JobsModelDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface YTKBaseRequest (Extra)<YTKCustomBaseRequestProtocol>

Prop_strong()JobsResponseModel *responseModel;

-(JobsRetNSMutableURLRequestByjobsByMutableURLRequestBlockBlock _Nonnull)jobsMakeRequestByBlock;
+(JobsRetYTKBaseRequestByIDBlock _Nonnull)ByURLParameters;
-(JobsRetYTKBaseRequestByIDBlock _Nonnull)byURLParameters;
+(JobsRetYTKBaseRequestByIDBlock _Nonnull)ByBodyParameters;
-(JobsRetYTKRequestByDictionaryBlock _Nonnull)byBodyParameters;
+(JobsRetYTKBaseRequestByIDBlock _Nonnull)ByHeaderParameters;
-(JobsRetYTKRequestByDictionaryBlock _Nonnull)byHeaderParameters;
-(JobsRetYTKBaseRequestByVoidBlock _Nonnull)handleErr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_YTKBASEREQUEST_EXTRA_9885F1E727 */
