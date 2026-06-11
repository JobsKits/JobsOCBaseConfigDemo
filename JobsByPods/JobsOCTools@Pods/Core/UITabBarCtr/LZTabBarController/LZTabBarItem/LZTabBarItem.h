//
//  LZTabBarItem.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

#ifndef LZ_TAB_BAR_ITEM_TYPE_ENUM_DEFINED
#define LZ_TAB_BAR_ITEM_TYPE_ENUM_DEFINED
typedef enum : NSUInteger {
    LZTabBarItemTypeDefault,  /// 默认类型
    LZTabBarItemTypeImage,    /// 仅图片
    LZTabBarItemTypeText      /// 仅文字
} LZTabBarItemType;
#endif /* LZ_TAB_BAR_ITEM_TYPE_ENUM_DEFINED */

@protocol LZTabBarItemDelegate;

@interface LZTabBarItem : UIView

Prop_copy()NSString *icon;
Prop_copy()NSString *title;
Prop_strong()UIColor *titleColor;
Prop_assign()LZTabBarItemType type;
Prop_assign()id <LZTabBarItemDelegate> delegate;

@end

@protocol LZTabBarItemDelegate <NSObject>

-(void)tabBarItem:(LZTabBarItem *)item didSelectIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof LZTabBarItem *_Nonnull jobsMakeLZTabBarItem(jobsByLZTabBarItemBlock _Nonnull block){
    LZTabBarItem *data = LZTabBarItem.alloc.init;
    if (block) block(data);
    return data;
}
