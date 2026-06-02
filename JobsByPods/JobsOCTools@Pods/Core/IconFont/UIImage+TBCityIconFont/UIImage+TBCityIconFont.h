//
//  UIImage+TBCityIconFont.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIIMAGE_TBCITYICONFONT_859BDB4C02
#define JOBS_HEADER_GUARD_UIIMAGE_TBCITYICONFONT_859BDB4C02

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h> // 提供底层文本排版与渲染能力，适合富文本、复杂排版和精细文本控制场景。
#import <JobsOCTools/TBCityIconInfo.h>
#import <JobsOCTools/TBCityIconFont.h>

@interface UIImage (TBCityIconFont)

+(UIImage *)iconWithInfo:(TBCityIconInfo *)info;

@end
#endif /* JOBS_HEADER_GUARD_UIIMAGE_TBCITYICONFONT_859BDB4C02 */
