//
//  ZMJTask.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ZMJTask.h"

@implementation ZMJTask

+(instancetype)taskWithName:(NSString *)taskName
                  startDate:(NSDate *)startDate
                    endDate:(NSDate *)endDate {
    ZMJTask *task = [self new];
    task.taskName  = taskName;
    task.startDate = startDate;
    task.dueDate   = endDate;
    return task;
}

@end
