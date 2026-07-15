//
//  LZTabBar.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_LZTABBAR_24960EE850
#define JOBS_HEADER_GUARD_LZTABBAR_24960EE850

#import <UIKit/UIKit.h>
#import "LZTabBarItem.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

@protocol LZTabBarDelegate;

#import "JobsOCDSL.h"

@interface LZTabBar : UIView<LZTabBarItemDelegate>

Prop_strong()NSArray<LZTabBarItem *>* _Nullable items;
Prop_assign()id <LZTabBarDelegate> _Nullable delegate;

@end

@protocol LZTabBarDelegate <NSObject>

-(void)tabBar:(LZTabBar *_Nonnull)tab
didSelectItem:(LZTabBarItem *_Nonnull)item
      atIndex:(NSInteger)index;

@end

NS_INLINE __kindof LZTabBar *_Nonnull jobsMakeLZTabBar(jobsByLZTabBarBlock _Nonnull block){
    LZTabBar *data = LZTabBar.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* JOBS_HEADER_GUARD_LZTABBAR_24960EE850 */
