//
//  TBCityIconInfo.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TBCITYICONINFO_DC73AF58E2
#define JOBS_HEADER_GUARD_TBCITYICONINFO_DC73AF58E2

#import <UIKit/UIKit.h>

#import "JobsDefines.h"

@interface TBCityIconInfo : NSObject

Prop_copy()NSString *text;
Prop_assign()NSInteger size;
Prop_strong()UIColor *color;

-(instancetype)initWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color;
+(instancetype)iconInfoWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color;

@end
#endif /* JOBS_HEADER_GUARD_TBCITYICONINFO_DC73AF58E2 */
