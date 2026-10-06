//
//  JobsDebugOverlayWindow.m
//  JobsDebugPanel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsDebugOverlayWindow.h"

#if DEBUG
@implementation JobsDebugOverlayWindow

-(instancetype)initWithHostWindow:(UIWindow *)window panel:(JobsDebugPanelManager *)panel {
    if (@available(iOS 13.0, *)) {
        if (window.windowScene) {
            self = [super initWithWindowScene:window.windowScene];
        } else {
            self = [super initWithFrame:window.bounds];
        }
    } else {
        self = [super initWithFrame:window.bounds];
    }
    if (self) {
        _hostWindow = window;
        // 独立窗口只截获按钮区域，业务窗口继续保持 keyWindow。
        self.windowLevel = UIWindowLevelAlert + 1;
        self.backgroundColor = UIColor.clearColor;
        self.rootViewController = [[JobsDebugOverlayVC alloc] initWithPanel:panel hostWindow:window];
        self.accessibilityIdentifier = @"JobsDebugPanelOverlayWindow";
    }
    return self;
}

-(BOOL)canBecomeKeyWindow {
    return NO;
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hit = [super hitTest:point withEvent:event];
    JobsDebugOverlayVC *controller = (JobsDebugOverlayVC *)self.rootViewController;
    if (hit == controller.button || [hit isDescendantOfView:controller.button]) {
        return hit;
    }
    return nil;
}

@end
#endif
