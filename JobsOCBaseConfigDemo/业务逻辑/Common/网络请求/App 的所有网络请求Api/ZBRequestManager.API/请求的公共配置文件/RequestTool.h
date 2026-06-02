//
//  RequestTool.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"
#import "NSObject+UserInfo.h"

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

#if __has_include(<ZBNetworking/ZBNetworking.h>)
#import <ZBNetworking/ZBNetworking.h>
#else
#import "ZBNetworking.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsAPIs/JobsAPIs.h>)
#import <JobsAPIs/JobsAPIs.h>
#else
#import "JobsAPIs.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_INLINE AFHTTPRequestSerializer <AFURLRequestSerialization> *_Nonnull AFRequestSerializer(void){
    return AFHTTPSessionManager.manager.requestSerializer;
}

NS_ASSUME_NONNULL_BEGIN

@interface RequestTool : NSObject

Prop_assign()HTTPRequestHeaderLanguageType languageType;

+(jobsByRequestToolBlock _Nullable)setupPublicParametersBy;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof RequestTool *_Nonnull jobsMakeRequestTool(jobsByRequestToolBlock _Nonnull block){
    RequestTool *data = RequestTool.alloc.init;
    if (block) block(data);
    return data;
}
