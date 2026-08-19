//
//  JobsSwiftParityTaskCenterDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityTaskCenterDemoVC.h"

@interface JobsSwiftParityTaskCenterDemoVC ()

Prop_assign()NSUInteger taskGeneration;

@end

@implementation JobsSwiftParityTaskCenterDemoVC

-(JobsRetStrByVoidBlock _Nonnull)demoNavigationTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"TaskCenter 依赖任务编排";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoDescription{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"任务 B 依赖任务 A，汇总任务再依赖任务 B。";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoIconName{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"checklist";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)primaryActionTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"执行依赖任务链";
    };
}

-(jobsByVoidBlock _Nonnull)performPrimaryAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.taskGeneration += 1;
        NSUInteger generation = self.taskGeneration;
        self.previewImageView.byImage(@"checklist".sys_img);
        self.previewTitleLab.byText(@"任务 A → 任务 B → 汇总任务");
        self.updateStatus(@"TaskCenter 正在执行依赖链");
        NSBlockOperation *taskA = [NSBlockOperation blockOperationWithBlock:^{
            JobsLog(@"TaskCenter[%lu]：任务 A 完成",(unsigned long)generation);
        }];
        NSBlockOperation *taskB = [NSBlockOperation blockOperationWithBlock:^{
            JobsLog(@"TaskCenter[%lu]：任务 B 完成",(unsigned long)generation);
        }];
        @jobs_weakify(self)
        NSBlockOperation *summary = [NSBlockOperation blockOperationWithBlock:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                weak_self.updateStatus([NSString stringWithFormat:@"TaskCenter 第 %lu 轮依赖任务全部完成",
                                         (unsigned long)generation]);
            });
        }];
        [taskB addDependency:taskA];
        [summary addDependency:taskB];
        NSOperationQueue *queue = NSOperationQueue.new;
        [queue addOperations:@[taskA,taskB,summary]
           waitUntilFinished:NO];
    };
}

@end
