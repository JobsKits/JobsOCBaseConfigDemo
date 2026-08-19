//
//  JobsBluetoothFeatureDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "JobsBluetoothDemoVC.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsBluetoothFeatureDemoVC : BaseViewController

-(instancetype)initWithFeatureIndex:(NSInteger)featureIndex
                       featureTitle:(NSString *)featureTitle NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
