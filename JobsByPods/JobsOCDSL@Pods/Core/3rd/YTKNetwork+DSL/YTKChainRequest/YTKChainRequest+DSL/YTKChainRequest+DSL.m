//
//  YTKChainRequest+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "YTKChainRequest+DSL.h"

@interface JobsYTKChainDelegateProxy : NSObject <YTKChainRequestDelegate>

Prop_weak(nullable)id<YTKChainRequestDelegate> realDelegate;
Prop_copy(nullable)JobsYTKChainSuccessBlock successBlock;
Prop_copy(nullable)JobsYTKChainFailureBlock failureBlock;

@end

@implementation JobsYTKChainDelegateProxy
-(void)chainRequestFinished:(YTKChainRequest *)chainRequest{
    if (self.successBlock) self.successBlock(chainRequest);
    if ([self.realDelegate respondsToSelector:@selector(chainRequestFinished:)]){
        [self.realDelegate chainRequestFinished:chainRequest];
    }
}

-(void)chainRequestFailed:(YTKChainRequest *)chainRequest failedBaseRequest:(YTKBaseRequest *)request{
    if (self.failureBlock) self.failureBlock(chainRequest, request);
    if ([self.realDelegate respondsToSelector:@selector(chainRequestFailed:failedBaseRequest:)]){
        [self.realDelegate chainRequestFailed:chainRequest failedBaseRequest:request];
    }
}

@end

@implementation YTKChainRequest (DSL)
JobsKey(JobsYTKChainDelegateProxyKey)
-(NSArray<YTKBaseRequest *> *)jobs_requests{
    return self.requestArray;
}

-(JobsRetJobsYTKChainDelegateProxyByVoidBlock _Nonnull)jobs_chainProxy{
    @jobs_weakify(self)
    return ^JobsYTKChainDelegateProxy *{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsYTKChainDelegateProxy *proxy = Jobs_getAssociatedObject(JobsYTKChainDelegateProxyKey);
        if (!proxy){
            proxy = JobsYTKChainDelegateProxy.new;
            Jobs_setAssociatedRETAIN_NONATOMIC(JobsYTKChainDelegateProxyKey, proxy)
        }
        self.delegate = proxy;
        return proxy;
    };
}

-(JobsRetYTKChainRequestByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof YTKChainRequest *_Nullable(id<YTKChainRequestDelegate> _Nullable data){
        @jobs_strongify(self)
        self.jobs_chainProxy().realDelegate = data;
        return self;
    };
}

-(JobsRetYTKChainRequestByAccessoryBlock _Nonnull)byAddAccessory{
    @jobs_weakify(self)
    return ^__kindof YTKChainRequest *_Nullable(id<YTKRequestAccessory> _Nullable data){
        @jobs_strongify(self)
        if (data){
            [self addAccessory:data];
        };return self;
    };
}

-(JobsRetYTKChainRequestByAccessoriesBlock _Nonnull)byAccessories{
    @jobs_weakify(self)
    return ^__kindof YTKChainRequest *_Nullable(NSArray<id<YTKRequestAccessory>> *_Nullable data){
        @jobs_strongify(self)
        for (id<YTKRequestAccessory> accessory in data){
            [self addAccessory:accessory];
        };return self;
    };
}

-(JobsRetYTKChainRequestByRequestCallbackBlock _Nonnull)byAdd{
    @jobs_weakify(self)
    return ^__kindof YTKChainRequest *_Nullable(__kindof YTKBaseRequest *_Nonnull request, YTKChainCallback _Nullable callback){
        @jobs_strongify(self)
        [self addRequest:request callback:callback];
        return self;
    };
}

-(JobsRetYTKChainRequestByRequestsBlock _Nonnull)byAddRequests{
    @jobs_weakify(self)
    return ^__kindof YTKChainRequest *_Nullable(NSArray<__kindof YTKBaseRequest *> *_Nullable data){
        @jobs_strongify(self)
        for (YTKBaseRequest *request in data){
            [self addRequest:request callback:nil];
        };return self;
    };
}

-(JobsRetYTKChainRequestBySuccessBlock _Nonnull)bySuccess{
    @jobs_weakify(self)
    return ^__kindof YTKChainRequest *_Nullable(JobsYTKChainSuccessBlock _Nullable data){
        @jobs_strongify(self)
        self.jobs_chainProxy().successBlock = data;
        return self;
    };
}

-(JobsRetYTKChainRequestByFailureBlock _Nonnull)byFailure{
    @jobs_weakify(self)
    return ^__kindof YTKChainRequest *_Nullable(JobsYTKChainFailureBlock _Nullable data){
        @jobs_strongify(self)
        self.jobs_chainProxy().failureBlock = data;
        return self;
    };
}

-(JobsRetYTKChainRequestByCompletionBlocks _Nonnull)byCompletion{
    @jobs_weakify(self)
    return ^__kindof YTKChainRequest *_Nullable(JobsYTKChainSuccessBlock _Nullable success, JobsYTKChainFailureBlock _Nullable failure){
        @jobs_strongify(self)
        self.jobs_chainProxy().successBlock = success;
        self.jobs_chainProxy().failureBlock = failure;
        return self;
    };
}

-(JobsRetYTKChainRequestByCompletionBlocks _Nonnull)byJobsVoidBlock{
    return self.byCompletion;
}

-(JobsRetYTKChainRequestByVoidBlock _Nonnull)byStart{
    @jobs_weakify(self)
    return ^__kindof YTKChainRequest *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self start];
        return self;
    };
}

-(JobsRetYTKChainRequestByVoidBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^__kindof YTKChainRequest *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self stop];
        return self;
    };
}

@end
