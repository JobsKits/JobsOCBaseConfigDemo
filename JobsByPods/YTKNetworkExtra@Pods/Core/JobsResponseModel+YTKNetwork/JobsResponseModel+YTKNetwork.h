//
//  JobsResponseModel+YTKNetwork.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSRESPONSEMODEL_YTKNETWORK_706122352D
#define JOBS_HEADER_GUARD_JOBSRESPONSEMODEL_YTKNETWORK_706122352D

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<JobsOCProtocols/YTKNetworkProtocols.h>)
#import <JobsOCProtocols/YTKNetworkProtocols.h>
#else
#import "YTKNetworkProtocols.h"
#endif

#if __has_include(<WHToastExtra/NSObject+WHToast.h>)
#import <WHToastExtra/NSObject+WHToast.h>
#else
#import "NSObject+WHToast.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsResponseModel (YTKNetwork)

-(void)setCode:(HTTPResponseCode)code;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSRESPONSEMODEL_YTKNETWORK_706122352D */
