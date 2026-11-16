//
//  JobsOCCrashLogMemorySnapshot.m
//  JobsOCTools
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsOCCrashLogMemorySnapshot.h"

@implementation JobsOCCrashLogMemorySnapshot

-(instancetype)initWithFootprintBytes:(uint64_t)footprintBytes
                        residentBytes:(uint64_t)residentBytes
                   peakFootprintBytes:(uint64_t)peakFootprintBytes
                          growthBytes:(int64_t)growthBytes
                               screen:(NSString *)screen
                             appState:(NSString *)appState
                            timestamp:(NSDate *)timestamp{
    if (self = [super init]) {
        _footprintBytes = footprintBytes;
        _residentBytes = residentBytes;
        _peakFootprintBytes = peakFootprintBytes;
        _growthBytes = growthBytes;
        _screen = screen.copy;
        _appState = appState.copy;
        _timestamp = timestamp;
    };return self;
}

@end
