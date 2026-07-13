//
//  JobsSideDrawer.m
//  JobsViewPush
//
//  Created by Jobs on 2026年7月12日，星期日.
//

#import "JobsSideDrawer.h"

@implementation JobsSideDrawerConfiguration

-(instancetype)init{
    if (self = [super init]) {
        _direction = JobsSideDrawerDirectionLeft;
        _contentMode = JobsSideDrawerContentModeFollowing;
        _presentedRatio = 0.5;
        _animationDuration = 0.28;
        _dimColor = [UIColor.blackColor colorWithAlphaComponent:0.35];
    };return self;
}

@end

@interface JobsSideDrawer ()

@property(nonatomic,weak)UIView *hostView;
@property(nonatomic,strong)UIView *drawerView;
@property(nonatomic,weak)UIView *contentView;
@property(nonatomic,strong)UIControl *dimControl;
@property(nonatomic,strong,readwrite)JobsSideDrawerConfiguration *configuration;
@property(nonatomic,assign,readwrite,getter=isOpen)BOOL open;

@end


@implementation JobsSideDrawer

-(instancetype)initWithHostView:(UIView *)hostView
                     drawerView:(UIView *)drawerView
                    contentView:(UIView *)contentView
                  configuration:(JobsSideDrawerConfiguration *)configuration{
    if (self = [super init]) {
        _hostView = hostView;
        _drawerView = drawerView;
        _contentView = contentView;
        _configuration = configuration;
        _configuration.presentedRatio = MAX(0.1, MIN(1, configuration.presentedRatio));
        _dimControl = [UIControl new];
        _dimControl.backgroundColor = configuration.dimColor;
        _dimControl.alpha = 0;
        _dimControl.hidden = YES;
        [_dimControl addTarget:self action:@selector(closeFromDim) forControlEvents:UIControlEventTouchUpInside];
        [hostView insertSubview:drawerView belowSubview:contentView];
        [contentView addSubview:_dimControl];
        [self updateLayout];
    };return self;
}

-(void)updateLayout{
    UIView *hostView = self.hostView;
    if (!hostView) return;
    CGRect bounds = hostView.bounds;
    BOOL horizontal = self.configuration.direction == JobsSideDrawerDirectionLeft || self.configuration.direction == JobsSideDrawerDirectionRight;
    CGFloat distance = (horizontal ? CGRectGetWidth(bounds) : CGRectGetHeight(bounds)) * self.configuration.presentedRatio;
    CGRect shownFrame = bounds;
    if (horizontal) shownFrame.size.width = distance;
    else shownFrame.size.height = distance;
    if (self.configuration.direction == JobsSideDrawerDirectionRight) shownFrame.origin.x = CGRectGetWidth(bounds) - distance;
    if (self.configuration.direction == JobsSideDrawerDirectionBottom) shownFrame.origin.y = CGRectGetHeight(bounds) - distance;
    CGRect hiddenFrame = shownFrame;
    if (self.configuration.direction == JobsSideDrawerDirectionLeft) hiddenFrame.origin.x = -distance;
    if (self.configuration.direction == JobsSideDrawerDirectionRight) hiddenFrame.origin.x = CGRectGetWidth(bounds);
    if (self.configuration.direction == JobsSideDrawerDirectionTop) hiddenFrame.origin.y = -distance;
    if (self.configuration.direction == JobsSideDrawerDirectionBottom) hiddenFrame.origin.y = CGRectGetHeight(bounds);
    self.drawerView.frame = self.isOpen ? shownFrame : hiddenFrame;
    if (self.isOpen && self.configuration.contentMode == JobsSideDrawerContentModeFixed) {
        [hostView bringSubviewToFront:self.drawerView];
    }else{
        [hostView bringSubviewToFront:self.contentView];
    }
    self.dimControl.frame = self.contentView.bounds;
    self.dimControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.contentView.layer.transform = CATransform3DMakeAffineTransform([self contentTransformWithDistance:distance]);
}

-(CGAffineTransform)contentTransformWithDistance:(CGFloat)distance{
    if (!self.isOpen || self.configuration.contentMode == JobsSideDrawerContentModeFixed) return CGAffineTransformIdentity;
    switch (self.configuration.direction) {
        case JobsSideDrawerDirectionTop: return CGAffineTransformMakeTranslation(0, distance);
        case JobsSideDrawerDirectionBottom: return CGAffineTransformMakeTranslation(0, -distance);
        case JobsSideDrawerDirectionRight: return CGAffineTransformMakeTranslation(-distance, 0);
        case JobsSideDrawerDirectionLeft: return CGAffineTransformMakeTranslation(distance, 0);
    }
}

-(void)applyConfigurationAnimated:(BOOL)animated{
    self.configuration.presentedRatio = MAX(0.1, MIN(1, self.configuration.presentedRatio));
    self.dimControl.backgroundColor = self.configuration.dimColor;
    [self setOpen:self.isOpen animated:animated];
}

-(void)toggleAnimated:(BOOL)animated{
    [self setOpen:!self.isOpen animated:animated];
}

-(void)openAnimated:(BOOL)animated{
    [self setOpen:YES animated:animated];
}

-(void)closeAnimated:(BOOL)animated{
    [self setOpen:NO animated:animated];
}

-(void)setOpen:(BOOL)open animated:(BOOL)animated{
    _open = open;
    if (open) self.dimControl.hidden = NO;
    void (^changes)(void) = ^{
        [self updateLayout];
        self.dimControl.alpha = open ? 1 : 0;
    };
    void (^completion)(BOOL) = ^(BOOL finished) {
        if (!open) self.dimControl.hidden = YES;
        if (self.stateChanged) self.stateChanged(open);
    };
    if (!animated) {
        changes();
        completion(YES);
        return;
    }
    [UIView animateWithDuration:self.configuration.animationDuration
                          delay:0
         usingSpringWithDamping:0.92
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction
                     animations:changes
                     completion:completion];
}

-(void)invalidate{
    [self.drawerView removeFromSuperview];
    [self.dimControl removeFromSuperview];
    self.contentView.layer.transform = CATransform3DIdentity;
}

-(void)closeFromDim{
    [self closeAnimated:YES];
}

@end
