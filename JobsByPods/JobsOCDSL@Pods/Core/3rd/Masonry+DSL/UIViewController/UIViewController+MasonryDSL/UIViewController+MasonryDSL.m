//
//  UIViewController+MasonryDSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月9日，星期二.
//

#import "UIViewController+MasonryDSL.h"

static inline void vcAddSubview(__kindof UIViewController *_Nullable viewController,
                                __kindof UIView *_Nullable subView){
    if(!viewController || !subView) return;
    if(![viewController.view.subviews containsObject:subView]){
        [viewController.view addSubview:subView];
    }
}

static inline void refreshVCView(__kindof UIView *_Nullable view){
    if(!view) return;
    [view setNeedsLayout];
    [view layoutIfNeeded];
}

static inline void UninstallAllConstraints(__kindof UIView *_Nullable view){
    if(!view) return;
    for (MASViewConstraint *constraint in [MASViewConstraint installedConstraintsForView:view]) {
        [constraint uninstall];
    }
}

@implementation UIViewController (MasonryDSL)
#pragma mark —— 不记录约束，直接修改/赋值
/// 判断当前控制器 view 是否已经包含目标子视图
-(JobsRetBOOLByViewBlock _Nonnull)containBy{
    @jobs_weakify(self)
    return ^BOOL(__kindof UIView *_Nullable subView){
        @jobs_strongify(self)
        if(!subView) return NO;
        return [self.view.subviews containsObject:subView];
    };
}
/// 添加子视图到 self.view + 执行 mas_makeConstraints（不记录） + 刷新 UI
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byMakeConstraints{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView,jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        if(!subView) return nil;
        vcAddSubview(self, subView);
        if(block){
            [subView mas_makeConstraints:block];
        }
        refreshVCView(self.view);
        return subView;
    };
}
/// 添加子视图到 self.view + 执行 mas_updateConstraints（不记录） + 刷新 UI
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byUpdateConstraints{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView,jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        if(!subView) return nil;
        vcAddSubview(self, subView);
        if(block){
            [subView mas_updateConstraints:block];
        }
        refreshVCView(self.view);
        return subView;
    };
}
/// 添加子视图到 self.view + 执行 mas_remakeConstraints（不记录） + 刷新 UI
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byRemake{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView,jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        if(!subView) return nil;
        vcAddSubview(self, subView);
        if(block){
            [subView mas_remakeConstraints:block];
        }
        refreshVCView(self.view);
        return subView;
    };
}
/// 卸载指定子视图上的全部 Masonry 约束 + 刷新 UI
-(JobsRetViewByViewBlock _Nonnull)byRemove{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView){
        @jobs_strongify(self)
        if(!subView) return nil;
        UninstallAllConstraints(subView);
        refreshVCView(self.view);
        return subView;
    };
}
#pragma mark —— 记录约束，并修改/赋值
/// 挂载约束到本地属性记录
-(JobsRetVCByMasonryConstraintsBlocks _Nonnull)setMasonryBy{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.masonryBlock = block;
        return self;
    };
}
/// 含义：添加新的约束
/// 适用场景：第一次为视图添加约束
/// 行为：不会影响已有约束；不会自动删除或更新已存在的约束
-(JobsRetViewByViewBlock _Nonnull)on{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView){
        @jobs_strongify(self)
        if(!subView) return nil;
        vcAddSubview(self, subView);
        if(self.masonryBlock){
            [subView mas_makeConstraints:self.masonryBlock];
        }
        refreshVCView(self.view);
        return subView;
    };
}
/// 含义：更新已有的约束
/// 适用场景：已经添加过约束，需要修改某些数值
/// 行为：只会更新匹配的已有约束；不会新建或移除不相关的约束
-(JobsRetViewByViewBlock _Nonnull)upgrade{
    return self.update;
}

/// 兼容 upgrade API，保留 update 入口
-(JobsRetViewByViewBlock _Nonnull)update{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView){
        @jobs_strongify(self)
        if(!subView) return nil;
        vcAddSubview(self, subView);
        if(self.masonryBlock){
            [subView mas_updateConstraints:self.masonryBlock];
        }
        refreshVCView(self.view);
        return subView;
    };
}
/// 含义：先移除旧的所有约束，再添加新的
/// 适用场景：布局逻辑发生了变化，原有约束不再适用
/// 行为：会移除视图上所有 Masonry 创建的约束，再应用 block 中的新约束
-(JobsRetViewByViewBlock _Nonnull)remake{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView){
        @jobs_strongify(self)
        if(!subView) return nil;
        vcAddSubview(self, subView);
        if(self.masonryBlock){
            [subView mas_remakeConstraints:self.masonryBlock];
        }
        refreshVCView(self.view);
        return subView;
    };
}
/// 挂载约束到本地属性 + 执行 mas_makeConstraints + 刷新 UI
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byAdd{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView,jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.setMasonryBy(block).on(subView);
        return subView;
    };
}
/// 挂载约束到本地属性 + 执行 mas_updateConstraints + 刷新 UI
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byUpgrade{
    return self.byUpdate;
}
/// 兼容 byUpgrade API，保留 byUpdate 入口
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byUpdate{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView,jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.setMasonryBy(block).update(subView);
        return subView;
    };
}
/// 挂载约束到本地属性 + 执行 mas_remakeConstraints + 刷新 UI
-(JobsRetViewByViewAndMasonryConstraintsBlocks _Nonnull)byRemakes{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView,jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.setMasonryBy(block).remake(subView);
        return subView;
    };
}
#pragma mark —— 卸载约束
/// 卸载当前控制器 view 上的某个方向的约束
-(JobsRetVCByNSLayoutAttributeBlock _Nonnull)uninstall{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(NSLayoutAttribute layoutAttribute){
        @jobs_strongify(self)
        for (MASViewConstraint *constraint in [MASViewConstraint installedConstraintsForView:self.view]) {
            if (constraint.firstViewAttribute.layoutAttribute == layoutAttribute) {
                [constraint uninstall];
            }
        };return self;
    };
}
/// 卸载当前控制器 view 上的全部约束
-(JobsRetVCByVoidBlock _Nonnull)uninstallAllLayoutAttribute{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(void){
        @jobs_strongify(self)
        UninstallAllConstraints(self.view);
        return self;
    };
}
#pragma mark —— Masonry约束动画
/// 是一个用于执行 两个阶段动画布局切换 的自定义封装，常用于需要分两次改变布局的 UI 动效
/// - Parameters:
///   - masonryBeforeBlock: 最初的约束
///   - masonryAfterBlock: 希望变到的最后的约束
-(void)jobsMasonryBeforeBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryBeforeBlock
            masonryAfterBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryAfterBlock{
    self.uninstallAllLayoutAttribute();
    if(masonryBeforeBlock) [self.view mas_remakeConstraints:masonryBeforeBlock];
    /// 告诉视图需要更新布局
    [self.view setNeedsUpdateConstraints];
    /// 执行动画
    @jobs_weakify(self)
    [UIView animateWithDuration:0.5
                     animations:^{
        @jobs_strongify(self)
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        /// 在动画完成后，切换到第二个 _view2 的约束
        if(masonryAfterBlock){
            [self.view mas_remakeConstraints:masonryAfterBlock];
        }
        /// 再次告诉视图需要更新布局
        [self.view setNeedsUpdateConstraints];
        /// 再次执行动画
        @jobs_weakify(self)
        [UIView animateWithDuration:0.5
                         animations:^{
            @jobs_strongify(self)
            [self.view layoutIfNeeded];
        }];
    }];
}
#pragma mark —— Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;
JobsKey(_masonryBlock)
@dynamic masonryBlock;
-(jobsByMASConstraintMakerBlock _Nullable)masonryBlock{
    return Jobs_getAssociatedObject(_masonryBlock);
}

-(void)setMasonryBlock:(jobsByMASConstraintMakerBlock)masonryBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_masonryBlock, masonryBlock)
}

@end
