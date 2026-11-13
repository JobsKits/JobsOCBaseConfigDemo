//
//  JobsDeviceCollectionClient.h
//  JobsDeviceDescription
//
//  Created by Jobs on 2026年11月6日，星期五.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Profile Service 配对专用传输；Cookie 与硬件字段只保留在内存中。
@interface JobsDeviceCollectionClient : NSObject

@property(nonatomic, readonly, nullable) NSDictionary *session;
@property(nonatomic, readonly, nullable) NSURL *browserURL;
@property(nonatomic, readonly) BOOL loading;
@property(nonatomic, readonly) NSURL *siteURL;
@property(nonatomic) NSTimeInterval requestTimeout;

-(void)requestCreatingPair:(BOOL)create
               completion:(void (^)(NSDictionary * _Nullable session, NSError * _Nullable error))completion;
-(void)clearRemotely:(BOOL)remote
         completion:(void (^)(BOOL cleared))completion;
/// 仅停止当前请求；页面返回后仍可刷新有效会话。
-(dispatch_block_t _Nonnull)cancelPendingRequest;

@end

NS_ASSUME_NONNULL_END
