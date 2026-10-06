//
//  JobsOCSplashMediaDownloadToken.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCSplashMediaDownloadToken.h"

@interface JobsOCSplashMediaDownloadToken ()

@property(atomic, assign, readwrite, getter=isCancelled)BOOL cancelled;
@property(nonatomic, copy)jobsByVoidBlock cancellationHandler;
@property(nonatomic, strong)NSUUID *identifier;

@end

@implementation JobsOCSplashMediaDownloadToken

-(instancetype)initWithIdentifier:(NSUUID *)identifier cancellation:(jobsByVoidBlock)handler{
    if (self = [super init]) {
        _identifier = identifier;
        _cancellationHandler = [handler copy];
    }
    return self;
}

-(jobsByVoidBlock _Nonnull)cancel{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        jobsByVoidBlock handler = nil;
        @synchronized (self) {
            if (self.isCancelled) return;
            self.cancelled = YES;
            handler = self.cancellationHandler;
            self.cancellationHandler = nil;
        }
        if (handler) handler();
    };
}

-(void)dealloc{
    // 析构不调用弱捕获门面；释放 token 同样退订，避免无人使用的传输继续运行。
    jobsByVoidBlock handler = _cancellationHandler;
    _cancellationHandler = nil;
    if (handler) handler();
}

@end
