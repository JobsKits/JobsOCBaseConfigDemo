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

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

#if __has_include(<JobsModel/JobsFileModel.h>)
#import <JobsModel/JobsFileModel.h>
#else
#import "JobsFileModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BaseUploadFileRequest : BaseRequest

-(JobsReturnRequestByFileModelBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASEUPLOADFILEREQUEST_89A107DA63 */
