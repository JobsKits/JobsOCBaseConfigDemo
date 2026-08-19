//
//  IncomeSourceModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "IncomeSourceModel.h"

@implementation IncomeSourceModel
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return (((JobsRetDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(IncomeSourceModel.class, @selector(jobsMJReplacedKeyFromPropertyName)))(self, @selector(jobsMJReplacedKeyFromPropertyName)))();
}

+(JobsRetDicByVoidBlock _Nonnull)jobsMJReplacedKeyFromPropertyName {
    return ^NSDictionary *{
        return [super mj_replacedKeyFromPropertyName].mutableCopy;
    };
}

@end
