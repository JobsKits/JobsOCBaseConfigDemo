//
//  YYWeakProxy.h
//  YYKits
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// Lightweight replacement for YYKit's YYWeakProxy to avoid bringing in the entire framework.
@interface YYWeakProxy : NSProxy

+ (instancetype)proxyWithTarget:(id)target;

@property (nonatomic, weak, readonly, nullable) id target;

@end

NS_ASSUME_NONNULL_END
