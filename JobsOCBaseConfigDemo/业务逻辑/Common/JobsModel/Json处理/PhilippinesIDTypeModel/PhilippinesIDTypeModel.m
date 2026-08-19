//
//  PhilippinesIDTypeModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PhilippinesIDTypeModel.h"

@implementation PhilippinesIDTypeModel
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return (((JobsRetDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(PhilippinesIDTypeModel.class, @selector(jobsMJReplacedKeyFromPropertyName)))(self, @selector(jobsMJReplacedKeyFromPropertyName)))();
}

+(JobsRetDicByVoidBlock _Nonnull)jobsMJReplacedKeyFromPropertyName {
    return ^NSDictionary *{
        return [super mj_replacedKeyFromPropertyName].mutableCopy;
    };
}

@end
