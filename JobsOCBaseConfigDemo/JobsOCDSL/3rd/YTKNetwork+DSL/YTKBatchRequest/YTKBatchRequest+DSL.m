//
//  YTKBatchRequest+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "YTKBatchRequest+DSL.h"

@implementation YTKBatchRequest (DSL)
-(NSArray<YTKRequest *> *)jobs_requests{
    return self.requestArray;
}

-(YTKRequest *)jobs_failedRequest{
    return self.failedRequest;
}

-(BOOL)jobs_isFromCache{
    return self.isDataFromCache;
}

-(JobsRetYTKBatchRequestByNSIntegerBlock _Nonnull)byTag{
    @jobs_weakify(self)
    return ^__kindof YTKBatchRequest *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.tag = data;
        return self;
    };
}

-(JobsRetYTKBatchRequestByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof YTKBatchRequest *_Nullable(id<YTKBatchRequestDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}

-(JobsRetYTKBatchRequestByAccessoryBlock _Nonnull)byAddAccessory{
    @jobs_weakify(self)
    return ^__kindof YTKBatchRequest *_Nullable(id<YTKRequestAccessory> _Nullable data){
        @jobs_strongify(self)
        if (data){
            [self addAccessory:data];
        };return self;
    };
}

-(JobsRetYTKBatchRequestByAccessoriesBlock _Nonnull)byAccessories{
    @jobs_weakify(self)
    return ^__kindof YTKBatchRequest *_Nullable(NSArray<id<YTKRequestAccessory>> *_Nullable data){
        @jobs_strongify(self)
        for (id<YTKRequestAccessory> accessory in data){
            [self addAccessory:accessory];
        };return self;
    };
}

-(JobsRetYTKBatchRequestBySuccessBlock _Nonnull)bySuccess{
    @jobs_weakify(self)
    return ^__kindof YTKBatchRequest *_Nullable(void (^ _Nullable data)(YTKBatchRequest *batchRequest)){
        @jobs_strongify(self)
        self.successCompletionBlock = data;
        return self;
    };
}

-(JobsRetYTKBatchRequestBySuccessBlock _Nonnull)byFailure{
    @jobs_weakify(self)
    return ^__kindof YTKBatchRequest *_Nullable(void (^ _Nullable data)(YTKBatchRequest *batchRequest)){
        @jobs_strongify(self)
        self.failureCompletionBlock = data;
        return self;
    };
}

-(JobsRetYTKBatchRequestByCompletionBlocks _Nonnull)byCompletion{
    @jobs_weakify(self)
    return ^__kindof YTKBatchRequest *_Nullable(void (^ _Nullable success)(YTKBatchRequest *batchRequest), void (^ _Nullable failure)(YTKBatchRequest *batchRequest)){
        @jobs_strongify(self)
        [self setCompletionBlockWithSuccess:success failure:failure];
        return self;
    };
}

-(JobsRetYTKBatchRequestByVoidBlock _Nonnull)byStart{
    @jobs_weakify(self)
    return ^__kindof YTKBatchRequest *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self start];
        return self;
    };
}

-(JobsRetYTKBatchRequestByVoidBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^__kindof YTKBatchRequest *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self stop];
        return self;
    };
}

-(JobsRetYTKBatchRequestByVoidBlock _Nonnull)byClearCompletion{
    @jobs_weakify(self)
    return ^__kindof YTKBatchRequest *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self clearCompletionBlock];
        return self;
    };
}

@end
