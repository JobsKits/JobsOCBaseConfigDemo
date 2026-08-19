//
//  LMJDropdownMenu+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_LMJDROPDOWNMENU_EXTRA_DBF4420828
#define JOBS_HEADER_GUARD_LMJDROPDOWNMENU_EXTRA_DBF4420828

#import <objc/runtime.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <UIKit/UIKit.h>

#if __has_include(<LMJDropdownMenu/LMJDropdownMenu.h>)
#import <LMJDropdownMenu/LMJDropdownMenu.h>
#else
#import "LMJDropdownMenu.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface LMJDropdownMenu (Extra)

-(JobsRetBtnByVoidBlock _Nonnull)great;
-(jobsByVoidBlock _Nonnull)greatAtEmpty;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_LMJDROPDOWNMENU_EXTRA_DBF4420828 */
