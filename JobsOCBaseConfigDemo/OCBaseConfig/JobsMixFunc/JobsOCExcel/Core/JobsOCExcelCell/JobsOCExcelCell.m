//
//  JobsOCExcelCell.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelCell.h"

@implementation JobsOCExcelCell
-(JobsRetJobsOCExcelCellByStrBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^JobsOCExcelCell *(NSString *text){
        @jobs_strongify(self)
        self.text = text;
        return self;
    };
}

-(JobsRetJobsOCExcelCellByNSUIntegerBlock _Nonnull)byTextDisplayMode{
    @jobs_weakify(self)
    return ^JobsOCExcelCell *(NSUInteger textDisplayMode){
        @jobs_strongify(self)
        self.textDisplayMode = (JobsLabelTextDisplayMode)textDisplayMode;
        return self;
    };
}

-(JobsRetJobsOCExcelCellByCGFloatBlock _Nonnull)byMinimumScaleFactor{
    @jobs_weakify(self)
    return ^JobsOCExcelCell *(CGFloat minimumScaleFactor){
        @jobs_strongify(self)
        self.minimumScaleFactor = minimumScaleFactor;
        return self;
    };
}

-(JobsRetJobsOCExcelCellByNSIntegerBlock _Nonnull)byMaximumNumberOfLines{
    @jobs_weakify(self)
    return ^JobsOCExcelCell *(NSInteger maximumNumberOfLines){
        @jobs_strongify(self)
        self.maximumNumberOfLines = maximumNumberOfLines;
        return self;
    };
}

-(JobsRetJobsOCExcelCellByLabelScrollConfigurationBlock _Nonnull)byScrollConfiguration{
    @jobs_weakify(self)
    return ^JobsOCExcelCell *(JobsLabelScrollConfiguration *scrollConfiguration){
        @jobs_strongify(self)
        self.scrollConfiguration = scrollConfiguration;
        return self;
    };
}

+(JobsRetIDByStrBlock _Nonnull)cellWithText{
    return ^id(NSString * text){
        return [self cellWithText:text
                 textDisplayMode:JobsLabelTextDisplayModeSingleLineTailTruncation];
    };
}

+(instancetype)cellWithText:(NSString *)text
            textDisplayMode:(JobsLabelTextDisplayMode)textDisplayMode{
    JobsOCExcelCell *cell = JobsOCExcelCell.new;
    return cell
        .byText(text ?: @"")
        .byTextDisplayMode(textDisplayMode)
        .byMinimumScaleFactor(.5f)
        .byMaximumNumberOfLines(2)
        .byScrollConfiguration(JobsLabelScrollConfiguration.continuousConfiguration());
}

@end
