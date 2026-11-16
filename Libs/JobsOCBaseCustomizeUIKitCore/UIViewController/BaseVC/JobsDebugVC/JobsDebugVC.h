//
//  JobsDebugVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsLanMgr.h"
#import "JobsModelDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

#ifndef VC_LIFE_CYCLE_ENUM_DEFINED
#define VC_LIFE_CYCLE_ENUM_DEFINED

#import "WHToastExtra.h"

typedef NS_ENUM(NSUInteger, UIViewControllerLifeCycle) {
    VCLifeCycle_loadView = 0,
    VCLifeCycle_viewDidLoad,
    VCLifeCycle_viewWillAppear,
    VCLifeCycle_viewDidAppear,
    VCLifeCycle_viewWillDisappear,
    VCLifeCycle_viewDidDisappear,
    VCLifeCycle_viewWillLayoutSubviews,
    VCLifeCycle_viewDidLayoutSubviews
};
#endif /* VC_LIFE_CYCLE_ENUM_DEFINED */

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const JobsControllerDeallocTipsEnabledUserDefaultsKey;
FOUNDATION_EXPORT BOOL JobsControllerDeallocTipsEnabled(void);
FOUNDATION_EXPORT void JobsSetControllerDeallocTipsEnabled(BOOL enabled);

@interface JobsDebugVC : UIViewController

-(jobsByVoidBlock _Nonnull)jobsDidReceiveMemoryWarning;

@end

NS_ASSUME_NONNULL_END
