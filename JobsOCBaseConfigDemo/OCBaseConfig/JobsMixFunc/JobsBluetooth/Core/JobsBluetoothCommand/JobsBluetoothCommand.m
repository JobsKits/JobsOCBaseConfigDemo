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

-(JobsBluetoothCommand *(^)(NSString *))byIdentifier{return ^JobsBluetoothCommand *(NSString *value){self.identifier = value;return self;};}
-(JobsBluetoothCommand *(^)(NSData *))byPayload{return ^JobsBluetoothCommand *(NSData *value){self.payload = value;return self;};}
-(JobsBluetoothCommand *(^)(NSTimeInterval))byTimeout{return ^JobsBluetoothCommand *(NSTimeInterval value){self.timeout = MAX(0, value);return self;};}
-(JobsBluetoothCommand *(^)(NSUInteger))byRetryCount{return ^JobsBluetoothCommand *(NSUInteger value){self.retryCount = value;return self;};}
-(JobsBluetoothCommand *(^)(NSInteger))byPriority{return ^JobsBluetoothCommand *(NSInteger value){self.priority = value;return self;};}
-(JobsBluetoothCommand *(^)(JobsBluetoothResponseMatcherBlock))byResponseMatcher{return ^JobsBluetoothCommand *(JobsBluetoothResponseMatcherBlock value){self.responseMatcher = value;return self;};}

@end
