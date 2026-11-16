//
//  JobsOCDeviceGuardConfiguration.h
//  JobsOCDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
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

@interface JobsOCDeviceGuardConfiguration : NSObject <NSCopying>

Prop_assign(readonly)BOOL sandboxWriteProbeEnabled;
Prop_assign(readonly)NSUInteger minimumDetectedCategories;
Prop_copy(readonly)NSArray<NSString *> *jailbreakPaths;
Prop_copy(readonly)NSArray<NSString *> *loadedImageNames;

+(JobsOCDeviceGuardConfiguration * _Nonnull (^ _Nonnull)(void))defaultConfiguration;
-(JobsRetJobsOCDeviceGuardConfigurationByBOOLBlock _Nonnull)bySandboxWriteProbeEnabled;
-(JobsRetJobsOCDeviceGuardConfigurationByNSUIntegerBlock _Nonnull)byMinimumDetectedCategories;

@end

NS_ASSUME_NONNULL_END
