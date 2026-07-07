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

-(BOOL)isValid{
    return self.targetView != nil;
}

-(NSArray <__kindof UIView *>*)followViews{
    return self.followViewHashTable.allObjects;
}

-(NSArray <__kindof UITextField *>*)inputFields{
    [self.inputFieldPointerArray compact];
    NSMutableArray <__kindof UITextField *>*textFields = NSMutableArray.array;
    for (NSUInteger i = 0; i < self.inputFieldPointerArray.count; i++) {
        UITextField *textField = (__bridge UITextField *)([self.inputFieldPointerArray pointerAtIndex:i]);
        if (textField) [textFields addObject:textField];
    };return textFields;
}

-(void)resetFollowViews:(NSArray<__kindof UIView *> *)data{
    [self.followViewHashTable removeAllObjects];
    for (__kindof UIView *view in data) {
        if (view) [self.followViewHashTable addObject:view];
    }
}

-(void)resetInputFields:(NSArray <__kindof UITextField *>*)data{
    self.inputFieldPointerArray = NSPointerArray.weakObjectsPointerArray;
    for (__kindof UITextField *textField in data) {
        if ([textField isKindOfClass:UITextField.class]) {
            [self.inputFieldPointerArray addPointer:(__bridge void *)textField];
        }
    }
}
#pragma mark —— DSL
-(JobsRetJobsOCKeyboardConfigByIDBlock)byOwner{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(id _Nullable data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.owner = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByViewBlock)byTargetView{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof UIView *_Nullable data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.targetView = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByViewBlock)byTriggerView{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof UIView *_Nullable data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.triggerView = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByViewBlock)byTriggerScopeView{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof UIView *_Nullable data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.triggerScopeView = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByViewBlock)byContainerView{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof UIView *_Nullable data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.containerView = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByViewBlock)byAccessoryView{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof UIView *_Nullable data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.accessoryView = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByArrBlock)byFollowViews{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof NSArray<__kindof UIView *> *_Nullable data) {
        __strong typeof(weakSelf) self = weakSelf;
        [self resetFollowViews:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByArrBlock)byInputFields{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(__kindof NSArray<__kindof UIView *> *_Nullable data) {
        __strong typeof(weakSelf) self = weakSelf;
        [self resetInputFields:(NSArray <__kindof UITextField *>*)data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByCGFloatBlock)byAccessoryHeight{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(CGFloat data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.accessoryHeight = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByCGFloatBlock)byExtraSpacing{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(CGFloat data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.extraSpacing = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByCGFloatBlock)byTopSpacing{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(CGFloat data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.topSpacing = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByCGFloatBlock)byMaxLiftDistance{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(CGFloat data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.maxLiftDistance = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByBOOLBlock)byShouldCheckHorizontalOverlap{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(BOOL data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.shouldCheckHorizontalOverlap = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByBOOLBlock)byShouldResignOnTouchOutside{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(BOOL data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.shouldResignOnTouchOutside = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByBOOLBlock)byShouldFlowByReturnKey{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(BOOL data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.shouldFlowByReturnKey = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByApplyModeBlock)byApplyMode{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(JobsOCKeyboardApplyMode data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.applyMode = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByAccessoryPolicyBlock)byAccessoryPolicy{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(JobsOCKeyboardAccessoryPolicy data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.accessoryPolicy = data;
        return self;
    };
}

-(JobsRetJobsOCKeyboardConfigByResultBlock)byResultBlock{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardConfig *_Nullable(jobsByOCKeyboardResultBlock _Nullable data) {
        __strong typeof(weakSelf) self = weakSelf;
        self.resultBlock = data;
        return self;
    };
}

@end
