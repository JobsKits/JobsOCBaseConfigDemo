//
//  JobsOCCountryCodeCtrl.h
//  JobsOCCountryCodeCtrl
//
//  Created by Jobs on 2026年6月24日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSOC_COUNTRYCODECTRL_2F6A8C4B91
#define JOBS_HEADER_GUARD_JOBSOC_COUNTRYCODECTRL_2F6A8C4B91

#import <UIKit/UIKit.h>

#import "JobsOCCountryCodeCtrlDelegate.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"
#import "JobsLanguageManager.h"

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

@interface JobsOCCountryCodeCtrl : UIViewController
<
UITableViewDataSource
,UITableViewDelegate
,UISearchResultsUpdating
>

Prop_weak()id<JobsOCCountryCodeCtrlDelegate> countryCodeDelegate;
Prop_copy()jobsByOCCountryCodeBlock countryCodeBlock;

@end
#endif /* JOBS_HEADER_GUARD_JOBSOC_COUNTRYCODECTRL_2F6A8C4B91 */
