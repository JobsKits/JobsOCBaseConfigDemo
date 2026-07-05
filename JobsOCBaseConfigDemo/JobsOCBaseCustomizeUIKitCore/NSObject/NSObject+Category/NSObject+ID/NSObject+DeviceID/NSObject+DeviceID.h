//
//  NSObject+DeviceID.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_DEVICEID_4354B1AD1B
#define JOBS_HEADER_GUARD_NSOBJECT_DEVICEID_4354B1AD1B

#import <Foundation/Foundation.h>
#import <Security/Security.h>

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DeviceID)
/**

     我们可以获取到UUID，然后把UUID保存到KeyChain里面。
     这样以后即使APP删了再装回来，也可以从KeyChain中读取回来。使用group还可以可以保证同一个开发商的所有程序针对同一台设备能够获取到相同的不变的UDID。
     但是刷机或重装系统后uuid还是会改变。
 */
-(void)deleteDeviceID;
-(NSString *)deviceID;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_DEVICEID_4354B1AD1B */
