//
//  JobsMicroWeakScriptHandler.m
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "JobsMicroWeakScriptHandler.h"

@interface JobsMicroWeakScriptHandler ()

Prop_weak()id<WKScriptMessageHandler> target;

@end

@implementation JobsMicroWeakScriptHandler

-(instancetype)initWithTarget:(id<WKScriptMessageHandler>)target{
    self = [super init];
    if (self) {
        _target = target;
    }
    return self;
}

-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    [self.target userContentController:userContentController didReceiveScriptMessage:message];
}

@end
