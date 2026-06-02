//
//  NSURLRequest+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_B54FDAA055
#define JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_B54FDAA055

#import <Foundation/Foundation.h>
#import <JobsCustomView/NSObject+Data.h>
#import <JobsCustomView/NSData+Extra.h>

#if __has_include(<YTKNetworkExtra/YTKNetworkExtra.h>)
#import <YTKNetworkExtra/YTKNetworkExtra.h>
#else
#import "YTKNetworkExtra.h"
#endif

#if __has_include(<JobsTimeUtils/JobsTimeUtils.h>)
#import <JobsTimeUtils/JobsTimeUtils.h>
#else
#import "JobsTimeUtils.h"
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

@interface NSURLRequest (Extra)
+(JobsRetURLRequestByURLBlock _Nonnull)initBy;
/// 打印NSURLRequest有效内容，并转化为NSMutableURLRequest对外输出
-(JobsRetMutableURLRequestByVoidBlock _Nonnull)print;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_B54FDAA055 */
