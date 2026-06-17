//
//  ASButtonNode+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ASBUTTONNODE_DSL_B84AAEA0DD
#define JOBS_HEADER_GUARD_ASBUTTONNODE_DSL_B84AAEA0DD

#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

#if __has_include(<AsyncDisplayKit/AsyncDisplayKit.h>)
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#else
#import "AsyncDisplayKit.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// ASButtonNode 链式 DSL（节选：标题/图片/边距/圆角/事件）
@interface ASButtonNode (DSL)

-(JobsRetButtonNodeByTitleConfigBlock _Nonnull)byTitle;
-(JobsRetButtonNodeImageByConfigBlock _Nonnull)byImage;
-(JobsRetButtonNodeByHitTestSlopBlock _Nonnull)byContentEdgeInsets;
-(JobsRetButtonNodeByBackgroundColorsBlock _Nonnull)byBackgroundColor;
-(JobsRetButtonNodeByCornerRadiusBlock _Nonnull)byCornerRadius;
-(JobsRetButtonNodeByHitTestSlopBlock _Nonnull)byHitTestSlop;
/// 短按（点击）封装
-(JobsRetButtonNodeByOnClickBlock _Nonnull)onClickBy;
/// 长按封装（默认 & 自定义）
-(JobsRetButtonNodeByOnLongPressBlock _Nonnull)onLongPressGestureBy;
-(JobsRetButtonNodeByOnLongPressWithTimeBlock _Nonnull)onLongPressGestureWith;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ASBUTTONNODE_DSL_B84AAEA0DD */
