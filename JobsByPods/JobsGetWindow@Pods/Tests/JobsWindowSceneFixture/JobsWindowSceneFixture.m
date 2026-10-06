//
//  JobsWindowSceneFixture.m
//  JobsGetWindow
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsWindowSceneFixture.h"

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
