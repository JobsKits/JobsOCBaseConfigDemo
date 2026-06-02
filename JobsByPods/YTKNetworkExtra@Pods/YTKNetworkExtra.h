//
//  YTKNetworkExtra.h
//  YTKNetworkExtra
//
//  Created by Jobs on 2026年5月16日，星期六.
//

#ifndef YTKNetworkExtra_h
#define YTKNetworkExtra_h

#if __has_include(<YTKNetwork/YTKNetworkConfig.h>)
#import <YTKNetwork/YTKNetworkConfig.h>
#else
#import "YTKNetworkConfig.h"
#endif

#import <YTKNetworkExtra/YTKNetworkToolsHeader.h>
#import <YTKNetworkExtra/NSObject+YTKNetwork.h>
#import <YTKNetworkExtra/JobsResponseModel+YTKNetwork.h>
#import <YTKNetworkExtra/BaseRequest.h>
#import <YTKNetworkExtra/BaseUploadFileRequest.h>

NS_INLINE __kindof YTKNetworkConfig *_Nonnull jobsMakeYTKNetworkConfig(jobsByYTKNetworkConfigBlock _Nonnull block){
    YTKNetworkConfig *data = YTKNetworkConfig.sharedConfig;
    if (block) block(data);
    return data;
}

#endif /* YTKNetworkExtra_h */
