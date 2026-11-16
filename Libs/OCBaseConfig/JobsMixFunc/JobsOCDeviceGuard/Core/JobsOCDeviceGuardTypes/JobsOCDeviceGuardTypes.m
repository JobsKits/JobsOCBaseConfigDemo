//
//  JobsOCDeviceGuardTypes.m
//  JobsOCDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsOCDeviceGuardTypes.h"

NSString *JobsOCDeviceGuardCategoryName(JobsOCDeviceGuardCategory category) {
    switch (category) {
        /// 文件系统可见特征
        case JobsOCDeviceGuardCategoryFileSystem:
            return @"fileSystem";
        /// 当前进程加载的镜像
        case JobsOCDeviceGuardCategoryRuntime:
            return @"runtime";
        /// 沙盒写入限制
        case JobsOCDeviceGuardCategorySandbox:
            return @"sandbox";
    }
    return @"unknown";
}

NSString *JobsOCDeviceGuardCheckStatusName(JobsOCDeviceGuardCheckStatus status) {
    switch (status) {
        /// 检查执行完成且没有命中特征
        case JobsOCDeviceGuardCheckStatusPassed:
            return @"passed";
        /// 命中可观察特征
        case JobsOCDeviceGuardCheckStatusDetected:
            return @"detected";
        /// 配置关闭或当前环境不执行
        case JobsOCDeviceGuardCheckStatusSkipped:
            return @"skipped";
        /// API失败，无法得出此项结论
        case JobsOCDeviceGuardCheckStatusUnavailable:
            return @"unavailable";
    }
    return @"unknown";
}

NSString *JobsOCDeviceGuardVerdictName(JobsOCDeviceGuardVerdict verdict) {
    switch (verdict) {
        /// 未发现特征不等于证明设备安全
        case JobsOCDeviceGuardVerdictNoIndicators:
            return @"noIndicators";
        /// 尚未达到多类别阈值
        case JobsOCDeviceGuardVerdictSuspicious:
            return @"suspicious";
        /// 多个独立类别命中
        case JobsOCDeviceGuardVerdictJailbroken:
            return @"jailbroken";
        /// 零命中但检查未完成
        case JobsOCDeviceGuardVerdictIndeterminate:
            return @"indeterminate";
        /// 模拟器与Mac环境不适用真机规则
        case JobsOCDeviceGuardVerdictUnsupported:
            return @"unsupported";
    }
    return @"unknown";
}
