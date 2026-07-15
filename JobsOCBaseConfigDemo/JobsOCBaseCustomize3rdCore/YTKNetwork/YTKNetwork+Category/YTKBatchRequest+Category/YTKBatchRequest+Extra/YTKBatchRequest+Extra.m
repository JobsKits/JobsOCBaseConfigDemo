//
//  YTKBatchRequest+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "YTKBatchRequest+Extra.h"

@implementation YTKBatchRequest (Extra)
+(JobsRetBatchRequestByArrBlock _Nonnull)initByRequestArray{
    return ^__kindof YTKBatchRequest *_Nullable(__kindof NSArray <YTKRequest *>*_Nullable data){
        return [YTKBatchRequest.alloc initWithRequestArray:data];
    };
}

@end
