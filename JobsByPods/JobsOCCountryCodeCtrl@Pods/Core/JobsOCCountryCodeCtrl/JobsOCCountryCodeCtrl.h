//
//  JobsOCCountryCodeCtrl.h
//  JobsOCCountryCodeCtrl
//
//  Created by Jobs on 2026年6月24日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSOC_COUNTRYCODECTRL_2F6A8C4B91
#define JOBS_HEADER_GUARD_JOBSOC_COUNTRYCODECTRL_2F6A8C4B91

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCCountryCodeCtrl/JobsOCCountryCodeCtrlDelegate.h>)
#import <JobsOCCountryCodeCtrl/JobsOCCountryCodeCtrlDelegate.h>
#else
#import "JobsOCCountryCodeCtrlDelegate.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

@interface JobsOCCountryCodeCtrl : UIViewController
<
UITableViewDataSource
,UITableViewDelegate
,UISearchResultsUpdating
>

Prop_weak()id<JobsOCCountryCodeCtrlDelegate> countryCodeDelegate;
Prop_copy()jobsByOCCountryCodeBlock countryCodeBlock;
-(JobsRetJobsOCCountryCodeCtrlByCountryCodeBlock _Nonnull)byCountryCodeBlock;

+(JobsRetStrByStrBlock _Nonnull)jobs_countryFlagByCountryName;
+(JobsRetStrByStrBlock _Nonnull)jobs_countryNameTextByCountryName;
+(NSString *)jobs_countryCodeTextByCountryName:(NSString *)countryName code:(NSString *)code;
+(NSAttributedString *)jobs_countryNameAttributedTextByCountryName:(NSString *)countryName
                                                              font:(UIFont *)font
                                                         textColor:(UIColor *)textColor;
+(NSAttributedString *)jobs_countryCodeAttributedTextByCountryName:(NSString *)countryName
                                                              code:(NSString *)code
                                                              font:(UIFont *)font
                                                         textColor:(UIColor *)textColor;

@end
#endif /* JOBS_HEADER_GUARD_JOBSOC_COUNTRYCODECTRL_2F6A8C4B91 */
