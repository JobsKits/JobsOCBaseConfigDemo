//
//  JobsLinkageMenuViewConfig.h
//  JobsLinkageMenuView
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#ifndef JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEWCONFIG_335BF6DCAD
#define JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEWCONFIG_335BF6DCAD

#import <Foundation/Foundation.h>

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

@interface JobsLinkageMenuViewConfig : NSObject

Prop_assign()CGFloat MENU_WIDTH;                    // 左侧菜单栏固定宽度，优先级最高
Prop_assign()CGFloat CONTENT_WIDTH;                 // 右侧内容区固定宽度，剩余宽度给菜单栏
Prop_assign()CGFloat MENU_RATIO;                    // 左侧菜单栏占整体宽度比例，0~1 生效
Prop_assign()CGFloat BOTTOMVIEW_HEIGHT;             // 滑块高度
Prop_assign()CGFloat BOTTOMVIEW_WIDTH;              // 滑块宽度
Prop_assign()CGFloat LINEVIEW_WIDTH;                // 分割线宽度
Prop_assign()CGFloat ANIMATION_TIME;                // 菜单栏滚动的时间
Prop_assign()CGFloat DEFAULT_MENU_ITEM_HEIGHT;      // 统一菜单子项高度
Prop_assign()CGFloat MENU_ITEM_CORNER_RADIUS;       // 菜单子项圆角，0 为直角
Prop_strong(nullable)NSArray<NSNumber *> *MENU_ITEM_HEIGHTS;             // 按数组下标单独配置高度
Prop_strong(nullable)NSDictionary<NSNumber *, NSNumber *> *MENU_ITEM_HEIGHT_MAP; // 按菜单下标覆盖高度
Prop_assign()BOOL CLEAR_CONTENT_WHEN_MISSING;       // 菜单无内容时是否清空右侧区域
Prop_copy(nullable)jobsByIDBlock menuClickBlock;    // 任意菜单点击回调，payload 为 NSDictionary
Prop_copy(nullable)jobsByIDBlock noContentClickBlock; // 菜单无内容时回调，payload 为 NSDictionary

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEWCONFIG_335BF6DCAD */
