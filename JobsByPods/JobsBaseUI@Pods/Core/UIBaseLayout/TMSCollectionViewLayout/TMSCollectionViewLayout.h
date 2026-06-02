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

NS_ASSUME_NONNULL_BEGIN

@interface TMSCollectionViewLayout : UICollectionViewLayout

Prop_weak()id<TMSCollectionViewLayoutDelegate> layout_delegate;
/// 左右边距
Prop_assign()CGFloat padding;
/// 点击item
-(void)didClickWithIndexPath:(NSIndexPath *)clickIndexPath isExpand:(BOOL)isExpand;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof TMSCollectionViewLayout *_Nonnull jobsMakeTMSCollectionViewLayout(jobsByTMSCollectionViewLayoutBlock _Nonnull block){
    TMSCollectionViewLayout *data = TMSCollectionViewLayout.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_TMSCOLLECTIONVIEWLAYOUT_62880519C2 */
