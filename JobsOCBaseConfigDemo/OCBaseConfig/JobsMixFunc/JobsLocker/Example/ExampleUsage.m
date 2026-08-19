//
//  ExampleUsage.m
//  JobsLocker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ExampleUsage.h"
#import "JobsLocker+Once.h"

@implementation DemoObject
- (instancetype)init {
    self = [super init];
    if (self) {
        _locker = JobsLocker.unfairLock();
        _dataSource = [NSMutableArray array];
    };return self;
}

- (jobsByVoidBlock _Nonnull)bootstrap {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.locker.executeOnce(^{
            NSLog(@"bootstrap only once");
        });
    };
}

- (void)addObject:(NSString *)obj {
    ((((jobsByStrBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(DemoObject.class, @selector(addObject)))(self, @selector(addObject))))(obj);
}
-(jobsByStrBlock _Nonnull)addObject{
    @jobs_weakify(self)
    return ^(NSString * obj){
        @jobs_strongify(self)
        if (!self) return;
        self.locker.withLock(^{
            [self.dataSource addObject:obj];
        });
    };
}

@end
