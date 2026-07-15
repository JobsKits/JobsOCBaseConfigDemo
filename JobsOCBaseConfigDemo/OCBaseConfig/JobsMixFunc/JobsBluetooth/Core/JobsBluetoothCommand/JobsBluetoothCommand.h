//
//  JobsBluetoothCommand.h
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#import "JobsBluetoothTypes.h"

NS_ASSUME_NONNULL_BEGIN

/// 一条可排队、可超时、可重试、可匹配响应的设备命令。
@interface JobsBluetoothCommand : NSObject

Prop_copy()NSString *identifier;
Prop_strong()NSData *payload;
Prop_assign()NSTimeInterval timeout;
Prop_assign()NSUInteger retryCount;
Prop_assign()NSInteger priority;
Prop_copy(nullable)JobsBluetoothResponseMatcherBlock responseMatcher;
Prop_copy(readonly)JobsBluetoothCommand *(^byIdentifier)(NSString *identifier);
Prop_copy(readonly)JobsBluetoothCommand *(^byPayload)(NSData *payload);
Prop_copy(readonly)JobsBluetoothCommand *(^byTimeout)(NSTimeInterval timeout);
Prop_copy(readonly)JobsBluetoothCommand *(^byRetryCount)(NSUInteger retryCount);
Prop_copy(readonly)JobsBluetoothCommand *(^byPriority)(NSInteger priority);
Prop_copy(readonly)JobsBluetoothCommand *(^byResponseMatcher)(JobsBluetoothResponseMatcherBlock matcher);

@end

NS_ASSUME_NONNULL_END
