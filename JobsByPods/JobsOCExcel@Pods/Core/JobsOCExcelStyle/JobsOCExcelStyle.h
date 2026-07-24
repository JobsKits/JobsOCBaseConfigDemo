//
//  JobsOCExcelStyle.h
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCExcelStyle : NSObject <NSCopying>

Prop_assign()CGFloat defaultColumnWidth;
Prop_assign()CGFloat headerHeight;
Prop_assign()CGFloat rowHeight;
Prop_assign()CGFloat gridLineWidth;
Prop_strong()UIColor *gridLineColor;
Prop_strong()UIColor *frozenHeaderBackgroundColor;
Prop_strong()UIColor *headerBackgroundColor;
Prop_strong()UIColor *frozenColumnBackgroundColor;
Prop_strong()UIColor *bodyBackgroundColor;
Prop_strong()UIColor *frozenHeaderTextColor;
Prop_strong()UIColor *headerTextColor;
Prop_strong()UIColor *primaryTextColor;
Prop_strong()UIColor *secondaryTextColor;
Prop_strong()UIFont *headerFont;
Prop_strong()UIFont *bodyFont;
Prop_assign()BOOL showsHorizontalScrollIndicator;
Prop_assign()BOOL bouncesHorizontally;

@end

NS_ASSUME_NONNULL_END
