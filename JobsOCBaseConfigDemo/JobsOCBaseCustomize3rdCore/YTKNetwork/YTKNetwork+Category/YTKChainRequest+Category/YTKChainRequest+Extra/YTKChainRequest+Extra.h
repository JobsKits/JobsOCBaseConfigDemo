//
//  YTKChainRequest+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_YTKCHAINREQUEST_EXTRA_9150A4C912
#define JOBS_HEADER_GUARD_YTKCHAINREQUEST_EXTRA_9150A4C912

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface YTKChainRequest (Extra)
/// 开始网络请求
-(jobsByVoidBlock _Nonnull)go;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof YTKChainRequest *_Nonnull jobsMakeYTKChainRequest(jobsByYTKChainRequestBlock _Nonnull block){
    YTKChainRequest *data = YTKChainRequest.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_YTKCHAINREQUEST_EXTRA_9150A4C912 */
