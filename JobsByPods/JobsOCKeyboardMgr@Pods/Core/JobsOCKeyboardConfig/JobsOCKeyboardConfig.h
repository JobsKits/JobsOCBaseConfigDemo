//
//  JobsOCKeyboardConfig.h
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JobsOCKeyboardConfig_h
#define JobsOCKeyboardConfig_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCKeyboardConfig : NSObject

Prop_weak(nullable) __kindof UIView *targetView;
Prop_weak(nullable) __kindof UIView *triggerView;
Prop_weak(nullable) __kindof UIView *triggerScopeView;
Prop_weak(nullable) __kindof UIView *containerView;
Prop_weak(nullable) __kindof UIView *accessoryView;
Prop_weak(nullable) id owner;
Prop_strong(readonly) NSHashTable <__kindof UIView *>*followViewHashTable;
Prop_strong(readonly) NSPointerArray *inputFieldPointerArray;
Prop_assign() CGFloat accessoryHeight;
Prop_assign() CGFloat extraSpacing;
Prop_assign() CGFloat topSpacing;
Prop_assign() CGFloat maxLiftDistance;
Prop_assign() BOOL shouldCheckHorizontalOverlap;
Prop_assign() BOOL shouldResignOnTouchOutside;
Prop_assign() BOOL shouldFlowByReturnKey;
Prop_assign() JobsOCKeyboardApplyMode applyMode;
Prop_assign() JobsOCKeyboardAccessoryPolicy accessoryPolicy;
Prop_copy(nullable) jobsByOCKeyboardResultBlock resultBlock;

-(BOOL)isValid;
-(NSArray <__kindof UIView *>*)followViews;
-(NSArray <__kindof UITextField *>*)inputFields;
-(void)resetFollowViews:(NSArray <__kindof UIView *>*_Nullable)data;
-(void)resetInputFields:(NSArray <__kindof UITextField *>*_Nullable)data;

#pragma mark —— DSL
-(JobsRetJobsOCKeyboardConfigByIDBlock _Nonnull)byOwner;
-(JobsRetJobsOCKeyboardConfigByViewBlock _Nonnull)byTargetView;
-(JobsRetJobsOCKeyboardConfigByViewBlock _Nonnull)byTriggerView;
-(JobsRetJobsOCKeyboardConfigByViewBlock _Nonnull)byTriggerScopeView;
-(JobsRetJobsOCKeyboardConfigByViewBlock _Nonnull)byContainerView;
-(JobsRetJobsOCKeyboardConfigByViewBlock _Nonnull)byAccessoryView;
-(JobsRetJobsOCKeyboardConfigByArrBlock _Nonnull)byFollowViews;
-(JobsRetJobsOCKeyboardConfigByArrBlock _Nonnull)byInputFields;
-(JobsRetJobsOCKeyboardConfigByCGFloatBlock _Nonnull)byAccessoryHeight;
-(JobsRetJobsOCKeyboardConfigByCGFloatBlock _Nonnull)byExtraSpacing;
-(JobsRetJobsOCKeyboardConfigByCGFloatBlock _Nonnull)byTopSpacing;
-(JobsRetJobsOCKeyboardConfigByCGFloatBlock _Nonnull)byMaxLiftDistance;
-(JobsRetJobsOCKeyboardConfigByBOOLBlock _Nonnull)byShouldCheckHorizontalOverlap;
-(JobsRetJobsOCKeyboardConfigByBOOLBlock _Nonnull)byShouldResignOnTouchOutside;
-(JobsRetJobsOCKeyboardConfigByBOOLBlock _Nonnull)byShouldFlowByReturnKey;
-(JobsRetJobsOCKeyboardConfigByApplyModeBlock _Nonnull)byApplyMode;
-(JobsRetJobsOCKeyboardConfigByAccessoryPolicyBlock _Nonnull)byAccessoryPolicy;
-(JobsRetJobsOCKeyboardConfigByResultBlock _Nonnull)byResultBlock;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCKeyboardConfig_h */
