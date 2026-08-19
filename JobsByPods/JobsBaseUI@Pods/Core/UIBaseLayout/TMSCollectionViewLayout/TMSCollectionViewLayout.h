//
//  TMSCollectionViewLayout.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TMSCOLLECTIONVIEWLAYOUT_62880519C2
#define JOBS_HEADER_GUARD_TMSCOLLECTIONVIEWLAYOUT_62880519C2

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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

#if __has_include(<JobsOCDSL/JobsSystemAPIDSLSupplement.h>)
#import <JobsOCDSL/JobsSystemAPIDSLSupplement.h>
#else
#import "JobsSystemAPIDSLSupplement.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface TMSCollectionViewLayout : UICollectionViewLayout

Prop_weak()id<TMSCollectionViewLayoutDelegate> layout_delegate;
/// 左右边距
Prop_assign()CGFloat padding;
/// Cell 高度
Prop_assign()CGFloat itemHeight;
/// 收起时相邻 Cell 被盖住的比例，默认 0.5
Prop_assign()CGFloat overlapRatio;
/// 展开时相邻 Cell 的正常间距
Prop_assign()CGFloat expandedItemSpacing;
/// 点击item
-(void)didClickWithIndexPath:(NSIndexPath *)clickIndexPath isExpand:(BOOL)isExpand;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN TMSCollectionViewLayout
-(JobsRetTMSCollectionViewLayoutByBOOLBlock _Nonnull)byExpand;
-(JobsRetTMSCollectionViewLayoutByNSIndexPathBlock _Nonnull)byClickIndexPath;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END TMSCollectionViewLayout
@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof TMSCollectionViewLayout *_Nonnull jobsMakeTMSCollectionViewLayout(jobsByTMSCollectionViewLayoutBlock _Nonnull block){
    TMSCollectionViewLayout *data = TMSCollectionViewLayout.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_TMSCOLLECTIONVIEWLAYOUT_62880519C2 */
