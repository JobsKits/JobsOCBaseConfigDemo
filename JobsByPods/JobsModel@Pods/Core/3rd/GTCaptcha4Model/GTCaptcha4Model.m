//
//  GTCaptcha4Model.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "GTCaptcha4Model.h"

@implementation GTCaptcha4Model

+(NSDictionary *)mj_objectClassInArray {
    return @{
        @"result" : GTCaptcha4ResultModel.class
    };
}

@end

