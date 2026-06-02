//
//  YTKChainRequest+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "YTKChainRequest+Extra.h"

@implementation YTKChainRequest (Extra)
/// 开始网络请求
-(jobsByVoidBlock _Nonnull)go{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self start];
    };
}

@end
