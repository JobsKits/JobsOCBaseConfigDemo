//
//  JXCategoryIndicatorComponentView.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryIndicatorComponentView.h"

@implementation JXCategoryIndicatorComponentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _componentPosition = JXCategoryComponentPosition_Bottom;
        _scrollEnabled = YES;
        _verticalMargin = 0;
        _scrollAnimationDuration = 0.25;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSAssert(NO, @"Use initWithFrame");
    }
    return self;
}

#pragma mark - JXCategoryIndicatorProtocol

- (void)jx_refreshState:(JXCategoryIndicatorParamsModel *)model {

}

- (void)jx_contentScrollViewDidScroll:(JXCategoryIndicatorParamsModel *)model {

}

- (void)jx_selectedCell:(JXCategoryIndicatorParamsModel *)model {
    
}

@end
