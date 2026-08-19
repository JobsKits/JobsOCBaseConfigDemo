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

static inline void jobs_on_main(jobsByVoidBlock _Nullable work){
    if (NSThread.isMainThread){
        if(work) work();
    }else{
        dispatch_async(dispatch_get_main_queue(), work);
    }
}

@interface ASCollectionNode (DSL)

-(JobsRetCollectionNodeByDelegateBlock _Nonnull)byDelegate;
-(JobsRetCollectionNodeByDataSourceBlock _Nonnull)byDataSource;
-(JobsRetCollectionNodeByCGFloatBlock _Nonnull)byLeadingScreensForBatching;
-(JobsRetCollectionNodeByBoolBlock _Nonnull)byInverted;
-(JobsRetCollectionNodeByBoolBlock _Nonnull)byAllowsSelection;
-(JobsRetCollectionNodeByBoolBlock _Nonnull)byAllowsMultipleSelection;
-(JobsRetCollectionNodeByBoolBlock _Nonnull)byAlwaysBounceVertical;
-(JobsRetCollectionNodeByBoolBlock _Nonnull)byAlwaysBounceHorizontal;
-(JobsRetCollectionNodeByBoolBlock _Nonnull)byShowsVerticalScrollIndicator;
-(JobsRetCollectionNodeByBoolBlock _Nonnull)byShowsHorizontalScrollIndicator;
-(JobsRetCollectionNodeByBoolBlock _Nonnull)byPagingEnabled;
-(JobsRetCollectionNodeByLayoutBlock _Nonnull)byLayout;
-(JobsRetCollectionNodeByInspectorBlock _Nonnull)byLayoutInspector;
-(JobsRetCollectionNodeByInsetsBlock _Nonnull)byContentInset;
-(JobsRetCollectionNodeByPointBlock _Nonnull)byContentOffset;
-(JobsRetCollectionNodeByPointAnimatedBlock _Nonnull)bySetContentOffsetAnimated;
-(JobsRetCollectionNodeByStringBlock _Nonnull)byRegisterSupplementaryKind;
-(JobsRetCollectionNodeByScrollToItemBlock _Nonnull)byScrollToItem;
-(JobsRetCollectionNodeBySelectBlock _Nonnull)bySelectItem;
-(JobsRetCollectionNodeByDeselectBlock _Nonnull)byDeselectItem;
-(JobsRetCollectionNodeByBatchAnimatedBlock _Nonnull)byPerformBatchAnimated;
-(JobsRetCollectionNodeByBatchBlock _Nonnull)byPerformBatchUpdates;
-(JobsRetCollectionNodeByReloadWithCompletionBlock _Nonnull)byReloadWithCompletion;
-(JobsRetCollectionNodeByVoidBlock _Nonnull)byReload;
-(JobsRetCollectionNodeByVoidBlock _Nonnull)byRelayoutItems;
-(JobsRetCollectionNodeBySetTuningBlock _Nonnull)bySetTuningForRangeType;
-(JobsRetCollectionNodeBySetTuningForModeBlock _Nonnull)bySetTuningForModeRangeType;
-(JobsRetCollectionNodeByVoidBlock _Nonnull)byOnDidFinishProcessingUpdatesOnce;
-(JobsRetCollectionNodeByDispatchBlock _Nonnull)byOnDidFinishProcessingUpdates;
-(JobsRetCollectionNodeByVoidBlock _Nonnull)byWaitUntilAllUpdatesProcessed;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ASCOLLECTIONNODE_DSL_859CD03C8D */
