//
//  JobsMonitorNetwoking.m
//  JobsMonitorNetwoking
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsMonitorNetwoking.h"

@interface JobsMonitorNetwoking ()

Prop_assign()long long int lastBytes;
Prop_assign()BOOL isFirstRate;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsMonitorNetwoking
@interface JobsMonitorNetwoking (JobsPropertyDSLSetterAutogen_2b661e1bb3)
-(void)setIsFirstRate:(BOOL)data;
-(void)setLastBytes:(long long int)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsMonitorNetwoking

@implementation JobsMonitorNetwoking
static JobsMonitorNetwoking *monitorNetwoking = nil;
+(instancetype)sharedManager{
    JobsRetJobsMonitorNetwokingByVoidBlock action = ((JobsRetJobsMonitorNetwokingByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsMonitorNetwoking.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetJobsMonitorNetwokingByVoidBlock _Nonnull)jobsSharedManager{
    return ^JobsMonitorNetwoking *{
        @synchronized(self){
            if (!monitorNetwoking) {
                monitorNetwoking = JobsMonitorNetwoking.new;
            }
        };return monitorNetwoking;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        monitorNetwoking = self;
        self.lastBytes = 0;
    };return self;
}

-(jobsByVoidBlock _Nonnull)getInternetface{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        long long int rate = 0;
        long long int currentBytes = self.getInterfaceBytes();
        if(self.lastBytes) {
            //用上当前的下行总流量减去上一秒的下行流量达到下行速录
            rate = currentBytes - self.lastBytes;
        }else{
            self.byFirstRate(NO);
        }
        //保存上一秒的下行总流量
        self.byLastBytes(self.getInterfaceBytes());
        //格式化一下
        NSString*rateStr = self.formatNetWork(rate);
        JobsLog(@"当前网速%@",rateStr);
        _rateLabel.byText(rateStr);
    //    JobsLog(@"hehe:%lld",hehe/1024/1024);
    };
}

-(JobsRetlonglongByVoidBlock _Nonnull)getInterfaceBytes{
    @jobs_weakify(self)
    return ^long long{
        @jobs_strongify(self)
        if (!self) return (long long){0};
        struct ifaddrs *ifa_list = 0, *ifa;
        if (getifaddrs(&ifa_list) == -1){
            return 0;
        }
        uint32_t iBytes = 0;//下行
        uint32_t oBytes = 0;//上行
        for (ifa = ifa_list; ifa; ifa = ifa->ifa_next){
            if (AF_LINK != ifa->ifa_addr->sa_family)
                continue;
            if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))
                continue;
            if (ifa->ifa_data == 0)
                continue;
            /* Not a loopback device. */
            if (strncmp(ifa->ifa_name, "lo", 2)){
                struct if_data *if_data = (struct if_data *)ifa->ifa_data;
                iBytes += if_data->ifi_ibytes;
                oBytes += if_data->ifi_obytes;
            }
        }
        freeifaddrs(ifa_list);
    //    JobsLog(@"\n[getInterfaceBytes-Total]%d,%d",iBytes,oBytes);
        return iBytes;
    };
}

-(JobsRetNSStringBylonglongintBlock _Nonnull)formatNetWork{
    @jobs_weakify(self)
    return ^NSString *(long long int rate){
        @jobs_strongify(self)
        if (!self) return nil;
        if(rate < 1024) {
            return [NSString stringWithFormat:@"%lldB/秒", rate];
        }else if(rate >= 1024 && rate < 1024 * 1024) {
            return [NSString stringWithFormat:@"%.1fKB/秒", (double)rate / 1024];
        }else if(rate >= 1024 * 1024 && rate <1024 * 1024 * 1024){
            return [NSString stringWithFormat:@"%.2fMB/秒", (double)rate / (1024 * 1024)];
        }else{
            return @"10Kb/秒";
        };
    };
}
#pragma mark —— lazyLoad
-(JobsSuspendLab *)rateLabel{
    if (!_rateLabel) {
        _rateLabel = JobsSuspendLab.new;
    };return _rateLabel;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsMonitorNetwoking
-(JobsRetJobsMonitorNetwokingByBOOLBlock _Nonnull)byFirstRate{
    @jobs_weakify(self)
    return ^__kindof JobsMonitorNetwoking * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsFirstRate:data];
        return self;
    };
}

-(JobsRetJobsMonitorNetwokingBylonglongintBlock _Nonnull)byLastBytes{
    @jobs_weakify(self)
    return ^__kindof JobsMonitorNetwoking * _Nullable(long long int data){
        @jobs_strongify(self)
        [self setLastBytes:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsMonitorNetwoking
@end
