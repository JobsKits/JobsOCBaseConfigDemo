//
//  JXCategoryViewVerticalShowSubBaseVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
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

@interface JXCategoryViewVerticalShowSubBaseVC : UIViewController//BaseViewController

Prop_copy()NSString *pageTitle;

-(JobsRetJXCategoryViewVerticalShowSubBaseVCByStrBlock _Nonnull)byPageTitle;

-(jobsByVoidBlock _Nonnull)jobsListDidDisappear;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JXCategoryViewVerticalShowSubBaseVC
-(JobsRetJXCategoryViewVerticalShowSubBaseVCByStrBlock _Nonnull)byCurrentTitleWritingLottieName;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JXCategoryViewVerticalShowSubBaseVC
@end

NS_ASSUME_NONNULL_END
