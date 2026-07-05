//
//  UIFont+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIFONT_EXTRA_F8293062DC
#define JOBS_HEADER_GUARD_UIFONT_EXTRA_F8293062DC

#import <UIKit/UIKit.h>
#import "NSMutableArray+Extra.h"
#import "NSArray+Extra.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (Extra)
/// 打印全员字体
+(JobsRetArrByVoidBlock _Nonnull)getAvailableFont;
/// 打印外援字体
+(JobsRetArrByVoidBlock _Nonnull)foreignAidFontName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIFONT_EXTRA_F8293062DC */
