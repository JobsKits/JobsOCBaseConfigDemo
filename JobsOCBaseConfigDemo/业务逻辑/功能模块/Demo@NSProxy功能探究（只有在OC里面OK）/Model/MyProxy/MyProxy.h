//
//  MyProxy.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "WeakTarget.h"

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

NS_ASSUME_NONNULL_BEGIN

@class MyProxy;
typedef __kindof MyProxy *_Nullable(^JobsRetMyProxyByIDBlock)(id _Nullable target);

@interface MyProxy : NSProxy

Prop_strong(nullable)NSMutableArray *targets;
Prop_strong(nullable)NSMutableArray <WeakTarget *>*weakTargets;

+(JobsRetIDByVoidBlock _Nonnull)proxy;
-(JobsRetMyProxyByIDBlock _Nonnull)addTargetBy;
-(JobsRetMyProxyByIDBlock _Nonnull)addWeakTargetBy;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN MyProxy
-(JobsRetMyProxyByNSMutableArrayBlock _Nonnull)byTargets;
-(JobsRetMyProxyByNSMutableArrayWeakTargetBlock _Nonnull)byWeakTargets;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END MyProxy
@end

NS_ASSUME_NONNULL_END
