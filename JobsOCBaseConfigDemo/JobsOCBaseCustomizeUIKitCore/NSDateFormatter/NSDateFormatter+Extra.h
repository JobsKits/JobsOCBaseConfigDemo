//
//  NSDateFormatter+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef NSDateFormatter_Extra_h
#define NSDateFormatter_Extra_h

#import <Foundation/Foundation.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDateFormatter (Extra)
/// 对系统方法 stringFromDate 的二次封装
-(JobsRetStrByDateBlock _Nonnull)stringByDate;
/// 对系统方法 dateFromString 的二次封装
-(JobsRetDateByStrBlock _Nonnull)dateByString;

@end

NS_ASSUME_NONNULL_END

//NS_INLINE __kindof NSDateFormatter *_Nonnull jobsMakeDateFormatter(jobsByLabelBlock _Nonnull block){
//    NSDateFormatter *data = NSDateFormatter.alloc.init;
//    if (block) block(data);
//    return data;
//}

#endif /* NSDateFormatter_Extra_h */
