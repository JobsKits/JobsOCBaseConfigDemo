//
//  JobsTextFieldStyleCVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTEXTFIELDSTYLECVCELL_ADE3665A5E
#define JOBS_HEADER_GUARD_JOBSTEXTFIELDSTYLECVCELL_ADE3665A5E

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "UIView+Extra.h"
#import "ZYTextField.h"
#import "JobsBaseCollectionViewCell.h"
#import "JobsLanMgr.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN
/// 只在BaseCollectionViewCell完整的盖一个TextField
@interface JobsTextFieldStyleCVCell : JobsBaseCollectionViewCell<UITextFieldDelegate>

-(ZYTextField *)getTextField;
-(JobsRetZYTextFieldByVoidBlock _Nonnull)jobsGetTextField;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSTEXTFIELDSTYLECVCELL_ADE3665A5E */
