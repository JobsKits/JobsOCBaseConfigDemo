//
//  RealServiceA.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "RealServiceA.h"

@implementation RealServiceA
- (jobsByVoidBlock _Nonnull)doSomething {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSLog(@"🔧 RealServiceA 正在做事");
    };
}

@end
