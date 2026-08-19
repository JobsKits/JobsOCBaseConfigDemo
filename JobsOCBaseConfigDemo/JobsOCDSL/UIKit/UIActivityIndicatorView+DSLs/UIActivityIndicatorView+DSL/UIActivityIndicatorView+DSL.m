//
//  UIActivityIndicatorView+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "UIActivityIndicatorView+DSL.h"

@implementation UIActivityIndicatorView (JobsChain)
+(JobsRetActivityIndicatorViewByVoidBlock _Nonnull)byActivityIndicatorView{
    return ^__kindof UIActivityIndicatorView *_Nullable(void){
        return [[self alloc] init];
    };
}

+(JobsRetActivityIndicatorViewByNSInteger)byActivityIndicatorViewWithStyle{
    return ^__kindof UIActivityIndicatorView *_Nullable(NSInteger data){
        return [[self alloc] initWithActivityIndicatorStyle:data];
    };
}

-(JobsRetActivityIndicatorViewByNSInteger)byActivityIndicatorViewStyle{
    @jobs_weakify(self)
    return ^__kindof UIActivityIndicatorView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.activityIndicatorViewStyle = data;
        return self;
    };
}

-(JobsRetActivityIndicatorViewByCorBlock _Nonnull)byColor{
    @jobs_weakify(self)
    return ^__kindof UIActivityIndicatorView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.color = data;
        return self;
    };
}

-(JobsRetActivityIndicatorViewByBOOLBlock _Nonnull)byHidesWhenStopped{
    @jobs_weakify(self)
    return ^__kindof UIActivityIndicatorView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.hidesWhenStopped = data;
        return self;
    };
}

-(JobsRetActivityIndicatorViewByVoidBlock _Nonnull)byStartAnimating{
    @jobs_weakify(self)
    return ^__kindof UIActivityIndicatorView *_Nullable(void){
        @jobs_strongify(self)
        [self startAnimating];
        return self;
    };
}

-(JobsRetActivityIndicatorViewByVoidBlock _Nonnull)byStopAnimating{
    @jobs_weakify(self)
    return ^__kindof UIActivityIndicatorView *_Nullable(void){
        @jobs_strongify(self)
        [self stopAnimating];
        return self;
    };
}

@end
