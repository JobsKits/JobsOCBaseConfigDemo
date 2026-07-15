//
//  UIBarButtonItem+Extra.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIBarButtonItem+Extra.h"

@implementation UIBarButtonItem (Extra)
+(JobsRetBarButtonItemByViewBlock _Nonnull)initBy{
    return ^__kindof UIBarButtonItem *_Nullable(__kindof UIView *_Nullable view){
        return [UIBarButtonItem.alloc initWithCustomView:view];
    };
}

-(JobsRetBarButtonItemByRACCommandBlock _Nonnull)byRacCommand{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(__kindof RACCommand *_Nullable command){
        @jobs_strongify(self)
        self.rac_command = command;
        return self;
    };
}

@end
