//
//  YTKBaseRequest+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "YTKBaseRequest+DSL.h"

@implementation YTKBaseRequest (DSL)
-(JobsRetYTKBaseRequestByNSIntegerBlock _Nonnull)byTag{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.tag = data;
        return self;
    };
}

-(JobsRetYTKBaseRequestByDictionaryBlock _Nonnull)byUserInfo{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(JobsRetYTKBaseRequestByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(id<YTKRequestDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}

-(JobsRetYTKBaseRequestByPriorityBlock _Nonnull)byPriority{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(YTKRequestPriority data){
        @jobs_strongify(self)
        self.requestPriority = data;
        return self;
    };
}

-(JobsRetYTKBaseRequestByStringBlock _Nonnull)byResumableDownloadPath{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.resumableDownloadPath = data;
        return self;
    };
}

-(JobsRetYTKBaseRequestByProgressBlock _Nonnull)byDownloadProgress{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(AFURLSessionTaskProgressBlock _Nullable data){
        @jobs_strongify(self)
        self.resumableDownloadProgressBlock = data;
        return self;
    };
}

-(JobsRetYTKBaseRequestByProgressBlock _Nonnull)byUploadProgress{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(AFURLSessionTaskProgressBlock _Nullable data){
        @jobs_strongify(self)
        self.uploadProgressBlock = data;
        return self;
    };
}

-(JobsRetYTKBaseRequestByConstructingBlock _Nonnull)byConstructBody{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(AFConstructingBlock _Nullable data){
        @jobs_strongify(self)
        self.constructingBodyBlock = data;
        return self;
    };
}

-(JobsRetYTKBaseRequestByCompletionBlock _Nonnull)bySuccess{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(YTKRequestCompletionBlock _Nullable data){
        @jobs_strongify(self)
        self.successCompletionBlock = data;
        return self;
    };
}

-(JobsRetYTKBaseRequestByCompletionBlock _Nonnull)byFailure{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(YTKRequestCompletionBlock _Nullable data){
        @jobs_strongify(self)
        self.failureCompletionBlock = data;
        return self;
    };
}

-(JobsRetYTKBaseRequestByCompletionBlocks _Nonnull)byCompletion{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(YTKRequestCompletionBlock _Nullable success, YTKRequestCompletionBlock _Nullable failure){
        @jobs_strongify(self)
        [self setCompletionBlockWithSuccess:success failure:failure];
        return self;
    };
}

-(JobsRetYTKBaseRequestByAccessoryBlock _Nonnull)byAddAccessory{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(id<YTKRequestAccessory> _Nullable data){
        @jobs_strongify(self)
        if (data){
            [self addAccessory:data];
        };return self;
    };
}

-(JobsRetYTKBaseRequestByVoidBlock _Nonnull)byStart{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self start];
        return self;
    };
}

-(JobsRetYTKBaseRequestByVoidBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self stop];
        return self;
    };
}

-(JobsRetYTKBaseRequestByVoidBlock _Nonnull)byClearCompletion{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self clearCompletionBlock];
        return self;
    };
}

@end
