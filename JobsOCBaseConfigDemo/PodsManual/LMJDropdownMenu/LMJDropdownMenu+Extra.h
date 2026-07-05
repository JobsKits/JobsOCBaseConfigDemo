//
//  LMJDropdownMenu+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_LMJDROPDOWNMENU_EXTRA_DBF4420828
#define JOBS_HEADER_GUARD_LMJDROPDOWNMENU_EXTRA_DBF4420828

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<LMJDropdownMenu/LMJDropdownMenu.h>)
#import <LMJDropdownMenu/LMJDropdownMenu.h>
#else
#import "LMJDropdownMenu.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface LMJDropdownMenu (Extra)

-(__kindof UIButton *)great;
-(void)greatAtEmpty;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_LMJDROPDOWNMENU_EXTRA_DBF4420828 */
