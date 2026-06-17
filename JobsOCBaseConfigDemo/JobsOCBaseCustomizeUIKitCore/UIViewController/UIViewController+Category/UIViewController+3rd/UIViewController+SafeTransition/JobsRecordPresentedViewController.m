//
//  JobsRecordPresentedViewController.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsRecordPresentedViewController.h"

#ifndef JOBS_RECORD_PRESENTED_VIEW_CONTROLLER_IMPLEMENTED
#define JOBS_RECORD_PRESENTED_VIEW_CONTROLLER_IMPLEMENTED
@implementation JobsRecordPresentedViewController

static JobsRecordPresentedViewController *static_JobsRecordPresentedVC = nil;
+(instancetype)sharedManager{
    @synchronized(self){
        if (!static_JobsRecordPresentedVC) {
            static_JobsRecordPresentedVC = JobsRecordPresentedViewController.new;
        }
    };return static_JobsRecordPresentedVC;
}
#pragma mark —— lazyLoad
-(NSMutableArray<__kindof UIViewController *> *)presentedVCMutArr{
    if (!_presentedVCMutArr) {
        _presentedVCMutArr = NSMutableArray.array;
    };return _presentedVCMutArr;
}

@end
#endif
