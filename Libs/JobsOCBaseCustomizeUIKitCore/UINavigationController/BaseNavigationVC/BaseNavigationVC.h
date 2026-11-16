//
//  BaseNavigationVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASENAVIGATIONVC_BEF5824A1A
#define JOBS_HEADER_GUARD_BASENAVIGATIONVC_BEF5824A1A

#import <UIKit/UIKit.h>
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseNavigationVC : UINavigationController<UINavigationControllerDelegate>

-(JobsRetVCByVoidBlock _Nonnull)jobsChildViewControllerForStatusBarStyle;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASENAVIGATIONVC_BEF5824A1A */
