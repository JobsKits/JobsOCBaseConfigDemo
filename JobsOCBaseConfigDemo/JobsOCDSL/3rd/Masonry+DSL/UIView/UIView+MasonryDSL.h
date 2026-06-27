//
//  UIView+MasonryDSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_MASONRY_DSL_4F3D9F6D5D
#define JOBS_HEADER_GUARD_UIVIEW_MASONRY_DSL_4F3D9F6D5D

#import <UIKit/UIKit.h>
#import "UIView+DSL.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MasonryDSL)

Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;
#pragma mark —— 不记录约束，直接修改/赋值
/// 添加子视图到父视图 + 加载约束（不记录） +刷新UI
-(JobsRetViewBySuperviewMasonryBlock _Nonnull)byAddTo;
/// 对系统API mas_makeConstraints 的二次封装
-(JobsRetViewByMasonryConstraintsBlock _Nonnull)byOn;
/// 对系统API mas_updateConstraints 的二次封装
-(JobsRetViewByMasonryConstraintsBlock _Nonnull)byUpdate;
/// 对系统API mas_remakeConstraints 的二次封装
-(JobsRetViewByMasonryConstraintsBlock _Nonnull)byRemake;
/// 对系统API mas_remakeConstraints 的二次封装：将空约束配置进UI == 清空约束
-(JobsRetIDByVoidBlock _Nonnull)byRemove;
#pragma mark —— 记录约束，并修改/赋值
/// 添加约束并刷新UI
-(JobsRetViewByViewBlock _Nonnull)addSubview;
/// 挂载约束到本地属性 + 执行 mas_makeConstraints +刷新UI
-(JobsRetViewByMasonryConstraintsBlocks _Nonnull)byAdd;
/// 含义：添加新的约束
/// 适用场景：第一次为视图添加约束
/// 行为：不会影响已有约束；不会自动删除或更新已存在的约束
-(JobsRetViewByVoidBlock _Nonnull)on;
/// 刷新UI
-(JobsRetViewByVoidBlock _Nonnull)refresh;
/// 挂载约束到本地属性记录
-(JobsRetViewByMasonryConstraintsBlocks _Nonnull)setMasonryBy;
#pragma mark —— 卸载约束
/// 卸载当前view上的某个方向的约束
-(JobsRetViewByNSLayoutAttributeBlock _Nonnull)uninstall;
/// 卸载当前view上的全部约束
-(JobsRetViewByVoidBlock _Nonnull)uninstallAllLayoutAttribute;
#pragma mark —— Masonry约束动画
/// 是一个用于执行 两个阶段动画布局切换 的自定义封装，常用于需要分两次改变布局的 UI 动效
/// - Parameters:
///   - masonryBeforeBlock: 最初的约束
///   - masonryAfterBlock: 希望变到的最后的约束
-(void)jobsMasonryBeforeBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryBeforeBlock
            masonryAfterBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryAfterBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_MASONRY_DSL_4F3D9F6D5D */
