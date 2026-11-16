//
//  JobsOCDeviceGuardCheck.h
//  JobsOCDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import <Foundation/Foundation.h>
#import "JobsOCDeviceGuardTypes.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCDeviceGuardCheck : NSObject

Prop_assign(readonly)JobsOCDeviceGuardCategory category;
Prop_assign(readonly)JobsOCDeviceGuardCheckStatus status;
Prop_copy(readonly)NSString *identifier;
Prop_copy(readonly)NSString *detail;
Prop_assign(readonly)int errorCode;

-(instancetype)initWithCategory:(JobsOCDeviceGuardCategory)category
                         status:(JobsOCDeviceGuardCheckStatus)status
                     identifier:(NSString *)identifier
                         detail:(NSString *)detail
                      errorCode:(int)errorCode NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;
+(instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
