//
//  JobsDebugOverlayVC.m
//  JobsDebugPanel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsDebugOverlayVC.h"
#import "JobsDebugPanelManager.h"

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if DEBUG
@interface JobsDebugOverlayVC ()

Prop_weak()JobsDebugPanelManager *panel;
Prop_weak()UIWindow *hostWindow;
Prop_strong(readwrite)UIButton *button;
Prop_strong()MASConstraint *buttonCenterXConstraint;
Prop_strong()MASConstraint *buttonCenterYConstraint;
Prop_assign()CGPoint buttonCenter;
Prop_assign()CGPoint dragStartCenter;
Prop_assign()BOOL positionInitialized;
Prop_assign()BOOL dragging;

-(jobsByVoidBlock _Nonnull)applyPanelTheme;
-(jobsByVoidBlock _Nonnull)refreshButtonAction;

@end

@implementation JobsDebugOverlayVC

-(instancetype)initWithPanel:(JobsDebugPanelManager *)panel hostWindow:(UIWindow *)window {
    if (self = [super init]) {
        _panel = panel;
        _hostWindow = window;
    }
    return self;
}

-(void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(id, SEL))JobsBlockInstanceMethodIMP(JobsDebugOverlayVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [super viewDidLoad];
        self.view.byBgColor(UIColor.clearColor);
        self.button.byHidden(NO);
        [self addNotificationName:JobsThemeDidChangeNotification block:^(id weakSelf, id note) {
            @jobs_strongify(self)
            if (self) {
                self.applyPanelTheme();
            }
        }];
        [self addNotificationName:JobsDebugPanelVisibilityDidChangeNotification block:^(id weakSelf, id note) {
            @jobs_strongify(self)
            if (self) {
                self.refreshButtonAction();
            }
        }];
        self.applyPanelTheme();
        self.refreshButtonAction();
    };
}

-(jobsByVoidBlock _Nonnull)applyPanelTheme {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (self.isViewLoaded) {
            if (@available(iOS 13.0, *)) {
                self.view.byOverrideUserInterfaceStyle(JobsThemeCenter.shared.isDarkMode ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight);
            }
        }
    };
}

-(jobsByVoidBlock _Nonnull)refreshButtonAction {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self || !self->_button || !self.panel || !self.hostWindow.rootViewController) {
            return;
        }
        BOOL showing = self.panel.isShowingFrom(self.hostWindow.rootViewController);
        self->_button.byAccessibilityLabel(showing ? @"关闭调试工具，返回原页面，可拖动，长按隐藏至下次启动" : @"打开调试工具，可拖动，长按隐藏至下次启动");
    };
}

-(void)viewDidLayoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(id, SEL))JobsBlockInstanceMethodIMP(JobsDebugOverlayVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [super viewDidLayoutSubviews];
        if (!self->_button || !self.view.window || CGRectIsEmpty(self.view.bounds)) {
            return;
        }
        CGPoint center = self.buttonCenter;
        if (!self.positionInitialized) {
            UIEdgeInsets insets = self.hostWindow.safeAreaInsets;
            center = CGPointMake(CGRectGetMaxX(self.view.bounds) - insets.right - 44,
                                 CGRectGetMaxY(self.view.bounds) - insets.bottom - 138);
            self->_positionInitialized = YES;
        }
        [self updateButtonCenter:center];
    };
}

// 使用业务窗口安全区，避免透明高层窗口把按钮放到刘海或 Home indicator 上。
-(CGPoint)clampedButtonCenter:(CGPoint)center {
    CGRect bounds = self.view.bounds;
    UIEdgeInsets insets = self.view.safeAreaInsets;
    UIEdgeInsets hostInsets = self.hostWindow.safeAreaInsets;
    CGFloat minX = CGRectGetMinX(bounds) + MAX(insets.left, hostInsets.left) + 36;
    CGFloat maxX = MAX(minX, CGRectGetMaxX(bounds) - MAX(insets.right, hostInsets.right) - 36);
    CGFloat minY = CGRectGetMinY(bounds) + MAX(insets.top, hostInsets.top) + 36;
    CGFloat maxY = MAX(minY, CGRectGetMaxY(bounds) - MAX(insets.bottom, hostInsets.bottom) - 36);
    return CGPointMake(MIN(MAX(center.x, minX), maxX), MIN(MAX(center.y, minY), maxY));
}

-(void)updateButtonCenter:(CGPoint)center {
    CGPoint clamped = [self clampedButtonCenter:center];
    if (CGPointEqualToPoint(clamped, self.buttonCenter)) {
        return;
    }
    self->_buttonCenter = clamped;
    [self.buttonCenterXConstraint setOffset:clamped.x];
    [self.buttonCenterYConstraint setOffset:clamped.y];
}

-(void)handleButtonPan:(UIPanGestureRecognizer *)gesture {
    switch (gesture.state) {
        /// 记录本次手势起点，不把上一轮 translation 叠加到新位置。
        case UIGestureRecognizerStateBegan:
            self->_dragging = YES;
            self->_dragStartCenter = self.buttonCenter;
            break;
        /// 平移只更新位置约束，系统取消按钮的 touch-up 点击。
        case UIGestureRecognizerStateChanged: {
            CGPoint translation = [gesture translationInView:self.view];
            [self updateButtonCenter:CGPointMake(self.dragStartCenter.x + translation.x,
                                                self.dragStartCenter.y + translation.y)];
            if (self.view.window) {
                [self.view layoutIfNeeded];
            }
            break;
        }
        /// 松手保留本次进程内位置，下一次 run loop 才重新接受点击。
        case UIGestureRecognizerStateEnded:
        /// 旋转或系统取消后同样解除拖动状态。
        case UIGestureRecognizerStateCancelled:
        /// 识别失败不能让按钮长期停留在拖动状态。
        case UIGestureRecognizerStateFailed: {
            @jobs_weakify(self)
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                if (self) {
                    self->_dragging = NO;
                }
            });
            break;
        }
        /// 尚未识别时不改变按钮状态。
        default:
            break;
    }
}

-(UIButton *)button {
    if (!_button) {
        @jobs_weakify(self)
        NSBundle *owner = [NSBundle bundleForClass:self.class];
        NSURL *bundleURL = [owner URLForResource:@"JobsDebugPanelResources" withExtension:@"bundle"];
        NSBundle *resources = bundleURL ? [NSBundle bundleWithURL:bundleURL] : NSBundle.mainBundle;
        UIImage *image = [UIImage imageNamed:@"JobsDebugPanelButton" inBundle:resources compatibleWithTraitCollection:nil];
        _button = BaseButton.jobsInit()
            .jobsResetBtnBgImage(image)
            .jobsResetBtnCornerRadiusValue(28)
            .byAccessibilityLabel(@"打开调试工具，可拖动，长按隐藏至下次启动")
            .onClickBy(^(UIButton *sender) {
                @jobs_strongify(self)
                if (!self.dragging && self.panel && self.hostWindow.rootViewController) {
                    self.panel.toggleFrom(self.hostWindow.rootViewController);
                }
            })
            .onLongPressGestureBy(^(UIButton *sender) {
                @jobs_strongify(self)
                if (!self.dragging && self.panel) {
                    self.panel.hideForCurrentLaunch();
                }
            })
            .byAccessibilityIdentifier(@"JobsDebugPanelButton")
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.width.height.mas_equalTo(56);
                self->_buttonCenterXConstraint = make.centerX.equalTo(self.view.mas_left).offset(0);
                self->_buttonCenterYConstraint = make.centerY.equalTo(self.view.mas_top).offset(0);
            });
        // BaseButton 合成的 panGR 不会惰性创建，显式安装后保留其绘制时的拖动开关。
        _button.isAllowDrag = YES;
        _button.panGR = jobsMakePanGesture(^(__kindof UIPanGestureRecognizer *gesture) {
            gesture
                .byCancelsTouchesInView(YES)
                .byDelegate(nil)
                .GestureActionBy(^(__kindof UIGestureRecognizer *data) {
                    @jobs_strongify(self)
                    if (self) {
                        [self handleButtonPan:(UIPanGestureRecognizer *)data];
                    }
                });
        });
        _button.addGR(_button.panGR);
        // BaseButton 已安装长按识别器，直接配置它，避免额外创建一份未绑定的手势。
        for (UIGestureRecognizer *gesture in _button.gestureRecognizers) {
            if ([gesture isKindOfClass:UILongPressGestureRecognizer.class]) {
                ((UILongPressGestureRecognizer *)gesture)
                    .byMinimumPressDuration(0.8)
                    .byAllowableMovement(8)
                    .byDelegate(nil);
            }
        }
    }
    return _button;
}

@end
#endif
