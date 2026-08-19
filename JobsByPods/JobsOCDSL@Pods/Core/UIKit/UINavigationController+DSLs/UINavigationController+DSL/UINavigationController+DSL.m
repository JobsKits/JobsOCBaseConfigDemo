//
//  UINavigationController+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UINavigationController+DSL.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UINavigationController
@interface UINavigationController (JobsPropertyDSLSetterAutogen_d6f6af419e)
-(void)setModalPresentationStyle:(UIModalPresentationStyle)data;
-(void)setNavigationBarHidden:(BOOL)data;
-(void)setViewTransitionInProgress:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UINavigationController

@implementation UINavigationController (DSL)
-(JobsRetNavCtrByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UINavigationController *_Nullable(id<UINavigationControllerDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UINavigationController
-(JobsRetUINavigationControllerByBOOLBlock _Nonnull)byViewTransitionInProgress{
    @jobs_weakify(self)
    return ^__kindof UINavigationController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setViewTransitionInProgress:data];
        return self;
    };
}
-(JobsRetUINavigationControllerByUIModalPresentationStyleBlock _Nonnull)byModalPresentationStyle{
    @jobs_weakify(self)
    return ^__kindof UINavigationController * _Nullable(UIModalPresentationStyle data){
        @jobs_strongify(self)
        [self setModalPresentationStyle:data];
        return self;
    };
}
-(JobsRetUINavigationControllerByBOOLBlock _Nonnull)byNavigationBarHidden{
    @jobs_weakify(self)
    return ^__kindof UINavigationController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setNavigationBarHidden:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UINavigationController
@end
