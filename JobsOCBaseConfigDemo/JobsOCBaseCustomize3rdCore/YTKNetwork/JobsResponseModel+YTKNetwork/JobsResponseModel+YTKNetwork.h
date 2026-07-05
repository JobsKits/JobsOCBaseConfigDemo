//
//  JobsResponseModel+YTKNetwork.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSRESPONSEMODEL_YTKNETWORK_706122352D
#define JOBS_HEADER_GUARD_JOBSRESPONSEMODEL_YTKNETWORK_706122352D

#import <objc/runtime.h>
#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "YTKNetworkProtocols.h"

#import "WHToastExtra.h"

#import "JobsModelDSL.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsResponseModel (YTKNetwork)

Prop_assign()HTTPResponseCode code;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSRESPONSEMODEL_YTKNETWORK_706122352D */
