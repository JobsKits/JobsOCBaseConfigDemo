//
//  JobsOCCountryCodeCtrlDelegate.h
//  JobsOCCountryCodeCtrl
//
//  Created by Jobs on 2026年6月24日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSOC_COUNTRYCODECTRLDELEGATE_74D92F0F1A
#define JOBS_HEADER_GUARD_JOBSOC_COUNTRYCODECTRLDELEGATE_74D92F0F1A

#import <Foundation/Foundation.h>

@protocol JobsOCCountryCodeCtrlDelegate <NSObject>
@optional
/// Delegate 回调所选国家代码
/// @param countryName 所选国家
/// @param code 所选国家代码
-(void)returnCountryName:(NSString *)countryName code:(NSString *)code;

@end
#endif /* JOBS_HEADER_GUARD_JOBSOC_COUNTRYCODECTRLDELEGATE_74D92F0F1A */
