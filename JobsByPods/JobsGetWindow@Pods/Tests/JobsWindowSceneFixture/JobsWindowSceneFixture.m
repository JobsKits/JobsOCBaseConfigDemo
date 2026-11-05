//
//  JobsWindowSceneFixture.m
//  JobsGetWindow
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsWindowSceneFixture.h"

// 用途：实现测试替身（fixture）；提供可控的窗口集合、Scene 活跃状态和会话标识，供窗口筛选测试。
// 运行：由 JobsGetWindow-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@implementation JobsWindowSceneFixture

-(JobsWindowSceneFixture *)session {
    return self;
}

-(BOOL)isKindOfClass:(Class)cls {
    if (@available(iOS 13.0, *)) {
        if (cls == UIWindowScene.class) {
            return YES;
        }
    }
    return [super isKindOfClass:cls];
}

@end
