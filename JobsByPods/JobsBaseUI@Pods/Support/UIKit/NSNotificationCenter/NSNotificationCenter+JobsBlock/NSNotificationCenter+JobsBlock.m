//
//  NSNotificationCenter+JobsBlock.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月17日，星期日.
//

#import "NSNotificationCenter+JobsBlock.h"

@implementation NSNotificationCenter (JobsBlock)

-(jobsByIDBlock _Nonnull)remove{
    return ^(id _Nullable data){
        [JobsNotificationCenter removeObserver:data];
    };
}

-(jobsByKey_ValueBlock _Nonnull)Remove{
    return ^(NSString *_Nonnull key,id _Nullable value){
        [JobsNotificationCenter removeObserver:value
                                          name:key
                                        object:nil];
    };
}

#pragma mark —— Prop_copy()jobsByNotificationBlock jobsNotificationBlock;
-(jobsByNotificationBlock _Nonnull)jobsNotificationBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setJobsNotificationBlock:(jobsByNotificationBlock)jobsNotificationBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             jobsNotificationBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
