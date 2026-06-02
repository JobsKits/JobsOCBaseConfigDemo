//
//  TABInjectionIIIHelper.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABInjectionIIIHelper.h"
#import <objc/runtime.h>

@implementation TABInjectionIIIHelper

#if DEBUG

/**
 InjectionIII 热部署会调用的一个方法，
 runtime给VC绑定上之后，每次部署完就重新viewDidLoad
*/
void injected(id self, SEL _cmd) {
    [self viewDidLoad];
}

+ (void)load {
    __block id observer =
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
        [[NSNotificationCenter defaultCenter] removeObserver:observer];
    }];
    class_addMethod([UIViewController class], NSSelectorFromString(@"injected"), (IMP)injected, "v@:");
}

#endif

@end
