//
//  ExampleUsage.h
//  JobsLocker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_EXAMPLEUSAGE_5238C09B71
#define JOBS_HEADER_GUARD_EXAMPLEUSAGE_5238C09B71

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsLocker.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface DemoObject : NSObject

Prop_strong()JobsLocker *locker;
Prop_strong()NSMutableArray<NSString *> *dataSource;

-(jobsByVoidBlock _Nonnull)bootstrap;
-(void)addObject:(NSString *)obj;
-(jobsByStrBlock _Nonnull)addObject;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_EXAMPLEUSAGE_5238C09B71 */
