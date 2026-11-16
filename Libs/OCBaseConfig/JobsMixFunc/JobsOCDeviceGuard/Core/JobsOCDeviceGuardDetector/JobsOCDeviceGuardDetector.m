//
//  JobsOCDeviceGuardDetector.m
//  JobsOCDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsOCDeviceGuardDetector.h"

static JobsOCDeviceGuardCheck *JobsGuardCheck(JobsOCDeviceGuardCategory category,
                                             JobsOCDeviceGuardCheckStatus status,
                                             NSString *identifier,
                                             NSString *detail,
                                             int errorCode) {
    return [[JobsOCDeviceGuardCheck alloc] initWithCategory:category
                                                   status:status
                                               identifier:identifier
                                                   detail:detail
                                                errorCode:errorCode];
}

static NSString *JobsGuardUnsupportedReason(void) {
#if TARGET_OS_SIMULATOR
    return @"模拟器不适用真机越狱规则；该结果不能用作设备安全结论。";
#elif TARGET_OS_MACCATALYST
    return @"Mac Catalyst不适用iOS真机越狱规则。";
#elif !TARGET_OS_IOS
    return @"当前运行平台不适用iOS真机越狱规则。";
#else
    if (@available(iOS 14.0, *)) {
        if (NSProcessInfo.processInfo.isiOSAppOnMac) {
            return @"Mac上运行的iOS App不适用真机越狱规则。";
        }
    }
    return @"";
#endif
}

static void JobsGuardCheckPaths(NSMutableArray<JobsOCDeviceGuardCheck *> *checks,
                                JobsOCDeviceGuardConfiguration *configuration) {
    for (NSString *path in configuration.jailbreakPaths) {
        errno = 0;
        int result = access(path.fileSystemRepresentation, F_OK);
        int code = result == 0 ? 0 : errno;
        JobsOCDeviceGuardCheckStatus status = JobsOCDeviceGuardCheckStatusUnavailable;
        if (result == 0) {
            status = JobsOCDeviceGuardCheckStatusDetected;
        } else if (code == ENOENT || code == ENOTDIR) {
            status = JobsOCDeviceGuardCheckStatusPassed;
        }
        [checks addObject:JobsGuardCheck(JobsOCDeviceGuardCategoryFileSystem, status, path,
            result == 0 ? @"存在可观察的越狱相关路径；单一路径不独立确认越狱。" :
            (status == JobsOCDeviceGuardCheckStatusPassed ? @"未发现此路径。" : @"当前进程无法确认路径是否存在。"), code)];
    }
}

static void JobsGuardCheckImages(NSMutableArray<JobsOCDeviceGuardCheck *> *checks,
                                 JobsOCDeviceGuardConfiguration *configuration) {
    uint32_t count = _dyld_image_count();
    BOOL unavailable = count == 0;
    NSMutableArray<NSString *> *matches = [NSMutableArray array];
    NSSet<NSString *> *names = [NSSet setWithArray:configuration.loadedImageNames];
    for (uint32_t index = 0; index < count; index++) {
        const char *imageName = _dyld_get_image_name(index);
        if (!imageName) {
            unavailable = YES;
            continue;
        }
        NSString *path = [NSString stringWithUTF8String:imageName];
        if (!path) {
            unavailable = YES;
            continue;
        }
        if ([names containsObject:path.lastPathComponent.lowercaseString]) {
            [matches addObject:path];
        }
    }
    for (NSString *path in matches) {
        [checks addObject:JobsGuardCheck(JobsOCDeviceGuardCategoryRuntime, JobsOCDeviceGuardCheckStatusDetected,
            path, @"当前进程加载了精确文件名命中的镜像；调试工具也可能触发。", 0)];
    }
    if (!matches.count || unavailable) {
        [checks addObject:JobsGuardCheck(JobsOCDeviceGuardCategoryRuntime,
            unavailable ? JobsOCDeviceGuardCheckStatusUnavailable : JobsOCDeviceGuardCheckStatusPassed,
            @"loadedImages", unavailable ? @"镜像枚举不完整。" : @"未命中已配置的镜像文件名。", 0)];
    }
}

static void JobsGuardCheckWrite(NSMutableArray<JobsOCDeviceGuardCheck *> *checks,
                                JobsOCDeviceGuardConfiguration *configuration) {
    if (!configuration.sandboxWriteProbeEnabled) {
        [checks addObject:JobsGuardCheck(JobsOCDeviceGuardCategorySandbox, JobsOCDeviceGuardCheckStatusSkipped,
            @"sandboxWrite", @"默认关闭；只有显式启用才尝试写入并立即清理探测文件。", 0)];
        return;
    }
    for (NSString *directory in @[@"/private", @"/private/var/lib"]) {
        NSString *path = [directory stringByAppendingPathComponent:
            [@"jobs_device_guard_" stringByAppendingString:NSUUID.UUID.UUIDString]];
        int descriptor = open(path.fileSystemRepresentation, O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW, S_IRUSR | S_IWUSR);
        int code = descriptor < 0 ? errno : 0;
        if (descriptor >= 0) {
            int closeResult = close(descriptor);
            int closeCode = closeResult < 0 ? errno : 0;
            int unlinkResult = unlink(path.fileSystemRepresentation);
            int unlinkCode = unlinkResult < 0 ? errno : 0;
            [checks addObject:JobsGuardCheck(JobsOCDeviceGuardCategorySandbox, JobsOCDeviceGuardCheckStatusDetected,
                path, @"在应用沙盒外成功创建独占探测文件。", 0)];
            if (closeCode || unlinkCode) {
                [checks addObject:JobsGuardCheck(JobsOCDeviceGuardCategorySandbox, JobsOCDeviceGuardCheckStatusUnavailable,
                    path, unlinkCode ? @"探测文件清理失败；此路径需按日志人工核实。" : @"探测文件关闭失败；已尝试清理。", unlinkCode ?: closeCode)];
            }
        } else {
            BOOL denied = code == EACCES || code == EPERM || code == EROFS;
            [checks addObject:JobsGuardCheck(JobsOCDeviceGuardCategorySandbox,
                denied ? JobsOCDeviceGuardCheckStatusPassed : JobsOCDeviceGuardCheckStatusUnavailable,
                directory, denied ? @"系统按预期拒绝沙盒外创建。" : @"写入探测未完成，不能解释为沙盒正常。", code)];
        }
    }
}

@implementation JobsOCDeviceGuardDetector

+(JobsOCDeviceGuardReport *)detectWithConfiguration:(JobsOCDeviceGuardConfiguration *)configuration {
    JobsOCDeviceGuardConfiguration *snapshot = [configuration copy];
    NSMutableArray<JobsOCDeviceGuardCheck *> *checks = [NSMutableArray array];
    NSString *reason = JobsGuardUnsupportedReason();
    if (reason.length) {
        for (NSNumber *category in @[@(JobsOCDeviceGuardCategoryFileSystem), @(JobsOCDeviceGuardCategoryRuntime), @(JobsOCDeviceGuardCategorySandbox)]) {
            [checks addObject:JobsGuardCheck(category.unsignedIntegerValue, JobsOCDeviceGuardCheckStatusSkipped,
                @"environment", reason, 0)];
        }
    } else {
        JobsGuardCheckPaths(checks, snapshot);
        JobsGuardCheckImages(checks, snapshot);
        JobsGuardCheckWrite(checks, snapshot);
    }
    return [[JobsOCDeviceGuardReport alloc] initWithChecks:checks configuration:snapshot unsupportedReason:reason];
}

+(void)detectAsyncWithConfiguration:(JobsOCDeviceGuardConfiguration *)configuration
                        completion:(void (^)(JobsOCDeviceGuardReport *))completion {
    JobsOCDeviceGuardConfiguration *snapshot = [configuration copy];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
        JobsOCDeviceGuardReport *report = [self detectWithConfiguration:snapshot];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(report);
        });
    });
}

@end
