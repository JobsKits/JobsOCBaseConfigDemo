//
//  JobsOCCrashLogMemorySnapshot.h
//  JobsOCTools
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <stdint.h>
#import <Foundation/Foundation.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCCrashLogMemorySnapshot : NSObject

Prop_assign(readonly)uint64_t footprintBytes;
Prop_assign(readonly)uint64_t residentBytes;
Prop_assign(readonly)uint64_t peakFootprintBytes;
Prop_assign(readonly)int64_t growthBytes;
Prop_copy(readonly)NSString *screen;
Prop_copy(readonly)NSString *appState;
Prop_strong(readonly)NSDate *timestamp;

-(instancetype)initWithFootprintBytes:(uint64_t)footprintBytes
                        residentBytes:(uint64_t)residentBytes
                   peakFootprintBytes:(uint64_t)peakFootprintBytes
                          growthBytes:(int64_t)growthBytes
                               screen:(NSString *)screen
                             appState:(NSString *)appState
                            timestamp:(NSDate *)timestamp NS_DESIGNATED_INITIALIZER;

-(instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
