//
//  JobsDoorInputViewProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSDOORINPUTVIEWPROTOCOL_3A30860DA7
#define JOBS_HEADER_GUARD_JOBSDOORINPUTVIEWPROTOCOL_3A30860DA7

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

@class JobsAppDoorInputViewBaseStyle;

NS_ASSUME_NONNULL_BEGIN

@protocol JobsDoorInputViewProtocol <NSObject>
@optional

-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected;
-(jobsByBOOLBlock _Nonnull)jobsChangeTextFieldAnimationColor;
-(__kindof UILabel *_Nullable)textLab;
-(__kindof UIButton *_Nullable)securityModelBtn;
-(__kindof UITextField *_Nullable)textField;
-(NSString *_Nullable)textFieldValue;
-(JobsRetStrByVoidBlock _Nonnull)jobsTextFieldValue;
-(JobsRetNSMutableArrayJobsAppDoorInputViewBaseStyleByVoidBlock _Nonnull)appDoorInputViewBaseStyle;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSDOORINPUTVIEWPROTOCOL_3A30860DA7 */
