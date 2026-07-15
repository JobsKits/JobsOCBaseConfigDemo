//
//  UIAlertController+Extra.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIAlertController+Extra.h"

@implementation UIAlertController (Extra)
-(JobsRetAlertCtrlByActionBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^UIAlertController *_Nullable(UIAlertAction *_Nonnull action) {
        @jobs_strongify(self)
        [self addAction:action];
        return self;
    };
}

@end
