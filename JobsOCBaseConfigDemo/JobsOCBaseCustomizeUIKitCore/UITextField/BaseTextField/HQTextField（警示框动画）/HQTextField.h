//
//  HQTextField.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_HQTEXTFIELD_D8087C6D6C
#define JOBS_HEADER_GUARD_HQTEXTFIELD_D8087C6D6C

#import <UIKit/UIKit.h>
#import "CJTextField.h"
#import "JobsModelDSL.h"
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface HQTextField : CJTextField
/// 显示警示框
-(jobsByVoidBlock _Nonnull)showWarn;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HQTEXTFIELD_D8087C6D6C */
