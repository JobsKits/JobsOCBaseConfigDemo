//
//  MyProxy.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "WeakTarget.h"

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

@interface MyProxy : NSProxy

Prop_strong(nullable)NSMutableArray *targets;
Prop_strong(nullable)NSMutableArray <WeakTarget *>*weakTargets;

+(instancetype)proxy;
-(jobsByIDBlock _Nonnull)addTargetBy;
-(jobsByIDBlock _Nonnull)addWeakTargetBy;

@end

NS_ASSUME_NONNULL_END
