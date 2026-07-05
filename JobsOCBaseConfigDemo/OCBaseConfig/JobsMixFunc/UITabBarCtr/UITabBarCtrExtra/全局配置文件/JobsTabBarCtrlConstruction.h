//
//  JobsTabBarCtrlConstruction.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTABBARCTRLCONSTRUCTION_14B0D364D8
#define JOBS_HEADER_GUARD_JOBSTABBARCTRLCONSTRUCTION_14B0D364D8

#import <UIKit/UIKit.h>
#import "TLTabBarAnimation.h"
#import "UITabBarItem+TLAnimation.h"

#import "JobsOCDSL.h"

#import "JobsByOCPods.h"

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#import "JobsDefines.h"

#pragma mark —— 创建动画函数
NS_INLINE TLBounceAnimation *bounceAnimation(void){
    TLBounceAnimation *anm = TLBounceAnimation.alloc.init;
    anm.isPlayFireworksAnimation = YES;
    return anm;
}

NS_INLINE TLRotationAnimation *rotationAnimation(void){
    TLRotationAnimation *anm = TLRotationAnimation.alloc.init;
    return anm;
}

NS_INLINE TLTransitionAniamtion *transitionAniamtion(void){
    TLTransitionAniamtion *anm = TLTransitionAniamtion.alloc.init;
    anm.direction = 1; // 1~6
    anm.disableDeselectAnimation = NO;
    return anm;
}

NS_INLINE TLFumeAnimation *fumeAnimation(void){
    TLFumeAnimation *anm = TLFumeAnimation.alloc.init;
    return anm;
}

NS_INLINE NSArray *imgs(void){//静态轮播图
    NSMutableArray *temp = NSMutableArray.array;
    for (NSInteger i = 28 ; i <= 65; i++) {
        NSString *imgName = [NSString stringWithFormat:@"Tools_000%zi", i];
        CGImageRef img = imgName.img.CGImage;
        [temp addObject:(__bridge id _Nonnull)(img)];
    };return temp;
}

NS_INLINE TLFrameAnimation *frameAnimation(void){
    TLFrameAnimation *anm = TLFrameAnimation.alloc.init;
    anm.images = imgs();
    anm.isPlayFireworksAnimation = YES;
    return anm;
}
#pragma mark —— 给UITabBarItem绑定动画
/// 给UITabBarItem绑定动画
NS_INLINE void setAnimation(UITabBarItem *item,
                                NSInteger index) {
     item.animation = @[
                       bounceAnimation(),
                       rotationAnimation(),
                       transitionAniamtion(),
                       fumeAnimation(),
                       frameAnimation()
                       ][index];
}
/// 系统样式UITabBarItem
/// UITabBarSystemItemMore
/// UITabBarSystemItemFavorites
/// UITabBarSystemItemFeatured
/// UITabBarSystemItemTopRated
/// UITabBarSystemItemRecents
/// UITabBarSystemItemContacts
/// UITabBarSystemItemHistory
/// UITabBarSystemItemBookmarks
/// UITabBarSystemItemSearch
/// UITabBarSystemItemDownloads
/// UITabBarSystemItemMostRecent
/// UITabBarSystemItemMostViewed
NS_INLINE UIViewController *childViewController_SystemStyle(UIViewController *viewController,
                                                                UITabBarSystemItem systemItem,
                                                                NSUInteger tag){
    viewController.view.byBgColor(JobsWhiteColor);

    viewController.tabBarItem = [UITabBarItem.alloc initWithTabBarSystemItem:systemItem tag:tag];
    setAnimation(viewController.tabBarItem, tag);//可选实现
    return viewController;
}
#endif /* JOBS_HEADER_GUARD_JOBSTABBARCTRLCONSTRUCTION_14B0D364D8 */
