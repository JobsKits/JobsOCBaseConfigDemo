//
//  BaseUploadFileRequest.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEUPLOADFILEREQUEST_89A107DA63
#define JOBS_HEADER_GUARD_BASEUPLOADFILEREQUEST_89A107DA63

#import <Foundation/Foundation.h>
#import <YTKNetworkExtra/BaseRequest.h>

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

@interface BaseUploadFileRequest : BaseRequest

-(JobsRetRequestByFileModelBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASEUPLOADFILEREQUEST_89A107DA63 */
