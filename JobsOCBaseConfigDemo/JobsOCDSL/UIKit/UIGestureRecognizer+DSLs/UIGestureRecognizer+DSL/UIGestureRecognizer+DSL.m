//
//  UIGestureRecognizer+DSL.m
//  JobsOCBaseConfigDemo
//
#import "UIGestureRecognizer+DSL.h"

@implementation UIGestureRecognizer (JobsChain)
+(JobsRetGestureByVoidBlock)byGestureRecognizer{
    return ^__kindof UIGestureRecognizer *_Nullable(void){
        return [[self alloc] init];
    };
}

-(JobsRetGestureRecognizerByDelegateBlock)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(id<UIGestureRecognizerDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByBOOLBlock)byEnabled{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.enabled = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByBOOLBlock)byCancelsTouchesInView{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.cancelsTouchesInView = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByBOOLBlock)byDelaysTouchesBegan{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.delaysTouchesBegan = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByBOOLBlock)byDelaysTouchesEnded{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.delaysTouchesEnded = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByArrBlock)byAllowedTouchTypes{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.allowedTouchTypes = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByArrBlock)byAllowedPressTypes{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.allowedPressTypes = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByBOOLBlock)byRequiresExclusiveTouchType{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.requiresExclusiveTouchType = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByStringBlock)byName API_AVAILABLE(ios(11.0)){
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) self.name = data;
        return self;
    };
}

-(JobsRetGestureByGesture)byRequireGestureRecognizerToFail{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(__kindof UIGestureRecognizer *_Nullable data){
        @jobs_strongify(self)
        if (data) [self requireGestureRecognizerToFail:data];
        return self;
    };
}

-(JobsRetCGPointByViewBlock)byLocationInView{
    @jobs_weakify(self)
    return ^CGPoint(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        return [self locationInView:data];
    };
}

@end
