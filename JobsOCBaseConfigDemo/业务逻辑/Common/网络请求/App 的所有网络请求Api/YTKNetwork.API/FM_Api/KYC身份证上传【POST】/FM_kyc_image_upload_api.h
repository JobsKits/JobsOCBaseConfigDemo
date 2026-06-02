//
//  FM_kyc_image_upload_api.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if __has_include(<YTKNetworkExtra/BaseUploadFileRequest.h>)
#import <YTKNetworkExtra/BaseUploadFileRequest.h>
#else
#import "BaseUploadFileRequest.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// KYC身份证上传@POST
@interface FM_kyc_image_upload_api : BaseUploadFileRequest

@end

NS_ASSUME_NONNULL_END
