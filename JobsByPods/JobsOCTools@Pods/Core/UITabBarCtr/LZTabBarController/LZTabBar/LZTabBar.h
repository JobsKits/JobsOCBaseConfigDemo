//
//  LZTabBar.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_LZTABBAR_24960EE850
#define JOBS_HEADER_GUARD_LZTABBAR_24960EE850

#import <UIKit/UIKit.h>
#import <JobsOCTools/LZTabBarItem.h>

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

@protocol LZTabBarDelegate;

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

@interface LZTabBar : UIView<LZTabBarItemDelegate>

Prop_strong()NSArray<LZTabBarItem *>* _Nullable items;
Prop_assign()id <LZTabBarDelegate> _Nullable delegate;

-(JobsRetLZTabBarByItemsBlock _Nonnull)byItems;
-(JobsRetLZTabBarByDelegateBlock _Nonnull)byDelegate;

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
