//
//  JobsOCSkeletonUser.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSkeletonUser : NSObject

Prop_copy()NSString *name;
Prop_copy()NSString *detail;
Prop_strong()UIColor *color;

+(instancetype)userWithName:(NSString *)name
                     detail:(NSString *)detail
                      color:(UIColor *)color;
+(NSArray <JobsOCSkeletonUser *>*)mockUsersWithCount:(NSUInteger)count;

@end

NS_ASSUME_NONNULL_END
