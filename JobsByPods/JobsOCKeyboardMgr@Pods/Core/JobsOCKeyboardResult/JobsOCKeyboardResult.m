//
//  JobsOCKeyboardResult.m
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "JobsOCKeyboardResult.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCKeyboardResult
@interface JobsOCKeyboardResult (JobsPropertyDSLSetterAutogen_d2659d11b6)
-(void)setAccessoryFrameInContainer:(CGRect)data;
-(void)setAnimationOptions:(UIViewAnimationOptions)data;
-(void)setKeyboardFrameInContainer:(CGRect)data;
-(void)setKeyboardVisible:(BOOL)data;
-(void)setObstructionFrameInContainer:(CGRect)data;
-(void)setOffsetY:(CGFloat)data;
-(void)setShouldAdjust:(BOOL)data;
-(void)setTargetFrameInContainer:(CGRect)data;
-(void)setTriggerFrameInContainer:(CGRect)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCKeyboardResult

@implementation JobsOCKeyboardResult
-(instancetype)init{
    if (self = [super init]) {
        _keyboardFrameInContainer = CGRectNull;
        _accessoryFrameInContainer = CGRectNull;
        _obstructionFrameInContainer = CGRectNull;
        _targetFrameInContainer = CGRectNull;
        _triggerFrameInContainer = CGRectNull;
        _animationDuration = 0.25f;
        _animationOptions = UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction;
    };return self;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCKeyboardResult
-(JobsRetJobsOCKeyboardResultByBOOLBlock _Nonnull)byKeyboardVisible{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardResult * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setKeyboardVisible:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardResultByBOOLBlock _Nonnull)byShouldAdjust{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardResult * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setShouldAdjust:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardResultByCGFloatBlock _Nonnull)byOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardResult * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setOffsetY:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardResultByCGRectBlock _Nonnull)byAccessoryFrameInContainer{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardResult * _Nullable(CGRect data){
        @jobs_strongify(self)
        [self setAccessoryFrameInContainer:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardResultByCGRectBlock _Nonnull)byKeyboardFrameInContainer{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardResult * _Nullable(CGRect data){
        @jobs_strongify(self)
        [self setKeyboardFrameInContainer:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardResultByCGRectBlock _Nonnull)byObstructionFrameInContainer{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardResult * _Nullable(CGRect data){
        @jobs_strongify(self)
        [self setObstructionFrameInContainer:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardResultByCGRectBlock _Nonnull)byTargetFrameInContainer{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardResult * _Nullable(CGRect data){
        @jobs_strongify(self)
        [self setTargetFrameInContainer:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardResultByCGRectBlock _Nonnull)byTriggerFrameInContainer{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardResult * _Nullable(CGRect data){
        @jobs_strongify(self)
        [self setTriggerFrameInContainer:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardResultByUIViewAnimationOptionsBlock _Nonnull)byAnimationOptions{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardResult * _Nullable(UIViewAnimationOptions data){
        @jobs_strongify(self)
        [self setAnimationOptions:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCKeyboardResult
@end
