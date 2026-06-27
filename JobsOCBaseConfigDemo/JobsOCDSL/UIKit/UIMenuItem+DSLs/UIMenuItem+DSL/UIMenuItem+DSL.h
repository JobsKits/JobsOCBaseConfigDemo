//
//  UIMenuItem+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UIMENUITEM_DSL_8C63D2A14E
#define JOBS_HEADER_GUARD_UIMENUITEM_DSL_8C63D2A14E

#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
/// 判断指定 action 是否为 UIMenuItem+DSL 内部通过 block 自动注册的菜单事件。
/// 业务层可在 canPerformAction:withSender: 中调用，避免直接书写 @selector(...)。
FOUNDATION_EXPORT BOOL JobsUIMenuItemCanPerformAction(SEL _Nullable action);

@interface UIMenuItem (DSL)

#pragma mark —— Make
+(JobsRetMenuItemByVoidBlock _Nonnull)byMenuItem;
+(JobsRetMenuItemByStringBlock _Nonnull)byTitle;

#pragma mark —— Properties
-(JobsRetMenuItemByStringBlock _Nonnull)byTitle;
-(JobsRetMenuItemBySELBlock _Nonnull)byAction;

#pragma mark —— Block Action
/// 使用 block 绑定 UIMenuItem action，避免业务侧直接写 @selector(...)。
/// 内部会为当前 UIMenuItem 生成唯一 selector，并通过 UIResponder 动态分发执行 block。
-(JobsRetMenuItemByMenuItemBlock _Nonnull)byActionBlock;

@end

#pragma clang diagnostic pop

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIMENUITEM_DSL_8C63D2A14E */
