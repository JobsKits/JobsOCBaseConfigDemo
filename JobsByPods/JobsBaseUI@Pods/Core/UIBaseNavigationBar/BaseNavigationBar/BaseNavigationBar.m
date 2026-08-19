//
//  BaseNavigationBar.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseNavigationBar.h"

@interface BaseNavigationBar ()

Prop_copy()jobsByIDBlock baseNavigationBarBlock;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN BaseNavigationBar
@interface BaseNavigationBar (JobsPropertyDSLSetterAutogen_bdc9541e93)
-(void)setBaseNavigationBarBlock:(jobsByIDBlock)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END BaseNavigationBar

@implementation BaseNavigationBar
- (instancetype)init{
    if (self = [super init]) {
        self.byTranslucent(YES);
    };return self;
}

- (void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationBar.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        if(@available(iOS 11.0, *)){
            CGFloat Y = isiPhoneX_series() ? 44 : 20;
            CGFloat width = self.bounds.size.width;
            Class bgClass = NSClassFromString(UIBarBackground);
            Class cvClass = NSClassFromString(UINavigationBarContentView);
            for(UIView *view in self.subviews){
                if([view isKindOfClass:bgClass]) view.frame = self.bounds;
                if([view isKindOfClass:cvClass]) view.frame = CGRectMake(0, Y, width, 44);
            }
        }
    };
}

-(jobsByjobsByIDBlockBlock _Nonnull)actionBlockBaseNavigationBar{
    @jobs_weakify(self)
    return ^(jobsByIDBlock _Nonnull baseNavigationBarBlock){
        @jobs_strongify(self)
        if (!self) return;
        self.byBaseNavigationBarBlock(baseNavigationBarBlock);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN BaseNavigationBar
-(JobsRetBaseNavigationBarByjobsByIDBlockBlock _Nonnull)byBaseNavigationBarBlock{
    @jobs_weakify(self)
    return ^__kindof BaseNavigationBar * _Nullable(jobsByIDBlock data){
        @jobs_strongify(self)
        [self setBaseNavigationBarBlock:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END BaseNavigationBar
@end
