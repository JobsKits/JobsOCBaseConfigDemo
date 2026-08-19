//
//  UploadImageApi.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UPLOADIMAGEAPI_063B9FA8F4

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

#define JOBS_HEADER_GUARD_UPLOADIMAGEAPI_063B9FA8F4

#import <UIKit/UIKit.h>
#import "JobsBaseApi.h"
#import "This+URLMgr.h"

#import "ThisHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

@interface UploadImageApi : JobsBaseApi

+(JobsRetIDByImageBlock _Nonnull)initByImage;
-(JobsRetIDByImageBlock _Nonnull)byImage;
-(JobsRetStrByVoidBlock _Nonnull)responseImageId;

@end
#endif /* JOBS_HEADER_GUARD_UPLOADIMAGEAPI_063B9FA8F4 */
