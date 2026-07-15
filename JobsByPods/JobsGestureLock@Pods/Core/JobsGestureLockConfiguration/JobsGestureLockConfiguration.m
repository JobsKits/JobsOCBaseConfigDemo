//
//  JobsGestureLockConfiguration.m
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsGestureLockConfiguration.h"
#import <JobsGestureLock/JobsGestureLockResource.h>

@implementation JobsGestureLockConfiguration
+ (instancetype)defaultConfiguration {
    JobsGestureLockConfiguration *configuration = [[self alloc] init];
    configuration.minimumPatternLength = 4;
    configuration.lineWidth = 6.0;
    configuration.normalLineColor = UIColor.clearColor;
    configuration.selectedLineColor = RGBA_COLOR(0.95 * 255.0, 0.55 * 255.0, 0.15 * 255.0, 1.0);
    configuration.errorLineColor = UIColor.redColor;
    configuration.statusTextColor = RGBA_COLOR(0.82 * 255.0, 0.20 * 255.0, 0.22 * 255.0, 1.0);
    configuration.statusFont = UIFontWeightRegularSize(14.0);
    configuration.createStatusText = @"请绘制手势密码";
    configuration.confirmStatusText = @"请再次绘制手势密码";
    configuration.validateStatusText = @"请输入手势密码";
    configuration.tooShortStatusText = @"至少连接四个点，请重新输入";
    configuration.mismatchStatusText = @"与上一次绘制不一致，请重新绘制";
    configuration.errorFormat = @"密码错误，还可以再输入%ld次";
    configuration.maxRetryCount = 5;
    configuration.nodeNormalImage = [JobsGestureLockResource imageNamed:@"灰色椭圆"];
    configuration.nodeSelectedImage = [JobsGestureLockResource imageNamed:@"橙色椭圆"];
    configuration.nodeErrorImage = [JobsGestureLockResource imageNamed:@"红色椭圆"];
    configuration.indicatorNormalImage = [JobsGestureLockResource imageNamed:@"灰色椭圆"];
    configuration.indicatorSelectedImage = [JobsGestureLockResource imageNamed:@"橙色椭圆"];
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
