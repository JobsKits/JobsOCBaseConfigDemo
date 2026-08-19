//
//  UploadImageApi.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UPLOADIMAGEAPI_063B9FA8F4
#define JOBS_HEADER_GUARD_UPLOADIMAGEAPI_063B9FA8F4

#import <UIKit/UIKit.h>
#import <JobsAPIs/JobsBaseApi.h>
#import <JobsAPIs/This+URLMgr.h>

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

#if __has_include(<This/ThisHeader.h>)
#import <This/ThisHeader.h>
#else
#import "ThisHeader.h"
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

@interface UploadImageApi : JobsBaseApi

+(JobsRetIDByImageBlock _Nonnull)initByImage;
-(JobsRetIDByImageBlock _Nonnull)byImage;
-(JobsRetStrByVoidBlock _Nonnull)responseImageId;

@end
#endif /* JOBS_HEADER_GUARD_UPLOADIMAGEAPI_063B9FA8F4 */
