//
//  JobsOCExcelColumn.h
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import <UIKit/UIKit.h>
#import "JobsOCExcelCell.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCExcelColumn : NSObject

Prop_strong()JobsOCExcelCell *header;
/// 小于等于 0 时使用 JobsOCExcelStyle.defaultColumnWidth。
Prop_assign()CGFloat width;

+(instancetype)columnWithTitle:(NSString *)title
                          width:(CGFloat)width;
+(instancetype)columnWithTitle:(NSString *)title
                          width:(CGFloat)width
                textDisplayMode:(JobsLabelTextDisplayMode)textDisplayMode;
+(instancetype)columnWithHeader:(JobsOCExcelCell *)header
                           width:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
