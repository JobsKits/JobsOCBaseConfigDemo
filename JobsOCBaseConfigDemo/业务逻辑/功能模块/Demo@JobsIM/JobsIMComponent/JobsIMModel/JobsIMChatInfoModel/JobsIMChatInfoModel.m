//
//  JobsIMChatInfoModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsIMChatInfoModel.h"

@implementation JobsIMChatInfoModel

-(NSString *)identification{
    if (!_identification) {
        _identification = @"我是我自己";
    }return _identification;
}

@end
