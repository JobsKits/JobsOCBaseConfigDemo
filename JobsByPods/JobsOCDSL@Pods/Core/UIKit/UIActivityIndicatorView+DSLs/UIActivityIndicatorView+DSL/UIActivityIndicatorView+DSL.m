//
//  UIActivityIndicatorView+DSL.m
//  JobsOCDSL
//
#import "UIActivityIndicatorView+DSL.h"

@implementation UIActivityIndicatorView (JobsChain)
+(JobsRetActivityIndicatorViewByVoidBlock)byActivityIndicatorView{
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

-(JobsRetActivityIndicatorViewByCorBlock)byColor{
    @jobs_weakify(self)
    return ^__kindof UIActivityIndicatorView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.color = data;
        return self;
    };
}

-(JobsRetActivityIndicatorViewByBOOLBlock)byHidesWhenStopped{
    @jobs_weakify(self)
    return ^__kindof UIActivityIndicatorView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.hidesWhenStopped = data;
        return self;
    };
}

-(JobsRetActivityIndicatorViewByVoidBlock)byStartAnimating{
    @jobs_weakify(self)
    return ^__kindof UIActivityIndicatorView *_Nullable(void){
        @jobs_strongify(self)
        [self startAnimating];
        return self;
    };
}

-(JobsRetActivityIndicatorViewByVoidBlock)byStopAnimating{
    @jobs_weakify(self)
    return ^__kindof UIActivityIndicatorView *_Nullable(void){
        @jobs_strongify(self)
        [self stopAnimating];
        return self;
    };
}

@end
