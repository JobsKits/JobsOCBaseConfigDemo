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

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#import "JobsByOCPods.h"
#import "JobsOCDSL.h"
#import "JobsLanMgr.h"

@interface JobsOCCountryCodeCtrl : UIViewController
<
UITableViewDataSource
,UITableViewDelegate
,UISearchResultsUpdating
>

Prop_weak()id<JobsOCCountryCodeCtrlDelegate> countryCodeDelegate;
Prop_copy()jobsByOCCountryCodeBlock countryCodeBlock;

+(NSString *)jobs_countryFlagByCountryName:(NSString *)countryName;
+(NSString *)jobs_countryNameTextByCountryName:(NSString *)countryName;
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
