//
//  JobsScreenshotObserver.m
//  JobsScreenCapture
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsScreenshotObserver.h"

@interface JobsScreenshotObserver ()

Prop_strong()id <NSObject>screenshotToken;
Prop_copy()jobsByVoidBlock screenshotHandler;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsScreenshotObserver
@interface JobsScreenshotObserver (JobsPropertyDSLSetterAutogen_206dd8f20a)
-(void)setScreenshotHandler:(jobsByVoidBlock)data;
-(void)setScreenshotToken:(id <NSObject> _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsScreenshotObserver

@implementation JobsScreenshotObserver

-(void)dealloc{
    (((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsScreenshotObserver.class, @selector(jobsStop)))(self, @selector(jobsStop)))();
}

-(JobsRetIDByVoidBlocks _Nonnull)startWithHandler{
    @jobs_weakify(self)
    return ^id(jobsByVoidBlock handler){
        @jobs_strongify(self)
        if (!self) return nil;
        self.jobsStop();
        self.byScreenshotHandler(handler);
        @jobs_weakify(self)
        self.screenshotToken = [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationUserDidTakeScreenshotNotification
                                                                                object:nil
                                                                                 queue:NSOperationQueue.mainQueue
                                                                            usingBlock:^(__unused NSNotification *note) {
            @jobs_strongify(self)
            if (self.screenshotHandler) self.screenshotHandler();
        }];return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)jobsStop{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        if (self.screenshotToken) {
            [NSNotificationCenter.defaultCenter removeObserver:self.screenshotToken];
        }
        self.byScreenshotToken(nil);
        self.byScreenshotHandler(nil);
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsScreenshotObserver
-(JobsRetJobsScreenshotObserverByIDNSObjectBlock _Nonnull)byScreenshotToken{
    @jobs_weakify(self)
    return ^__kindof JobsScreenshotObserver * _Nullable(id <NSObject> _Nullable data){
        @jobs_strongify(self)
        [self setScreenshotToken:data];
        return self;
    };
}

-(JobsRetJobsScreenshotObserverByjobsByVoidBlockBlock _Nonnull)byScreenshotHandler{
    @jobs_weakify(self)
    return ^__kindof JobsScreenshotObserver * _Nullable(jobsByVoidBlock data){
        @jobs_strongify(self)
        [self setScreenshotHandler:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsScreenshotObserver
@end
