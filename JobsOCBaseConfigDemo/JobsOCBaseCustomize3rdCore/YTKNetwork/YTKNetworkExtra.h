//
//  YTKNetworkExtra.h
//  YTKNetworkExtra
//
//  Created by Jobs on 2026年5月16日，星期六.
//

#ifndef YTKNetworkExtra_h
#define YTKNetworkExtra_h

#import "YTKNetworkToolsHeader.h"
#import "NSObject+YTKNetwork.h"
#import "JobsResponseModel+YTKNetwork.h"
#import "BaseRequest.h"
#import "BaseUploadFileRequest.h"

#if __has_include(<YTKNetwork/YTKNetworkConfig.h>)
#import <YTKNetwork/YTKNetworkConfig.h>
#else
#import "YTKNetworkConfig.h"
#endif

#ifndef JOBS_MAKE_YTKNETWORKCONFIG
#define JOBS_MAKE_YTKNETWORKCONFIG
NS_INLINE __kindof YTKNetworkConfig *_Nonnull jobsMakeYTKNetworkConfig(jobsByYTKNetworkConfigBlock _Nonnull block){
    YTKNetworkConfig *data = YTKNetworkConfig.sharedConfig;
    if (block) block(data);
    return data;
}
#endif /* JOBS_MAKE_YTKNETWORKCONFIG */

#endif /* YTKNetworkExtra_h */
