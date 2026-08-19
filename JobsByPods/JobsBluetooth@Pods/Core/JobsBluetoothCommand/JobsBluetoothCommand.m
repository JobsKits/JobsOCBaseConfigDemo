//
//  JobsBluetoothCommand.m
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "JobsBluetoothCommand.h"

@implementation JobsBluetoothCommand
-(instancetype)init{
    if (self = [super init]) {
        _identifier = NSUUID.UUID.UUIDString;
        _payload = NSData.data;
        _timeout = 5;
    };return self;
}

-(JobsRetJobsBluetoothCommandByNSStringBlock _Nonnull)byIdentifier{return ^JobsBluetoothCommand *(NSString *value){self.identifier = value;return self;};}
-(JobsRetJobsBluetoothCommandByNSDataBlock _Nonnull)byPayload{return ^JobsBluetoothCommand *(NSData *value){self.payload = value;return self;};}
-(JobsRetJobsBluetoothCommandByNSTimeIntervalBlock _Nonnull)byTimeout{return ^JobsBluetoothCommand *(NSTimeInterval value){self.timeout = MAX(0, value);return self;};}
-(JobsRetJobsBluetoothCommandByNSUIntegerBlock _Nonnull)byRetryCount{return ^JobsBluetoothCommand *(NSUInteger value){self.retryCount = value;return self;};}
-(JobsRetJobsBluetoothCommandByNSIntegerBlock _Nonnull)byPriority{return ^JobsBluetoothCommand *(NSInteger value){self.priority = value;return self;};}
-(JobsRetJobsBluetoothCommandByJobsBluetoothResponseMatcherBlockBlock _Nonnull)byResponseMatcher{return ^JobsBluetoothCommand *(JobsBluetoothResponseMatcherBlock value){self.responseMatcher = value;return self;};}

@end
