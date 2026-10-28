//
//  JobsOCDeviceGuardLaunchGate.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsOCDeviceGuardLaunchGate.h"

static JobsOCDeviceGuardLaunchDecision *JobsOCLaunchDecision;
static JobsRetBOOLByJobsOCDeviceGuardReportBlock JobsOCLaunchPolicy;
static JobsRetUIViewControllerByJobsOCDeviceGuardReportBlock JobsOCBlockedControllerFactory;
#if DEBUG
static JobsRetJobsOCDeviceGuardReportByVoidBlock JobsOCLaunchReportProviderForTesting;
#endif

@implementation JobsOCDeviceGuardLaunchGate

+(BOOL)configurePolicy:(JobsRetBOOLByJobsOCDeviceGuardReportBlock)policy
blockedViewControllerFactory:(JobsRetUIViewControllerByJobsOCDeviceGuardReportBlock)factory {
    if (!NSThread.isMainThread) {
        return NO;
    }
    @synchronized (self) {
        if (JobsOCLaunchDecision) {
            return NO;
        }
        JobsOCLaunchPolicy = [policy copy];
        JobsOCBlockedControllerFactory = [factory copy];
        return YES;
    }
}

+(JobsRetJobsOCDeviceGuardLaunchDecisionByVoidBlock _Nonnull)prepare {
    return ^JobsOCDeviceGuardLaunchDecision * {
        @synchronized (self) {
            if (!JobsOCLaunchDecision) {
                JobsOCDeviceGuardReport *report = nil;
#if DEBUG
                if (JobsOCLaunchReportProviderForTesting) {
                    report = JobsOCLaunchReportProviderForTesting();
                }
#endif
                if (!report) {
                    JobsOCDeviceGuardConfiguration *configuration = JobsOCDeviceGuardConfiguration.defaultConfiguration()
                        .bySandboxWriteProbeEnabled(NO);
                    report = [JobsOCDeviceGuardDetector detectWithConfiguration:configuration];
                }
                JobsOCLaunchDecision = [[JobsOCDeviceGuardLaunchDecision alloc] initWithReport:report policy:JobsOCLaunchPolicy];
            }
            return JobsOCLaunchDecision;
        }
    };
}

+(JobsOCDeviceGuardLaunchDecision *)decision {
    return self.prepare();
}

+(JobsRetVCByVoidBlock _Nonnull)makeBlockedViewController {
    return ^UIViewController * {
        NSAssert(NSThread.isMainThread, @"拦截页必须在主线程创建。");
        JobsOCDeviceGuardLaunchDecision *decision = self.prepare();
        if (!decision.blocked) {
            return nil;
        }
        UIViewController *controller = JobsOCBlockedControllerFactory ? JobsOCBlockedControllerFactory(decision.report) : nil;
        if (!controller || controller.parentViewController || controller.presentingViewController || controller.viewIfLoaded.window) {
            controller = [[JobsOCDeviceGuardBlockedVC alloc] initWithReport:decision.report];
        }
        return controller;
    };
}

#if DEBUG
+(JobsRetBOOLByJobsRetJobsOCDeviceGuardReportByVoidBlock _Nonnull)configureReportProviderForTesting {
    return ^BOOL(JobsRetJobsOCDeviceGuardReportByVoidBlock provider) {
        if (!NSThread.isMainThread) {
            return NO;
        }
        @synchronized (self) {
            if (JobsOCLaunchDecision) {
                return NO;
            }
            JobsOCLaunchReportProviderForTesting = [provider copy];
            return YES;
        }
    };
}
#endif

@end
