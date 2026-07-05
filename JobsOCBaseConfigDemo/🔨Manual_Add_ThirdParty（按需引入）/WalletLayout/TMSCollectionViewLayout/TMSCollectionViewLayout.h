//
//  TMSCollectionViewLayout.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TMSCOLLECTIONVIEWLAYOUT_62880519C2
#define JOBS_HEADER_GUARD_TMSCOLLECTIONVIEWLAYOUT_62880519C2

#import <UIKit/UIKit.h>

#import "JobsBaseProtocolHeader.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

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
