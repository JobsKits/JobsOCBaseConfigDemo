//
//  VideoModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "VideoModel.h"

@implementation VideoModel_Core

@end

@implementation VideoModel

-(instancetype)init{
    if (self = [super init]) {
        [VideoModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                @"VideoModel_Core":@"listMutArr"
            };
        }];
    };return self;
}

@end
