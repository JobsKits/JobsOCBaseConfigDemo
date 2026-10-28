//
//  JobsOCDeviceGuardCheck.m
//  JobsOCDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsOCDeviceGuardCheck.h"

@implementation JobsOCDeviceGuardCheck

-(instancetype)initWithCategory:(JobsOCDeviceGuardCategory)category
                         status:(JobsOCDeviceGuardCheckStatus)status
                     identifier:(NSString *)identifier
                         detail:(NSString *)detail
                      errorCode:(int)errorCode {
    if (self = [super init]) {
        _category = category;
        _status = status;
        _identifier = [identifier copy];
        _detail = [detail copy];
        _errorCode = errorCode;
    }
    return self;
}

@end
