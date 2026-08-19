//
//  UIGestureRecognizer+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "UIGestureRecognizer+DSL.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UIGestureRecognizer
@interface UIGestureRecognizer (JobsPropertyDSLSetterAutogen_33fda172c4)
-(void)setRac_gestureHandler:(RACGestureRecognizerActionHandler * _Nullable)data;
-(void)setRac_subject:(RACSubject * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UIGestureRecognizer

@implementation UIGestureRecognizer (JobsChain)
+(JobsRetGestureByVoidBlock _Nonnull)byGestureRecognizer{
    return ^__kindof UIGestureRecognizer *_Nullable(void){
        return [[self alloc] init];
    };
}

-(JobsRetGestureRecognizerByDelegateBlock _Nonnull)byDelegate{
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

-(JobsRetGestureRecognizerByBOOLBlock _Nonnull)byCancelsTouchesInView{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.cancelsTouchesInView = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByBOOLBlock _Nonnull)byDelaysTouchesBegan{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.delaysTouchesBegan = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByBOOLBlock _Nonnull)byDelaysTouchesEnded{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.delaysTouchesEnded = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByArrBlock _Nonnull)byAllowedTouchTypes{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.allowedTouchTypes = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByArrBlock _Nonnull)byAllowedPressTypes{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.allowedPressTypes = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByBOOLBlock _Nonnull)byRequiresExclusiveTouchType{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.requiresExclusiveTouchType = data;
        return self;
    };
}

-(JobsRetGestureRecognizerByStringBlock _Nonnull)byName API_AVAILABLE(ios(11.0)){
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

-(JobsRetCGPointByViewBlock _Nonnull)byLocationInView{
    @jobs_weakify(self)
    return ^CGPoint(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        return [self locationInView:data];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UIGestureRecognizer
-(JobsRetUIGestureRecognizerByRACGestureRecognizerActionHandlerBlock _Nonnull)byRac_gestureHandler{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer * _Nullable(RACGestureRecognizerActionHandler * _Nullable data){
        @jobs_strongify(self)
        [self setRac_gestureHandler:data];
        return self;
    };
}

-(JobsRetUIGestureRecognizerByRACSubjectBlock _Nonnull)byRac_subject{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer * _Nullable(RACSubject * _Nullable data){
        @jobs_strongify(self)
        [self setRac_subject:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UIGestureRecognizer
@end
