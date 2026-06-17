//
//  BaseUploadFileRequest.h
//  JobsOCBaseConfigDemo
//
//  Created by Admin on 5/12/2024.
//

#import "BaseRequest.h"
#import "JobsFileModel.h"
#import "JobsDefineProperty.h"
#import "JobsBlock.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BaseUploadFileRequest : BaseRequest

-(JobsReturnRequestByFileModelBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
