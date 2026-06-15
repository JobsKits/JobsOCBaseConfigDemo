//
//  UIViewController+MasonryDSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月9日，星期二.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_MASONRY_DSL_8B5C1F2A91
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_MASONRY_DSL_8B5C1F2A91

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MasonryDSL)

Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;
#pragma mark —— 不记录约束，直接修改/赋值
/// 判断当前控制器 view 是否已经包含目标子视图
-(JobsRetBOOLByViewBlock _Nonnull)containBy;
/// 添加子视图到 self.view + 执行 mas_makeConstraints（不记录） + 刷新 UI
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byMakeConstraints;
/// 添加子视图到 self.view + 执行 mas_updateConstraints（不记录） + 刷新 UI
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byUpdateConstraints;
/// 添加子视图到 self.view + 执行 mas_remakeConstraints（不记录） + 刷新 UI
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byRemake;
/// 卸载指定子视图上的全部 Masonry 约束 + 刷新 UI
-(JobsRetViewByViewBlock _Nonnull)byRemove;
#pragma mark —— 记录约束，并修改/赋值
/// 挂载约束到本地属性记录
-(JobsRetVCByMasonryConstraintsBlocks _Nonnull)setMasonryBy;
/// 含义：添加新的约束
/// 适用场景：第一次为视图添加约束
/// 行为：不会影响已有约束；不会自动删除或更新已存在的约束
-(JobsRetViewByViewBlock _Nonnull)on;
/// 含义：更新已有的约束
/// 适用场景：已经添加过约束，需要修改某些数值
/// 行为：只会更新匹配的已有约束；不会新建或移除不相关的约束
-(JobsRetViewByViewBlock _Nonnull)upgrade;
/// 兼容别名：update 与 upgrade 同义
-(JobsRetViewByViewBlock _Nonnull)update;
/// 含义：先移除旧的所有约束，再添加新的
/// 适用场景：布局逻辑发生了变化，原有约束不再适用
/// 行为：会移除视图上所有 Masonry 创建的约束，再应用 block 中的新约束
-(JobsRetViewByViewBlock _Nonnull)remake;
/// 挂载约束到本地属性 + 执行 mas_makeConstraints + 刷新 UI
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byAdd;
/// 挂载约束到本地属性 + 执行 mas_updateConstraints + 刷新 UI
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byUpgrade;
/// 兼容别名：byUpdate 与 byUpgrade 同义
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byUpdate;
/// 挂载约束到本地属性 + 执行 mas_remakeConstraints + 刷新 UI
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byRemake;
/// 兼容别名：保留原有 byRemakes 实现名
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byRemakes;
#pragma mark —— 卸载约束
/// 卸载当前控制器 view 上的某个方向的约束
-(JobsRetVCByNSLayoutAttributeBlock _Nonnull)uninstall;
/// 卸载当前控制器 view 上的全部约束
-(JobsRetVCByVoidBlock _Nonnull)uninstallAllLayoutAttribute;
#pragma mark —— Masonry约束动画
/// 是一个用于执行 两个阶段动画布局切换 的自定义封装，常用于需要分两次改变布局的 UI 动效
/// - Parameters:
///   - masonryBeforeBlock: 最初的约束
///   - masonryAfterBlock: 希望变到的最后的约束
-(void)jobsMasonryBeforeBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryBeforeBlock
            masonryAfterBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryAfterBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_MASONRY_DSL_8B5C1F2A91 */
