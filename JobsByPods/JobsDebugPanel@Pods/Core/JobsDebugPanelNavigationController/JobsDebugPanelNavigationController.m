//
//  JobsDebugPanelNavigationController.m
//  JobsDebugPanel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsDebugPanelNavigationController.h"

#if DEBUG
@implementation JobsDebugPanelNavigationController

-(instancetype)initWithPanel:(JobsDebugPanelManager *)panel {
    if (self = [super initWithRootViewController:[[JobsDebugPanelVC alloc] initWithPanel:panel]]) {
        self.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    return self;
}

@end
#endif

