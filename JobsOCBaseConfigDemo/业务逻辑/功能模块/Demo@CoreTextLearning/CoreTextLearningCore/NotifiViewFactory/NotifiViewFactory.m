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

+ (instancetype)shared {
    static NotifiViewFactory *factory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        factory = [[self alloc] init];
    });return factory;
}

- (void)setNotifiViews:(NSArray *)notifiViews{
    _notifiViews = notifiViews;
}

- (void)fetchAvailableView:(void (^)(NotifiView * _Nonnull))block{
    for (NotifiView* v in self.notifiViews) {
        if (v.state == NotifiViewStateInit ||
            v.state == NotifiViewStateFinish) {
            v.state = NotifiViewStateReady;
            if (block) block(v);
            return;
        }
    }
}

- (NotifiView *)fetchViewWithKey:(NSString*)key{
    for (NotifiView* v in self.notifiViews) {
        if ([v.key isEqualToString:key]) {
            return v;
        }
    };return nil;
}

@end
