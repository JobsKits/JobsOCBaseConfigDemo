//
//  ASCollectionNode+DSL.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ASCOLLECTIONNODE_DSL_859CD03C8D
#define JOBS_HEADER_GUARD_ASCOLLECTIONNODE_DSL_859CD03C8D

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <objc/runtime.h>

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

static inline void jobs_on_main(jobsByVoidBlock _Nullable work) {
    if (NSThread.isMainThread) {
        if(work) work();
    }else {
        dispatch_async(dispatch_get_main_queue(), work);
    }
}

@interface ASCollectionNode (DSL)

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ASCOLLECTIONNODE_DSL_859CD03C8D */
