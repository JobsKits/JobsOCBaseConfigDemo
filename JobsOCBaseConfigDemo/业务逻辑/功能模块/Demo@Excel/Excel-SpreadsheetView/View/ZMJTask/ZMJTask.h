//
//  ZMJTask.h
//  ZMJGanttList
//
//  Created by Jason on 2018/2/27.
//  Copyright © 2018年 keshiim. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DefineProperty.h"

@interface ZMJTask : NSObject
/// lol
Prop_copy()NSString *taskName;
/// 任务描述 - description
Prop_copy()NSString *taskDesc;
/// 发起人
Prop_strong()NSString *createdByUser;
/// 发起时间
Prop_copy()NSString *createdAt;
/// start
Prop_copy()NSDate *startDate;
/// due
Prop_copy()NSDate *dueDate;

+(instancetype)taskWithName:(NSString *)taskName
                  startDate:(NSDate *)startDate
                    endDate:(NSDate *)endDate;

@end
