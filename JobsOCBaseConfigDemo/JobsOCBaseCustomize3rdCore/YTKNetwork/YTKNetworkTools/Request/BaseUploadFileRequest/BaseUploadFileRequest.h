//
//  BaseUploadFileRequest.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEUPLOADFILEREQUEST_89A107DA63

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

#define JOBS_HEADER_GUARD_BASEUPLOADFILEREQUEST_89A107DA63

#import <Foundation/Foundation.h>
#import "BaseRequest.h"

#import "JobsStringUtilsHeader.h"
#import "JobsModelDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseUploadFileRequest : BaseRequest

-(JobsRetRequestByFileModelBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASEUPLOADFILEREQUEST_89A107DA63 */
