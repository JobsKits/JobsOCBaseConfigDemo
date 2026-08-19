//
//  CasinoCustomerContactModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CasinoCustomerContactModel.h"

@implementation CasinoCustomerContactElementModel
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return (((JobsRetDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(CasinoCustomerContactElementModel.class, @selector(jobsMJReplacedKeyFromPropertyName)))(self, @selector(jobsMJReplacedKeyFromPropertyName)))();
}

+(JobsRetDicByVoidBlock _Nonnull)jobsMJReplacedKeyFromPropertyName {
    return ^NSDictionary *{
        return [super mj_replacedKeyFromPropertyName].mutableCopy;
    };
}

@end

@implementation CasinoCustomerContactModel
+(NSDictionary *)mj_objectClassInArray{
    return (((JobsRetDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(CasinoCustomerContactModel.class, @selector(jobsMJObjectClassInArray)))(self, @selector(jobsMJObjectClassInArray)))();
}

+(JobsRetDicByVoidBlock _Nonnull)jobsMJObjectClassInArray{
    return ^NSDictionary *{
        return @{
            @"customerList" : CasinoCustomerContactElementModel.class
        };
    };
}

@end
