//
//  LZTabBar.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LZTabBar.h"

@interface LZTabBar ()

Prop_strong()UIVisualEffectView *effectView;
Prop_strong()UIView *topLine;

@end

@implementation LZTabBar
-(JobsRetLZTabBarByItemsBlock _Nonnull)byItems{
    @jobs_weakify(self)
    return ^__kindof LZTabBar *_Nullable(NSArray<LZTabBarItem *> *_Nullable data){
        @jobs_strongify(self)
        self.items = data;
        return self;
    };
}
-(JobsRetLZTabBarByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof LZTabBar *_Nullable(id<LZTabBarDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}
- (instancetype)init {
    if (self = [super init]) {
    };return self;
}

- (void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LZTabBar.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.effectView.byFrame(self.bounds);
        self.setupItems();
        self.topLine.byFrame(CGRectMake(0, 0, CGRectGetWidth(self.frame), 0.6));
    };
}

- (jobsByVoidBlock _Nonnull)setupItems {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat width = CGRectGetWidth(self.frame)/self.items.count;
        CGFloat height = CGRectGetHeight(self.frame);
        for (int i = 0; i < self.items.count; i++) {
            LZTabBarItem *item = [self.items objectAtIndex:i];
            item.byFrame(CGRectMake(i*width, 0, width, height));
            item.addOn(self);
            item.byDelegate(self);
        }
    };
}
#pragma mark —— LZTabBarDelegate
- (void)tabBarItem:(LZTabBarItem *)item
    didSelectIndex:(NSInteger)index {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:didSelectItem:atIndex:)]) {
        [self.delegate tabBar:self
                didSelectItem:item
                      atIndex:index];
    }
}

- (UIView *)topLine {
    if (!_topLine) {
        _topLine = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsSeparatorColor)
                .addOn(self);
        });
    };return _topLine;
}

- (UIVisualEffectView *)effectView {
    if (!_effectView) {
        UIBlurEffectStyle effectStyle = UIBlurEffectStyleLight;
        if (@available(iOS 13.0, *)) effectStyle = UIBlurEffectStyleSystemMaterial;
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:effectStyle];
        _effectView = [UIVisualEffectView.alloc initWithEffect:effect];
        _effectView.byAlpha(1.0);
        _effectView.addOn(self);
    };return _effectView;
}

@end
