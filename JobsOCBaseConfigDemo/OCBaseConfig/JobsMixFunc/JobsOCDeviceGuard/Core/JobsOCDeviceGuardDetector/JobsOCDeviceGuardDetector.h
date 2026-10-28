//
//  JobsOCDeviceGuardDetector.h
//  JobsOCDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import <errno.h>
#import <fcntl.h>
#import <unistd.h>
#import <TargetConditionals.h>
#import <mach-o/dyld.h>
#import <Foundation/Foundation.h>
#import "JobsOCDeviceGuardReport.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCDeviceGuardDetector : NSObject

/// 每次实时执行，无全局缓存；建议使用异步入口。
+(JobsOCDeviceGuardReport *)detectWithConfiguration:(JobsOCDeviceGuardConfiguration *)configuration;
/// 配置调用时复制，检查在后台执行，completion固定回到主线程一次。
+(void)detectAsyncWithConfiguration:(JobsOCDeviceGuardConfiguration *)configuration
                        completion:(void (^)(JobsOCDeviceGuardReport *report))completion;

@end

NS_ASSUME_NONNULL_END
