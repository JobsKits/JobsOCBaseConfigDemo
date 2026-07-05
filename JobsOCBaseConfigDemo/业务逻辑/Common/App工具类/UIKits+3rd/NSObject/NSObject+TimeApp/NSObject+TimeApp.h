//
//  NSObject+TimeApp.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#import "JobsModelDSL.h"

#import "JobsMakes.h"

#import "JobsByOCPods.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (TimeApp)
/// 判断是否当日第一次启动App
-(BOOL)isFirstLaunchApp;

@end

NS_ASSUME_NONNULL_END
/**

     时间为2024-12-05 15:30:00（北京时间，UTC+8）。
     秒级时间戳：1701761400
     毫秒级别时间戳：1701761400000
     其对应的 NSTimeInterval timeInterval : 1701761400.0

     无论是秒级还是毫秒级时间戳，经过必要的处理后，最终的 NSTimeInterval 都是相同的

     ❤️字符串时间戳转化为可读❤️
     @"1701761400000".readableTimeByFormatter(@"yyyy-MM-dd");
     @"1701761400".readableTimeByFormatter(@"yyyy-MM-dd");
     ❤️NSDate 类型的时间转化为可读❤️
     NSDate.date.toReadableTime(jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
                   data.dateFormat = @"yyyy"
                       .add(@"-")
                       .add(@"MM");
               }));

     NSDate.date.toReadableTimeBy(@"yyyy".add(@"-").add(@"MM"));
     ❤️NSTimeInterval 类型的时间转化为可读❤️
     self.toReadableTimeBy(timeInterval);
     或者:
     self.dateByTimeInterval(111).toReadableTime(nil);
 */
