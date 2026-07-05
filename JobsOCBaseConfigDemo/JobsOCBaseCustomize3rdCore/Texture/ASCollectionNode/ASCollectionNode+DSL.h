//
//  ASCollectionNode+DSL.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ASCOLLECTIONNODE_DSL_859CD03C8D
#define JOBS_HEADER_GUARD_ASCOLLECTIONNODE_DSL_859CD03C8D

#import <objc/runtime.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

static inline void jobs_on_main(jobsByVoidBlock _Nullable work){
    if (NSThread.isMainThread){
        if(work) work();
    }else{
        dispatch_async(dispatch_get_main_queue(), work);
    }
}

@interface ASCollectionNode (DSL)

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ASCOLLECTIONNODE_DSL_859CD03C8D */
