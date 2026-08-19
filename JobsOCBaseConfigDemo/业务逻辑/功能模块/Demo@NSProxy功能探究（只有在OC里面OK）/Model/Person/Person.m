//
//  Person.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "Person.h"

@implementation Person
-(void)setJobsName:(NSString *)name{
    jobsByStrBlock action = ((jobsByStrBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Person.class, @selector(jobsSetJobsName)))(self, @selector(jobsSetJobsName));
    if (action) action(name);
}

-(jobsByStrBlock _Nonnull)jobsSetJobsName{
    @jobs_weakify(self)
    return ^(NSString * name){
        @jobs_strongify(self)
        if (!self) return;
        NSLog(@"👤 我的名字设置为：%@", name);
    };
}

@end
