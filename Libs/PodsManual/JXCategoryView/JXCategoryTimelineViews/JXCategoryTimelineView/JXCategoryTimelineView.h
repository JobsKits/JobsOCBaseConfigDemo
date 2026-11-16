//
//  JXCategoryTimelineView.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JXCATEGORYTIMELINEVIEW_8D3E67F2C5
#define JOBS_HEADER_GUARD_JXCATEGORYTIMELINEVIEW_8D3E67F2C5

#import <UIKit/UIKit.h>
#import "JXCategoryTimelineCell.h"
#import "JXCategoryTimelineCellModel.h"

#if __has_include(<JXCategoryView/JXCategoryTitleView.h>)
#import <JXCategoryView/JXCategoryTitleView.h>
#else
#import "JXCategoryTitleView.h"
#endif

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryTimelineView : JXCategoryTitleView

Prop_strong()NSArray <NSString *> *timeTitles;
Prop_strong()UIColor *timeTitleNormalColor;
Prop_strong()UIColor *timeTitleSelectedColor;
Prop_strong()UIFont *timeTitleFont;
Prop_strong()UIFont *timeTitleSelectedFont;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JXCATEGORYTIMELINEVIEW_8D3E67F2C5 */
