//
//  JobsMonitorNetwoking.h
//  JobsMonitorNetwoking
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSMONITORNETWOKING_68CC31D484
#define JOBS_HEADER_GUARD_JOBSMONITORNETWOKING_68CC31D484

#import <Foundation/Foundation.h>

#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>

#import "JobsSuspend.h"

@class JobsSuspendLab;

#import "JobsDefines.h"
#import "JobsBlock.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN
///思路：先获取到总的流量信息，然后用当前的总下行流量减去上一秒的下行流量得到网速！
@interface JobsMonitorNetwoking : NSObject

Prop_strong()JobsSuspendLab *rateLabel;

+(instancetype)sharedManager;
+(JobsRetJobsMonitorNetwokingByVoidBlock _Nonnull)jobsSharedManager;
-(JobsRetlonglongByVoidBlock _Nonnull)getInterfaceBytes;
-(jobsByVoidBlock _Nonnull)getInternetface;
-(JobsRetNSStringBylonglongintBlock _Nonnull)formatNetWork;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsMonitorNetwoking
-(JobsRetJobsMonitorNetwokingByBOOLBlock _Nonnull)byFirstRate;
-(JobsRetJobsMonitorNetwokingBylonglongintBlock _Nonnull)byLastBytes;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsMonitorNetwoking
@end

NS_ASSUME_NONNULL_END

//使用须知
//- (void)dealloc {
//    JobsLog(@"%@",JobsLocalFunc);
//    [self.mytimer invalidate];
//    //别忘了把定时器置为nil,否则定时器依然没有释放掉的
//    self.mytimer  = nil;
//}
//
//-(void)viewDidLoad{
//    self.view.backgroundColor = JobsBlueColor;
//    #ifdef DEBUG
//    self.mytimer = [NSTimer scheduledTimerWithTimeInterval:1.0
//                                                    target:self
//                                                  selector:@selector(makeMonitorNetwoking)
//                                                  userInfo:nil
//                                                   repeats:YES];
//    [self.mytimer fireDate];
//    #endif
//}
//
//#pragma mark - 网络监控
//-(void)makeMonitorNetwoking{
//    [self.monitorNetwoking getInternetface];
//}
#endif /* JOBS_HEADER_GUARD_JOBSMONITORNETWOKING_68CC31D484 */
