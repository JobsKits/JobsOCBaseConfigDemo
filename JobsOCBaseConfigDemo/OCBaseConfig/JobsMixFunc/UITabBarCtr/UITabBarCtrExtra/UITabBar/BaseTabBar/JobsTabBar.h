//
//  JobsTabBar.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#import "JobsByOCPods.h"

#import "JobsLoadingImageHeader.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#ifndef ALIGNMENT_TYPE_ENUM_DEFINED
#define ALIGNMENT_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, AlignmentType) {
    ImageLeftTitleRight,// 图左，文字右
    ImageRightTitleLeft,// 图右，文字左
    ImageTopTitleBottom,// 图上，文字下
    ImageBottomTitleTop // 图下，文字上
};
#endif /* ALIGNMENT_TYPE_ENUM_DEFINED */
/// 超过 6 个 系统会变成更多，过不了审核
#import "JobsOCDSL.h"

@interface JobsTabBar : UITabBar

Prop_assign()AlignmentType alignmentType;

-(CGFloat)customTabBarOffsetHeight;

@end

NS_INLINE __kindof JobsTabBar *_Nonnull jobsMakeTabBar(jobsByTabBarBlock _Nullable block){
    JobsTabBar *data = JobsTabBar.alloc.init;
    if (block) block(data);
    return data;
}
