//
//  ExampleUsage.m
//  JobsLocker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "JobsLocker.h"
#import "JobsLocker+Once.h"

@interface DemoObject : NSObject
Prop_strong()JobsLocker *locker;
Prop_strong()NSMutableArray<NSString *> *dataSource;
- (void)bootstrap;
- (void)addObject:(NSString *)obj;

@end

@implementation DemoObject

- (instancetype)init {
    self = [super init];
    if (self) {
        _locker = [JobsLocker unfairLock];
        _dataSource = [NSMutableArray array];
    };return self;
}

- (void)bootstrap {
    [self.locker executeOnce:^{
        NSLog(@"bootstrap only once");
    }];
}

- (void)addObject:(NSString *)obj {
    [self.locker withLock:^{
        [self.dataSource addObject:obj];
    }];
}

@end
