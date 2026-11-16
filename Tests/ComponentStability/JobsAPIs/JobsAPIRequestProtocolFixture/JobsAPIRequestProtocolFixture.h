//
//  JobsAPIRequestProtocolFixture.h
//  JobsAPIs
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <Foundation/Foundation.h>

// 用途：声明测试替身（fixture）；拦截测试 URL 并观察请求体、错误和取消事件，避免访问真实服务器。
// 运行：由 JobsAPIs-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

NS_ASSUME_NONNULL_BEGIN
@interface JobsAPIRequestProtocolFixture : NSURLProtocol

+(void)setRequestObserver:(void (^_Nullable)(NSURLRequest *request, NSData *body))observer;
+(void)setStopObserver:(void (^_Nullable)(NSURLRequest *request))observer;

@end

NS_ASSUME_NONNULL_END
