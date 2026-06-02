//
//  JXCategoryCollectionView.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryCollectionView.h"

@implementation JXCategoryCollectionView

- (void)setIndicators:(NSArray<UIView<JXCategoryIndicatorProtocol> *> *)indicators {
    for (UIView *indicator in _indicators) {
        //先移除之前的indicator
        [indicator removeFromSuperview];
    }

    _indicators = indicators;

    for (UIView *indicator in indicators) {
        [self addSubview:indicator];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    for (UIView<JXCategoryIndicatorProtocol> *view in self.indicators) {
        [self sendSubviewToBack:view];
    }
}

@end
