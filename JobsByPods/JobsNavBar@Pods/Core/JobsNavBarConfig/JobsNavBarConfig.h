//
//  JobsNavBarConfig.h
//  JobsNavBar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSNAVBARCONFIG_E8E74A79B4
#define JOBS_HEADER_GUARD_JOBSNAVBARCONFIG_E8E74A79B4

#import <Foundation/Foundation.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
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

NS_ASSUME_NONNULL_BEGIN

extern JobsNavBarConfig *static_navBarConfig;
@interface JobsNavBarConfig : UIViewModel

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsNavBarConfig *_Nonnull jobsMakeNavBarConfig(jobsByNavBarConfigBlock _Nonnull block){
    JobsNavBarConfig *data = JobsNavBarConfig.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSNAVBARCONFIG_E8E74A79B4 */
