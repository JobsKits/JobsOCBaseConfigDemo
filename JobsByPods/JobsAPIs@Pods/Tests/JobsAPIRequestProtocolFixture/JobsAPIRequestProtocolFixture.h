//
//  JobsAPIRequestProtocolFixture.h
//  JobsAPIs
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JobsAPIRequestProtocolFixture : NSURLProtocol
+(void)setRequestObserver:(void (^_Nullable)(NSURLRequest *request, NSData *body))observer;
+(void)setStopObserver:(void (^_Nullable)(NSURLRequest *request))observer;
@end
NS_ASSUME_NONNULL_END
