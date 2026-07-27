//
//  JobsGestureLockConfiguration.m
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsGestureLockConfiguration.h"

@implementation JobsGestureLockConfiguration
+ (instancetype)defaultConfiguration {
    JobsGestureLockConfiguration *configuration = [[self alloc] init];
    configuration.minimumPatternLength = 4;
    configuration.lineWidth = 6.0;
    configuration.normalLineColor = UIColor.clearColor;
    configuration.selectedLineColor = JobsSystemBlueColor;
    configuration.errorLineColor = JobsSystemRedColor;
    configuration.statusTextColor = JobsLabelColor;
    configuration.statusFont = UIFontWeightMediumSize(15.0);
    configuration.createStatusText = @"绘制新手势（至少 4 个点）";
    configuration.confirmStatusText = @"请再绘制一次进行确认";
    configuration.validateStatusText = @"请输入手势解锁";
    configuration.tooShortStatusText = @"至少连接 4 个点";
    configuration.mismatchStatusText = @"两次不一致，请重新设置";
    configuration.errorFormat = @"手势错误，还可以再输入 %ld 次";
    configuration.maxRetryCount = 5;
    configuration.nodeNormalImage = nil;
    configuration.nodeSelectedImage = nil;
    configuration.nodeErrorImage = nil;
    configuration.indicatorNormalImage = nil;
    configuration.indicatorSelectedImage = nil;
    return configuration;
}

- (id)copyWithZone:(NSZone *)zone {
    JobsGestureLockConfiguration *configuration = [[[self class] allocWithZone:zone] init];
    configuration.minimumPatternLength = self.minimumPatternLength;
    configuration.lineWidth = self.lineWidth;
    configuration.normalLineColor = self.normalLineColor;
    configuration.selectedLineColor = self.selectedLineColor;
    configuration.errorLineColor = self.errorLineColor;
    configuration.statusTextColor = self.statusTextColor;
    configuration.statusFont = self.statusFont;
    configuration.createStatusText = self.createStatusText;
    configuration.confirmStatusText = self.confirmStatusText;
    configuration.validateStatusText = self.validateStatusText;
    configuration.tooShortStatusText = self.tooShortStatusText;
    configuration.mismatchStatusText = self.mismatchStatusText;
    configuration.errorFormat = self.errorFormat;
    configuration.maxRetryCount = self.maxRetryCount;
    configuration.nodeNormalImage = self.nodeNormalImage;
    configuration.nodeSelectedImage = self.nodeSelectedImage;
    configuration.nodeErrorImage = self.nodeErrorImage;
    configuration.indicatorNormalImage = self.indicatorNormalImage;
    configuration.indicatorSelectedImage = self.indicatorSelectedImage;
    return configuration;
}

@end
