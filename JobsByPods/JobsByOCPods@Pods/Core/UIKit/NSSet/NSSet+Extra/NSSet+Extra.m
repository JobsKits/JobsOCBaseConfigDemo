//
//  NSSet+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSSet+Extra.h"

@implementation NSSet (Extra)
/// 对系统方法 setWithArray 的二次封装
+(JobsRetSetByArrBlock _Nonnull)initByArr{
    return ^__kindof NSSet *_Nullable(__kindof NSArray *_Nullable data){
        return [NSSet setWithArray:data];
    };
}

@end
