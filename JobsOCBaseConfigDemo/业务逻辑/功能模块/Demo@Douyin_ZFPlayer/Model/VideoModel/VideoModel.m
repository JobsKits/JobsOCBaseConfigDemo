//
//  VideoModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "VideoModel.h"

@implementation VideoModel_Core

-(JobsRetVideoModelCoreByStrBlock _Nonnull)byVideoTitle{
    @jobs_weakify(self)
    return ^__kindof VideoModel_Core *_Nullable(NSString *_Nullable string){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setVideoTitle:string];
        return self;
    };
}

-(JobsRetVideoModelCoreByStrBlock _Nonnull)byVideoImg{
    @jobs_weakify(self)
    return ^__kindof VideoModel_Core *_Nullable(NSString *_Nullable string){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setVideoImg:string];
        return self;
    };
}

-(JobsRetVideoModelCoreByStrBlock _Nonnull)byVideoIdcUrl{
    @jobs_weakify(self)
    return ^__kindof VideoModel_Core *_Nullable(NSString *_Nullable string){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setVideoIdcUrl:string];
        return self;
    };
}

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
