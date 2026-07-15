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
- (instancetype)init {
    if (self = [super init]) {
    };return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.effectView.byFrame(self.bounds);
    [self setupItems];
    self.topLine.byFrame(CGRectMake(0, 0, CGRectGetWidth(self.frame), 0.6));
}

- (void)setupItems {
    CGFloat width = CGRectGetWidth(self.frame)/self.items.count;
    CGFloat height = CGRectGetHeight(self.frame);
    for (int i = 0; i < self.items.count; i++) {
        LZTabBarItem *item = [self.items objectAtIndex:i];
        item.byFrame(CGRectMake(i*width, 0, width, height));
        item.addOn(self);
        item.delegate = self;
    }
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
                .byBgColor(JobsGrayColor)
                .addOn(self);
        });
    };return _topLine;
}

- (UIVisualEffectView *)effectView {
    if (!_effectView) {
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _effectView = [UIVisualEffectView.alloc initWithEffect:effect];
        _effectView.byAlpha(1.0);
        _effectView.addOn(self);
    };return _effectView;
}

@end
