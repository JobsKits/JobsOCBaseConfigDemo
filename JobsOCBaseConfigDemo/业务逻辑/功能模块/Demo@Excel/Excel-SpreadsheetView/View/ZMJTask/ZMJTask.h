//
//  ZMJTask.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

@interface ZMJTask : NSObject
/// lol
@property(copy,nonatomic)NSString *taskName;
/// 任务描述 - description
@property(copy,nonatomic)NSString *taskDesc;
/// 发起人
@property(strong,nonatomic)NSString *createdByUser;
/// 发起时间
@property(copy,nonatomic)NSString *createdAt;
/// start
@property(copy,nonatomic)NSDate *startDate;
/// due
@property(copy,nonatomic)NSDate *dueDate;

+(instancetype)taskWithName:(NSString *)taskName
                  startDate:(NSDate *)startDate
                    endDate:(NSDate *)endDate;

@end
