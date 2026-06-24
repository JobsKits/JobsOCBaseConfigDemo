//
//  UIView+MasonryDSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "UIView+MasonryDSL.h"

@implementation UIView (MasonryDSL)
#pragma mark —— 不记录约束，直接修改/赋值
/// 添加子视图到父视图 + 加载约束（不记录） +刷新UI
-(JobsRetViewBySuperviewMasonryBlock _Nonnull)byAddTo{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nonnull superview, jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        if (superview && self.superview != superview){
            [superview addSubview:self];
        }
        if (block){
            [self mas_makeConstraints:block];
            self.refresh();
        };return self;
    };
}
/// 对系统API mas_makeConstraints 的二次封装
-(JobsRetViewByMasonryConstraintsBlock _Nonnull)byOn{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        if (block){
            [self mas_makeConstraints:block];
        };return self;
    };
}
/// 对系统API mas_updateConstraints 的二次封装
-(JobsRetViewByMasonryConstraintsBlock _Nonnull)byUpdate{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        if (block){
            [self mas_updateConstraints:block];
        };return self;
    };
}
/// 对系统API mas_remakeConstraints 的二次封装
-(JobsRetViewByMasonryConstraintsBlock _Nonnull)byRemake{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        if (block){
            [self mas_remakeConstraints:block];
        };return self;
    };
}
/// 对系统API mas_remakeConstraints 的二次封装：将空约束配置进UI == 清空约束
-(JobsRetIDByVoidBlock _Nonnull)byRemove{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void){
        @jobs_strongify(self)
        self.byRemake(^(MASConstraintMaker *make){});
        return self;
    };
}
#pragma mark —— 记录约束，并修改/赋值
/// 添加约束并刷新UI
-(JobsRetViewByViewBlock _Nonnull)addSubview{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView) {
        @jobs_strongify(self)
        if(!subView) return nil;
        [self addSubview:subView];
        if(subView.masonryBlock){
            [subView mas_makeConstraints:subView.masonryBlock];
            self.refresh();
        };return subView;
    };
}
/// 挂载约束到本地属性 + 执行 mas_makeConstraints +刷新UI
-(JobsRetViewByMasonryConstraintsBlocks _Nonnull)byAdd{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.setMasonryBy(block).on();
        return self;
    };
}
/// 含义：添加新的约束
/// 适用场景：第一次为视图添加约束
/// 行为：不会影响已有约束；不会自动删除或更新已存在的约束
-(JobsRetViewByVoidBlock _Nonnull)on{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(){
        @jobs_strongify(self)
        if (self.masonryBlock){
            [self mas_makeConstraints:self.masonryBlock];
        }
        self.refresh();
        return self;
    };
}
/// 刷新UI
-(JobsRetViewByVoidBlock _Nonnull)refresh{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void){
        @jobs_strongify(self)
        [self setNeedsLayout];
        [self layoutIfNeeded];
        return self;
    };
}
/// 挂载约束到本地属性记录
-(JobsRetViewByMasonryConstraintsBlocks _Nonnull)setMasonryBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block){
        @jobs_strongify(self)
        self.masonryBlock = block;
        return self;
    };
}
#pragma mark —— 卸载约束
/// 卸载当前view上的某个方向的约束
-(JobsRetViewByNSLayoutAttributeBlock _Nonnull)uninstall{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(NSLayoutAttribute layoutAttribute) {
        @jobs_strongify(self)
        for (MASViewConstraint *constraint in [MASViewConstraint installedConstraintsForView:self]) {
            if (constraint.firstViewAttribute.layoutAttribute == layoutAttribute) {
                [constraint uninstall];
            }
        };return self;
    };
}
/// 卸载当前view上的全部约束
-(JobsRetViewByVoidBlock _Nonnull)uninstallAllLayoutAttribute{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void) {
        @jobs_strongify(self)
        for (MASViewConstraint *constraint in [MASViewConstraint installedConstraintsForView:self]) {
            [constraint uninstall];
        };return self;
    };
}
#pragma mark —— Masonry约束动画
/// 是一个用于执行 两个阶段动画布局切换 的自定义封装，常用于需要分两次改变布局的 UI 动效
/// - Parameters:
///   - masonryBeforeBlock: 最初的约束
///   - masonryAfterBlock: 希望变到的最后的约束
-(void)jobsMasonryBeforeBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryBeforeBlock
            masonryAfterBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryAfterBlock{
    [self uninstallAllLayoutAttribute];
    if(masonryBeforeBlock) [self mas_remakeConstraints:masonryBeforeBlock];
    // 告诉视图需要更新布局
    [self.superview setNeedsUpdateConstraints];
    // 执行动画
    @jobs_weakify(self)
    [UIView animateWithDuration:0.5
                     animations:^{
        @jobs_strongify(self)
        [self.superview layoutIfNeeded]; // 让视图更新布局
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        // 在动画完成后，切换到第二个 _view2 的约束
        if(masonryAfterBlock) [self mas_remakeConstraints:masonryAfterBlock];
        // 再次告诉视图需要更新布局
        [self.superview setNeedsUpdateConstraints];
        // 再次执行动画
        @jobs_weakify(self)
        [UIView animateWithDuration:0.5
                         animations:^{
            @jobs_strongify(self)
            [self.superview layoutIfNeeded]; // 让视图更新布局
        }];
    }];
}
#pragma mark —— Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;
JobsKey(_masonryBlock)
@dynamic masonryBlock;
-(jobsByMASConstraintMakerBlock)masonryBlock{
    return Jobs_getAssociatedObject(_masonryBlock);
}

-(void)setMasonryBlock:(jobsByMASConstraintMakerBlock)masonryBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_masonryBlock, masonryBlock)
}

@end
