//
//  XWCountryCodeController.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XWCOUNTRYCODECONTROLLER_DBADDE75F8
#define JOBS_HEADER_GUARD_XWCOUNTRYCODECONTROLLER_DBADDE75F8

#import <UIKit/UIKit.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

typedef void(^returnCountryCode) (NSString *countryName, NSString *code);

@protocol XWCountryCodeControllerDelegate <NSObject>
@optional
/// Delegate 回调所选国家代码
/// @param countryName 所选国家
/// @param code 所选国家代码
-(void)returnCountryName:(NSString *)countryName code:(NSString *)code;

@end

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

@interface XWCountryCodeController : UIViewController
<
UITableViewDataSource
,UITableViewDelegate
,UISearchResultsUpdating
>

Prop_weak()id<XWCountryCodeControllerDelegate> deleagete;
Prop_copy()returnCountryCode countryCodeBlock;

@end
#endif /* JOBS_HEADER_GUARD_XWCOUNTRYCODECONTROLLER_DBADDE75F8 */
