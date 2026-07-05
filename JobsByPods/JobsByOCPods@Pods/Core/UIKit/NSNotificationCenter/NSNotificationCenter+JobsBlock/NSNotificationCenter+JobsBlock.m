//
//  NSNotificationCenter+JobsBlock.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
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
JobsKey(_jobsNotificationBlock)
@dynamic jobsNotificationBlock;
-(jobsByNotificationBlock _Nonnull)jobsNotificationBlock{
    return Jobs_getAssociatedObject(_jobsNotificationBlock);
}

-(void)setJobsNotificationBlock:(jobsByNotificationBlock)jobsNotificationBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_jobsNotificationBlock, jobsNotificationBlock)
}

@end
