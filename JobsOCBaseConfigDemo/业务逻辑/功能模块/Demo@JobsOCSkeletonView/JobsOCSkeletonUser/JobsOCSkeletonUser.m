//
//  JobsOCSkeletonUser.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsOCSkeletonUser.h"

@implementation JobsOCSkeletonUser
+(instancetype)userWithName:(NSString *)name
                     detail:(NSString *)detail
                      color:(UIColor *)color{
    JobsOCSkeletonUser *user = self.new;
    user.name = name;
    user.detail = detail;
    user.color = color;
    return user;
}

+(NSArray<JobsOCSkeletonUser *> *)mockUsersWithCount:(NSUInteger)count{
    NSArray <NSString *>*names = @[@"Alice", @"Bob", @"Cindy", @"David", @"Eva", @"Frank", @"Grace", @"Henry", @"Iris", @"Jack", @"Kate", @"Leo", @"Mia", @"Nina", @"Owen", @"Paul", @"Quinn", @"Ruby", @"Sam", @"Tina"];
    NSArray <NSString *>*details = @[
        @"这是一段较短的简介。",
        @"这里是两行简介，展示骨架文本的多行效果。第二行用来填充视觉。",
        @"偏长的描述，目的是让 subtitleLabel 在骨架时出现 2 行以上，从而看到末行短一点的视觉节奏。"
    ];
    NSArray <UIColor *>*colors = @[
        UIColor.systemBlueColor,
        UIColor.systemTealColor,
        UIColor.systemPinkColor,
        UIColor.systemOrangeColor,
        UIColor.systemPurpleColor,
        UIColor.systemGreenColor,
        UIColor.systemIndigoColor,
        UIColor.systemRedColor
    ];
    NSMutableArray <JobsOCSkeletonUser *>*data = NSMutableArray.array;
    for (NSUInteger i = 0; i < count; i++) {
        [data addObject:[self userWithName:names[i % names.count]
                                    detail:details[i % details.count]
                                     color:colors[i % colors.count]]];
    };return data.copy;
}

@end
