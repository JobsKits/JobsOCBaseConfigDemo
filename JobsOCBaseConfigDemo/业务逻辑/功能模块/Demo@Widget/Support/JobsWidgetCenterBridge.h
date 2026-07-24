//
//  JobsWidgetCenterBridge.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsWidgetCenterBridge : NSObject

+(NSInteger)counter;
+(void)saveCounter:(NSInteger)counter;
+(void)reloadTimelines;

@end

NS_ASSUME_NONNULL_END
