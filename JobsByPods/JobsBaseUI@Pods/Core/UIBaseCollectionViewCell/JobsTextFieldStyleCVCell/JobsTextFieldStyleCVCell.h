//
//  JobsTextFieldStyleCVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTEXTFIELDSTYLECVCELL_ADE3665A5E
#define JOBS_HEADER_GUARD_JOBSTEXTFIELDSTYLECVCELL_ADE3665A5E

#import <UIKit/UIKit.h>
#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/ZYTextField.h>
#import <JobsBaseUI/JobsBaseCollectionViewCell.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 只在BaseCollectionViewCell完整的盖一个TextField
@interface JobsTextFieldStyleCVCell : JobsBaseCollectionViewCell<UITextFieldDelegate>

-(ZYTextField *)getTextField;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSTEXTFIELDSTYLECVCELL_ADE3665A5E */
