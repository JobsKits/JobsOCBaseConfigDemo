//
//  JobsBluetoothMockTransport.h
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 无硬件环境的确定性数据源，用于模拟器 Demo、录制回放和单元测试。
@interface JobsBluetoothMockTransport : NSObject

Prop_assign()NSTimeInterval latency;
Prop_assign()BOOL enabled;
Prop_copy(readonly)JobsBluetoothMockTransport *(^byLatency)(NSTimeInterval latency);
Prop_copy(readonly)JobsBluetoothMockTransport *(^byEnabled)(BOOL enabled);

-(JobsRetNSArrayNSDictionaryNSStringIDByVoidBlock _Nonnull)mockAdvertisements;
-(void)echoData:(NSData *)data completion:(void (^)(NSData *response))completion;

@end

NS_ASSUME_NONNULL_END
