//
//  JobsDoorInputViewProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSDOORINPUTVIEWPROTOCOL_3A30860DA7
#define JOBS_HEADER_GUARD_JOBSDOORINPUTVIEWPROTOCOL_3A30860DA7

#import <UIKit/UIKit.h>
#import "JobsDefines.h"

@class JobsAppDoorInputViewBaseStyle;

NS_ASSUME_NONNULL_BEGIN

@protocol JobsDoorInputViewProtocol <NSObject>
@optional

-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected;
-(__kindof UILabel *_Nullable)textLab;
-(__kindof UIButton *_Nullable)securityModelBtn;
-(__kindof UITextField *_Nullable)textField;
-(NSString *_Nullable)textFieldValue;
-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *_Nullable)appDoorInputViewBaseStyle;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSDOORINPUTVIEWPROTOCOL_3A30860DA7 */
