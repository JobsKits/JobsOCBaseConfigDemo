//
//  NotifiViewFactory.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NotifiViewFactory.h"

@interface NotifiViewFactory()

@end

@implementation NotifiViewFactory
+ (JobsRetIDByVoidBlock _Nonnull)shared {
    return ^id{
        static NotifiViewFactory *factory = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            factory = [[self alloc] init];
        });return factory;
    };
}

-(void)setNotifiViews:(NSArray *)notifiViews{
    jobsByNSArrayBlock action = ((jobsByNSArrayBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NotifiViewFactory.class, @selector(jobsSetNotifiViews)))(self, @selector(jobsSetNotifiViews));
    if (action) action(notifiViews);
}

-(jobsByNSArrayBlock _Nonnull)jobsSetNotifiViews{
    @jobs_weakify(self)
    return ^(NSArray * notifiViews){
        @jobs_strongify(self)
        if (!self) return;
        _notifiViews = notifiViews;
    };
}

-(jobsByvoidNotifiViewBlock _Nonnull)fetchAvailableView{
    @jobs_weakify(self)
    return ^(void (^block)(NotifiView * _Nonnull)){
        @jobs_strongify(self)
        if (!self) return;
        for (NotifiView* v in self.notifiViews) {
            if (v.state == NotifiViewStateInit ||
                v.state == NotifiViewStateFinish) {
                v.byState(NotifiViewStateReady);
                if (block) block(v);
                return;
            }
        }
    };
}

-(JobsRetNotifiViewByNSStringBlock _Nonnull)fetchViewWithKey{
    @jobs_weakify(self)
    return ^NotifiView *(NSString* key){
        @jobs_strongify(self)
        if (!self) return nil;
        for (NotifiView* v in self.notifiViews) {
            if ([v.key isEqualToString:key]) {
                return v;
            }
        };return nil;
    };
}

@end
