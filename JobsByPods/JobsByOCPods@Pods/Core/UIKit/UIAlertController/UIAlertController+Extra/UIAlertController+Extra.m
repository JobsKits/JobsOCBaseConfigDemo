//
//  UIAlertController+Extra.m
//  JobsByOCPods
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

-(JobsRetAlertCrtlByStringBlock _Nonnull)byMessage{
    @jobs_weakify(self)
    return ^__kindof UIAlertController *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.message = data;
        return self;
    };
}

@end
