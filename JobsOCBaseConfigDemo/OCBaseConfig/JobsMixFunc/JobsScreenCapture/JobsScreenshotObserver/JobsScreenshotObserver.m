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

@implementation JobsScreenshotObserver

-(void)dealloc{
    [self stop];
}

-(instancetype)startWithHandler:(jobsByVoidBlock)handler{
    [self stop];
    self.screenshotHandler = handler;
    @jobs_weakify(self)
    self.screenshotToken = [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationUserDidTakeScreenshotNotification
                                                                            object:nil
                                                                             queue:NSOperationQueue.mainQueue
                                                                        usingBlock:^(__unused NSNotification *note) {
        @jobs_strongify(self)
        if (self.screenshotHandler) self.screenshotHandler();
    }];return self;
}

-(instancetype)stop{
    if (self.screenshotToken) {
        [NSNotificationCenter.defaultCenter removeObserver:self.screenshotToken];
    }
    self.screenshotToken = nil;
    self.screenshotHandler = nil;
    return self;
}

@end
