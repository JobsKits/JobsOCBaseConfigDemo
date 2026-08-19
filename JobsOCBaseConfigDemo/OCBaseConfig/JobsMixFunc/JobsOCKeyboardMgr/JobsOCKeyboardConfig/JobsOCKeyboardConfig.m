//
//  JobsOCKeyboardConfig.m
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "JobsOCKeyboardConfig.h"

@interface JobsOCKeyboardConfig ()

Prop_strong(readwrite) NSHashTable <__kindof UIView *>*followViewHashTable;
Prop_strong(readwrite) NSPointerArray *inputFieldPointerArray;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCKeyboardConfig
@interface JobsOCKeyboardConfig (JobsPropertyDSLSetterAutogen_41432495f5)
-(void)setInputFieldPointerArray:(NSPointerArray * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCKeyboardConfig

@implementation JobsOCKeyboardConfig
-(instancetype)init{
    if (self = [super init]) {
        _followViewHashTable = NSHashTable.weakObjectsHashTable;
        _inputFieldPointerArray = NSPointerArray.weakObjectsPointerArray;
        _extraSpacing = 8.0f;
        _topSpacing = 12.0f;
        _maxLiftDistance = 0.0f;
        _shouldCheckHorizontalOverlap = YES;
        _shouldResignOnTouchOutside = NO;
        _shouldFlowByReturnKey = NO;
        _applyMode = JobsOCKeyboardApplyModeTransform;
        _accessoryPolicy = JobsOCKeyboardAccessoryPolicyAuto;
    };return self;
}

-(JobsRetBOOLByVoidBlock _Nonnull)isValid{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.targetView != nil;
    };
}

-(JobsRetNSArrayUIViewByVoidBlock _Nonnull)followViews{
    @jobs_weakify(self)
    return ^NSArray <__kindof UIView *>*{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.followViewHashTable.allObjects;
    };
}

-(JobsRetNSArrayUITextFieldByVoidBlock _Nonnull)inputFields{
    @jobs_weakify(self)
    return ^NSArray <__kindof UITextField *>*{
        @jobs_strongify(self)
        if (!self) return nil;
        [self.inputFieldPointerArray compact];
        NSMutableArray <__kindof UITextField *>*textFields = NSMutableArray.array;
        for (NSUInteger i = 0; i < self.inputFieldPointerArray.count; i++) {
            UITextField *textField = (__bridge UITextField *)([self.inputFieldPointerArray pointerAtIndex:i]);
            if (textField) [textFields addObject:textField];
        };return textFields;
    };
}

-(jobsByNSArrayUIViewBlock _Nonnull)resetFollowViews{
    @jobs_weakify(self)
    return ^(NSArray<__kindof UIView *> * data){
        @jobs_strongify(self)
        if (!self) return;
        [self.followViewHashTable removeAllObjects];
        for (__kindof UIView *view in data) {
            if (view) [self.followViewHashTable addObject:view];
        }
    };
}

-(jobsByNSArrayUITextFieldBlock _Nonnull)resetInputFields{
    @jobs_weakify(self)
    return ^(NSArray <__kindof UITextField *>* data){
        @jobs_strongify(self)
        if (!self) return;
        self.byInputFieldPointerArray(NSPointerArray.weakObjectsPointerArray);
        for (__kindof UITextField *textField in data) {
            if ([textField isKindOfClass:UITextField.class]) {
                [self.inputFieldPointerArray addPointer:(__bridge void *)textField];
            }
        }
    };
}
#pragma mark —— DSL
-(JobsRetJobsOCKeyboardConfigByIDBlock _Nonnull)byOwner{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.owner = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByViewBlock _Nonnull)byTargetView{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof UIView *_Nullable data) {
        @jobs_strongify(self)
        self.targetView = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByViewBlock _Nonnull)byTriggerView{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof UIView *_Nullable data) {
        @jobs_strongify(self)
        self.triggerView = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByViewBlock _Nonnull)byTriggerScopeView{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof UIView *_Nullable data) {
        @jobs_strongify(self)
        self.triggerScopeView = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByViewBlock _Nonnull)byContainerView{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof UIView *_Nullable data) {
        @jobs_strongify(self)
        self.containerView = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByViewBlock _Nonnull)byAccessoryView{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof UIView *_Nullable data) {
        @jobs_strongify(self)
        self.accessoryView = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByArrBlock _Nonnull)byFollowViews{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof NSArray<__kindof UIView *> *_Nullable data) {
        @jobs_strongify(self)
        self.resetFollowViews(data);
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByArrBlock _Nonnull)byInputFields{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof NSArray<__kindof UIView *> *_Nullable data) {
        @jobs_strongify(self)
        self.resetInputFields((NSArray <__kindof UITextField *>*)data);
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByCGFloatBlock _Nonnull)byAccessoryHeight{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.accessoryHeight = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByCGFloatBlock _Nonnull)byExtraSpacing{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.extraSpacing = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByCGFloatBlock _Nonnull)byTopSpacing{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.topSpacing = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByCGFloatBlock _Nonnull)byMaxLiftDistance{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.maxLiftDistance = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByBOOLBlock _Nonnull)byShouldCheckHorizontalOverlap{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.shouldCheckHorizontalOverlap = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByBOOLBlock _Nonnull)byShouldResignOnTouchOutside{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.shouldResignOnTouchOutside = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByBOOLBlock _Nonnull)byShouldFlowByReturnKey{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.shouldFlowByReturnKey = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByApplyModeBlock _Nonnull)byApplyMode{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(JobsOCKeyboardApplyMode data) {
        @jobs_strongify(self)
        self.applyMode = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByAccessoryPolicyBlock _Nonnull)byAccessoryPolicy{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(JobsOCKeyboardAccessoryPolicy data) {
        @jobs_strongify(self)
        self.accessoryPolicy = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByResultBlock _Nonnull)byResultBlock{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig *_Nullable(jobsByOCKeyboardResultBlock _Nullable data) {
        @jobs_strongify(self)
        self.resultBlock = data;
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCKeyboardConfig
-(JobsRetJobsOCKeyboardConfigByNSPointerArrayBlock _Nonnull)byInputFieldPointerArray{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardConfig * _Nullable(NSPointerArray * _Nullable data){
        @jobs_strongify(self)
        [self setInputFieldPointerArray:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCKeyboardConfig
@end
