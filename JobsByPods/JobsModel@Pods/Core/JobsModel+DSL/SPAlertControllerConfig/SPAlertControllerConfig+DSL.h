//
//  SPAlertControllerConfig+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_SPALERTCONTROLLERCONFIG_DSL_F2EC32F034FA594A
#define JOBS_HEADER_GUARD_SPALERTCONTROLLERCONFIG_DSL_F2EC32F034FA594A

#if __has_include(<JobsModel/SPAlertControllerConfig.h>)
#import <JobsModel/SPAlertControllerConfig.h>
#else
#import "SPAlertControllerConfig.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SPAlertControllerConfig (DSL)

#pragma mark —— 来自 SPAlertControllerConfig
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSObject_SPAlertControllerInitType data))bySPAlertControllerInitType;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSString * data))byTitle;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSString * data))byMessage;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(UIView * data))byCustomAlertView;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(UIView * data))byCustomHeaderView;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(UIView * data))byCustomActionSequenceView;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(SPAlertControllerStyle data))byPreferredStyle;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(SPAlertAnimationType data))byAnimationType;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(UIViewController * data))byTargetVC;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(id data))byFuncInWhere;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(BOOL data))byAnimated;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))byAlertActionTitleArr;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray <NSNumber *> * data))byAlertActionStyleArr;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))byAlertBtnActionArr;
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray <NSMutableArray *> * data))byParametersArr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_SPALERTCONTROLLERCONFIG_DSL_F2EC32F034FA594A */
