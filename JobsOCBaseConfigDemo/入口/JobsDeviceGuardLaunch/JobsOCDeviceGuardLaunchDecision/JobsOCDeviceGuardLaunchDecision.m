//
//  JobsOCDeviceGuardLaunchDecision.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsOCDeviceGuardLaunchDecision.h"

@implementation JobsOCDeviceGuardLaunchDecision

-(instancetype)initWithReport:(JobsOCDeviceGuardReport *)report
                       policy:(JobsRetBOOLByJobsOCDeviceGuardReportBlock)policy {
    if (self = [super init]) {
        _report = report;
        _blocked = policy ? policy(report) : report.isJailbroken;
    }
    return self;
}

@end
