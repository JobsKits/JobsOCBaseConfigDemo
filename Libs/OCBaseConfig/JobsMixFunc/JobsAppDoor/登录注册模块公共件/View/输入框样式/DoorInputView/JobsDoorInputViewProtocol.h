//
//  JobsDoorInputViewProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021/11/30.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
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
