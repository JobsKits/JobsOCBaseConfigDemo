//
//  UINavigationController+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UINavigationController+DSL.h"

@implementation UINavigationController (DSL)

-(JobsRetNavCtrByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UINavigationController *_Nullable(id<UINavigationControllerDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

@end
