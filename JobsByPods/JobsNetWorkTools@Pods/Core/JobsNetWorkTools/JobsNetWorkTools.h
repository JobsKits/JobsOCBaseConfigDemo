//
//  JobsNetWorkTools.h
//  JobsNetWorkTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSNETWORKTOOLS_A5554FC4D0
#define JOBS_HEADER_GUARD_JOBSNETWORKTOOLS_A5554FC4D0

#import <Foundation/Foundation.h>
#import <ifaddrs.h>               // 提供网络接口地址遍历能力，可获取设备各网络接口的 IP 地址等信息。
#import <net/if.h>                // 定义网络接口相关常量、结构体和操作接口。
#import <net/if_var.h>            // 引入网络接口内部状态、统计信息及相关内核结构定义

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsOCTimer.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

static inline JobsNetworkBytes JobsNetworkBytesMake(uint64_t download, uint64_t upload) {
    JobsNetworkBytes b;
    b.download = download;
    b.upload   = upload;
    return b;
}
/// 读取当前所有 UP 状态网卡的总上下行字节（Wi-Fi + 蜂窝 + 其他）
static JobsNetworkBytes JobsCurrentNetworkBytes(void) {
    struct ifaddrs *addrs = NULL;
    JobsNetworkBytes result = JobsNetworkBytesMake(0, 0);
    if (getifaddrs(&addrs) != 0 || !addrs) return result;
    for (struct ifaddrs *ifa = addrs; ifa != NULL; ifa = ifa->ifa_next) {
        if (!ifa->ifa_data) {
            continue;
        }
        // 只算 UP 接口
        if (!(ifa->ifa_flags & IFF_UP)) {
            continue;
        }
        struct if_data *data = (struct if_data *)ifa->ifa_data;
        if (!data) continue;
        uint64_t inBytes  = (uint64_t)data->ifi_ibytes;
        uint64_t outBytes = (uint64_t)data->ifi_obytes;
        // 这里我们不区分 en / pdp_ip / 其他，直接全加，总效果等于 Swift 里的 wifi+cellular+other.total
        result.download += inBytes;
        result.upload   += outBytes;
    }
    freeifaddrs(addrs);
    return result;
}

@interface JobsNetworkTrafficMonitor : NSObject <BaseProtocol,TimerProtocol>
/// 可销毁单例
+(JobsRetIDByVoidBlock _Nonnull)shared;
+(jobsByVoidBlock _Nonnull)destroyShared;
/// 链式设置回调
-(JobsRetTNetworkTrafficMonitorByUpdateBlock _Nonnull)onUpdateBy;
/// 启动监控（内部用 JobsTimer 按 interval 采样）
-(jobsByDoubleBlock _Nonnull)byStartWithInterval;
/// 停止监控
-(jobsByVoidBlock _Nonnull)byStop;

@end

#endif /* JOBS_HEADER_GUARD_JOBSNETWORKTOOLS_A5554FC4D0 */
