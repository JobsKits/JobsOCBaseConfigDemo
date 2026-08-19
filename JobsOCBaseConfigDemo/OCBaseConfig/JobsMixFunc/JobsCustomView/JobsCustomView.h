//
//  JobsCustomView.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSCUSTOMVIEW_91D25AC310

#if __has_include(<BRPickerView/BRPickerView.h>)
#import <BRPickerView/BRPickerView.h>
#else
#import "BRPickerView.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#define JOBS_HEADER_GUARD_JOBSCUSTOMVIEW_91D25AC310

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsOCDSL.h"

#import "JobsBaseUI.h"
#import "JobsModelDSL.h"
#import "BRPickerViewExtra.h"
#import "JobsLanMgr.h"
#import "JobsMakes.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsCustomView : BaseView

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsCustomView
-(JobsRetJobsCustomViewByCGSizeBlock _Nonnull)byBtnSize;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsCustomView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSCUSTOMVIEW_91D25AC310 */
