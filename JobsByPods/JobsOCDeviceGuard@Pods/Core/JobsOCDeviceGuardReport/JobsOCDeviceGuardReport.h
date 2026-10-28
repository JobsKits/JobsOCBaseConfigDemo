//
//  JobsOCDeviceGuardReport.h
//  JobsOCDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import <Foundation/Foundation.h>
#import "JobsOCDeviceGuardCheck.h"
#import "JobsOCDeviceGuardConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCDeviceGuardReport : NSObject

Prop_assign(readonly)JobsOCDeviceGuardVerdict verdict;
Prop_copy(readonly)NSArray<JobsOCDeviceGuardCheck *> *checks;
Prop_copy(readonly)NSSet<NSNumber *> *detectedCategories;
Prop_copy(readonly)NSString *unsupportedReason;
Prop_assign(readonly)BOOL shouldRestrict;
Prop_assign(readonly)BOOL isJailbroken;
Prop_assign(readonly)NSTimeInterval timestamp;
Prop_copy(readonly)NSString *summaryText;

/// 纯判定入口，便于审计和离线单元验证；unsupportedReason非空时优先判不支持。
-(instancetype)initWithChecks:(NSArray<JobsOCDeviceGuardCheck *> *)checks
                configuration:(JobsOCDeviceGuardConfiguration *)configuration
            unsupportedReason:(NSString *)unsupportedReason NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;
+(instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
