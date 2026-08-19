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
+(JobsRetJobsSystemRefreshViewByVoidBlock _Nonnull)refreshView {
    return ^__kindof JobsSystemRefreshView *{
        return JobsSystemRefreshView.alloc.init;
    };
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _indicatorSize = CGSizeMake(20, 20);
        self.byUserInteractionEnabled(NO);
        self.indicatorView.addOn(self);
    };return self;
}

-(JobsRetIDByCGSizeBlock _Nonnull)byIndicatorSize{
    @jobs_weakify(self)
    return ^id(CGSize indicatorSize){
        @jobs_strongify(self)
        if (!self) return nil;
        self.indicatorSize = CGSizeMake(MAX(1, indicatorSize.width),
                                        MAX(1, indicatorSize.height));
        [self invalidateIntrinsicContentSize];
        [self setNeedsLayout];
        return self;
    };
}

-(CGSize)intrinsicContentSize {
    JobsRetCGSizeByVoidBlock action = ((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSystemRefreshView.class, @selector(jobsIntrinsicContentSize)))(self, @selector(jobsIntrinsicContentSize));
    return action ? action() : (CGSize){0};
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIntrinsicContentSize{
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return self.indicatorSize;
    };
}

-(void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSystemRefreshView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.indicatorView.byFrame(self.bounds);
    };
}

#pragma mark —— JobsRefreshAnimatorProtocol
-(JobsRetViewByVoidBlock _Nonnull)refreshAnimatorView {
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self;
    };
}

-(JobsRetCGSizeByVoidBlock _Nonnull)refreshAnimatorPreferredSize {
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return self.indicatorSize;
    };
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
