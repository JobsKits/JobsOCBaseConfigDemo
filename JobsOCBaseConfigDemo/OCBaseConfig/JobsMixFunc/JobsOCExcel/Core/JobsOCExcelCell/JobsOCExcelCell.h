//
//  JobsOCExcelCell.h
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCUILabelScrolling/JobsOCUILabelScrolling.h>)
#import <JobsOCUILabelScrolling/JobsOCUILabelScrolling.h>
#else
#import "JobsOCUILabelScrolling.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCExcelCell : NSObject

Prop_copy()NSString *text;
Prop_assign()JobsLabelTextDisplayMode textDisplayMode;
Prop_assign()CGFloat minimumScaleFactor;
Prop_assign()NSInteger maximumNumberOfLines;
Prop_strong()JobsLabelScrollConfiguration *scrollConfiguration;

+(instancetype)cellWithText:(NSString *)text;
+(instancetype)cellWithText:(NSString *)text
            textDisplayMode:(JobsLabelTextDisplayMode)textDisplayMode;

@end

NS_ASSUME_NONNULL_END
