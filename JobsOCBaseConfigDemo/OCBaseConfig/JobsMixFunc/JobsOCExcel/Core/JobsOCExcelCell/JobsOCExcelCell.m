//
//  JobsOCExcelCell.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelCell.h"

@implementation JobsOCExcelCell

+(instancetype)cellWithText:(NSString *)text{
    return [self cellWithText:text
             textDisplayMode:JobsLabelTextDisplayModeSingleLineTailTruncation];
}

+(instancetype)cellWithText:(NSString *)text
            textDisplayMode:(JobsLabelTextDisplayMode)textDisplayMode{
    JobsOCExcelCell *cell = JobsOCExcelCell.new;
    cell.text = text ?: @"";
    cell.textDisplayMode = textDisplayMode;
    cell.minimumScaleFactor = .5f;
    cell.maximumNumberOfLines = 2;
    cell.scrollConfiguration = JobsLabelScrollConfiguration.continuousConfiguration;
    return cell;
}

@end
