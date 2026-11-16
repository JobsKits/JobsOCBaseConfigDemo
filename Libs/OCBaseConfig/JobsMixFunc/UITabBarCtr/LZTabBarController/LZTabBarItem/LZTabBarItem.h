//
//  LZTabBarItem.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

#ifndef LZ_TAB_BAR_ITEM_TYPE_ENUM_DEFINED
#define LZ_TAB_BAR_ITEM_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, LZTabBarItemType) {
    LZTabBarItemTypeDefault,  /// 默认类型
    LZTabBarItemTypeImage,    /// 仅图片
    LZTabBarItemTypeText      /// 仅文字
};
#endif /* LZ_TAB_BAR_ITEM_TYPE_ENUM_DEFINED */

@protocol LZTabBarItemDelegate;

@interface LZTabBarItem : UIView

Prop_copy()NSString *icon;
Prop_copy()NSString *title;
Prop_strong()UIColor *titleColor;
Prop_assign()LZTabBarItemType type;
Prop_assign()id <LZTabBarItemDelegate> delegate;

-(JobsRetLZTabBarItemByStrBlock _Nonnull)byIcon;
-(JobsRetLZTabBarItemByStrBlock _Nonnull)byTitle;
-(JobsRetLZTabBarItemByCorBlock _Nonnull)byTitleColor;
-(JobsRetLZTabBarItemByTypeBlock _Nonnull)byType;
-(JobsRetLZTabBarItemByDelegateBlock _Nonnull)byDelegate;

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
