//
//  CasinoCustomerContactModel.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CasinoCustomerContactModel.h"

@implementation CasinoCustomerContactElementModel

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return [super mj_replacedKeyFromPropertyName].mutableCopy;
}

@end

@implementation CasinoCustomerContactModel

+(NSDictionary *)mj_objectClassInArray{
    return @{
        @"customerList" : CasinoCustomerContactElementModel.class
    };
}

@end
