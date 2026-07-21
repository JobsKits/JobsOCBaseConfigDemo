//
//  JobsSystemRefreshView.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsSystemRefreshView.h"

@interface JobsSystemRefreshView ()

Prop_strong()UIActivityIndicatorView *indicatorView;

@end


@implementation JobsSystemRefreshView
+(__kindof JobsSystemRefreshView *)refreshView {
    return JobsSystemRefreshView.alloc.init;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _indicatorSize = CGSizeMake(20, 20);
        self.byUserInteractionEnabled(NO);
        self.indicatorView.addOn(self);
    };return self;
}

-(instancetype)byIndicatorSize:(CGSize)indicatorSize {
    self.indicatorSize = CGSizeMake(MAX(1, indicatorSize.width),
                                    MAX(1, indicatorSize.height));
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
    return self;
}

-(CGSize)intrinsicContentSize {
    return self.indicatorSize;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.indicatorView.byFrame(self.bounds);
}

#pragma mark —— JobsRefreshAnimatorProtocol
-(UIView *)refreshAnimatorView {
    return self;
}

-(CGSize)refreshAnimatorPreferredSize {
    return self.indicatorSize;
}

-(void)refreshAnimatorApplyPhase:(JobsRefreshAnimatorPhase)phase
                        progress:(CGFloat)progress {
    BOOL refreshing = phase == JobsRefreshAnimatorPhaseRefreshing;
    refreshing ? self.indicatorView.byStartAnimating() : self.indicatorView.byStopAnimating();
    self.byAlpha(refreshing ? 1 : 0);
}

#pragma mark —— LazyLoad
-(UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        UIActivityIndicatorViewStyle style = UIActivityIndicatorViewStyleGray;
        if (@available(iOS 13.0, *)) {
            style = UIActivityIndicatorViewStyleMedium;
        }
        _indicatorView = UIActivityIndicatorView.byActivityIndicatorViewWithStyle(style)
            .byHidesWhenStopped(YES);
    };return _indicatorView;
}

@end
