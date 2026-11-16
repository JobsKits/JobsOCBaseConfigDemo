//
//  JobsOCDeviceGuardReport.m
//  JobsOCDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsOCDeviceGuardReport.h"

@implementation JobsOCDeviceGuardReport

-(instancetype)initWithChecks:(NSArray<JobsOCDeviceGuardCheck *> *)checks
                configuration:(JobsOCDeviceGuardConfiguration *)configuration
            unsupportedReason:(NSString *)unsupportedReason {
    if (self = [super init]) {
        _checks = [checks copy];
        _unsupportedReason = [unsupportedReason copy];
        _timestamp = NSDate.timeIntervalSinceReferenceDate;
        NSMutableSet<NSNumber *> *categories = [NSMutableSet set];
        BOOL incomplete = NO;
        BOOL executed = NO;
        for (JobsOCDeviceGuardCheck *check in checks) {
            if (check.status == JobsOCDeviceGuardCheckStatusDetected) {
                [categories addObject:@(check.category)];
            }
            incomplete |= check.status == JobsOCDeviceGuardCheckStatusUnavailable;
            executed |= check.status == JobsOCDeviceGuardCheckStatusPassed || check.status == JobsOCDeviceGuardCheckStatusDetected;
        }
        _detectedCategories = [categories copy];
        if (unsupportedReason.length) {
            _verdict = JobsOCDeviceGuardVerdictUnsupported;
        } else if (categories.count >= configuration.minimumDetectedCategories) {
            _verdict = JobsOCDeviceGuardVerdictJailbroken;
        } else if (categories.count) {
            _verdict = JobsOCDeviceGuardVerdictSuspicious;
        } else if (incomplete || !executed) {
            _verdict = JobsOCDeviceGuardVerdictIndeterminate;
        } else {
            _verdict = JobsOCDeviceGuardVerdictNoIndicators;
        }
        _isJailbroken = _verdict == JobsOCDeviceGuardVerdictJailbroken;
        _shouldRestrict = _verdict != JobsOCDeviceGuardVerdictNoIndicators;
    }
    return self;
}

-(NSString *)summaryText {
    NSMutableArray<NSString *> *lines = [NSMutableArray arrayWithArray:@[
        [NSString stringWithFormat:@"结果：%@\n命中类别：%lu / 3\n业务建议：%@\n%@",
            JobsOCDeviceGuardVerdictName(_verdict), (unsigned long)_detectedCategories.count,
            _shouldRestrict ? @"限制敏感操作" : @"可按业务策略继续",
            _unsupportedReason.length ? _unsupportedReason : @"未命中也不能证明设备安全；本地检测可能被绕过。"]
    ]];
    for (JobsOCDeviceGuardCheck *check in _checks) {
        [lines addObject:[NSString stringWithFormat:@"[%@/%@] %@\n%@%@",
            JobsOCDeviceGuardCategoryName(check.category), JobsOCDeviceGuardCheckStatusName(check.status),
            check.identifier, check.detail,
            check.errorCode ? [NSString stringWithFormat:@" (errno=%d)", check.errorCode] : @""]];
    }
    return [lines componentsJoinedByString:@"\n\n"];
}

@end
