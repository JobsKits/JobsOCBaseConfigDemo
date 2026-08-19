//
//  JobsGestureLockConfiguration.m
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsGestureLockConfiguration.h"

@implementation JobsGestureLockConfiguration
+ (JobsRetJobsGestureLockConfigurationByVoidBlock _Nonnull)defaultConfiguration {
    return ^JobsGestureLockConfiguration *{
        return JobsGestureLockConfiguration.new
            .byMinimumPatternLength(4)
            .byLineWidth(6.0)
            .byNormalLineColor(UIColor.clearColor)
            .bySelectedLineColor(JobsSystemBlueColor)
            .byErrorLineColor(JobsSystemRedColor)
            .byStatusTextColor(JobsLabelColor)
            .byStatusFont(UIFontWeightMediumSize(15.0))
            .byCreateStatusText(@"绘制新手势（至少 4 个点）")
            .byConfirmStatusText(@"请再绘制一次进行确认")
            .byValidateStatusText(@"请输入手势解锁")
            .byTooShortStatusText(@"至少连接 4 个点")
            .byMismatchStatusText(@"两次不一致，请重新设置")
            .byErrorFormat(@"手势错误，还可以再输入 %ld 次")
            .byMaxRetryCount(5)
            .byNodeNormalImage(nil)
            .byNodeSelectedImage(nil)
            .byNodeErrorImage(nil)
            .byIndicatorNormalImage(nil)
            .byIndicatorSelectedImage(nil);
    };
}

- (id)copyWithZone:(NSZone *)zone {
    return ((JobsGestureLockConfiguration *)[[[self class] allocWithZone:zone] init])
        .byMinimumPatternLength(self.minimumPatternLength)
        .byLineWidth(self.lineWidth)
        .byNormalLineColor(self.normalLineColor)
        .bySelectedLineColor(self.selectedLineColor)
        .byErrorLineColor(self.errorLineColor)
        .byStatusTextColor(self.statusTextColor)
        .byStatusFont(self.statusFont)
        .byCreateStatusText(self.createStatusText)
        .byConfirmStatusText(self.confirmStatusText)
        .byValidateStatusText(self.validateStatusText)
        .byTooShortStatusText(self.tooShortStatusText)
        .byMismatchStatusText(self.mismatchStatusText)
        .byErrorFormat(self.errorFormat)
        .byMaxRetryCount(self.maxRetryCount)
        .byNodeNormalImage(self.nodeNormalImage)
        .byNodeSelectedImage(self.nodeSelectedImage)
        .byNodeErrorImage(self.nodeErrorImage)
        .byIndicatorNormalImage(self.indicatorNormalImage)
        .byIndicatorSelectedImage(self.indicatorSelectedImage);
}

-(JobsRetJobsGestureLockConfigurationByNSUIntegerBlock _Nonnull)byMinimumPatternLength{
    @jobs_weakify(self)
    return ^__kindof JobsGestureLockConfiguration *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.minimumPatternLength = data;
        return self;
    };
}

-(JobsRetJobsGestureLockConfigurationByNSIntegerBlock _Nonnull)byMaxRetryCount{
    @jobs_weakify(self)
    return ^__kindof JobsGestureLockConfiguration *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.maxRetryCount = data;
        return self;
    };
}

-(JobsRetJobsGestureLockConfigurationByCGFloatBlock _Nonnull)byLineWidth{
    @jobs_weakify(self)
    return ^__kindof JobsGestureLockConfiguration *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.lineWidth = data;
        return self;
    };
}

#define JobsGestureLockConfigurationObjectDSL(_type_, _name_, _property_, _dataType_) \
-(JobsRetJobsGestureLockConfigurationBy##_type_##Block _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsGestureLockConfiguration *_Nullable(_dataType_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JobsGestureLockConfigurationObjectDSL(Cor, NormalLineColor, normalLineColor, UIColor *_Nullable)
JobsGestureLockConfigurationObjectDSL(Cor, SelectedLineColor, selectedLineColor, UIColor *_Nullable)
JobsGestureLockConfigurationObjectDSL(Cor, ErrorLineColor, errorLineColor, UIColor *_Nullable)
JobsGestureLockConfigurationObjectDSL(Cor, StatusTextColor, statusTextColor, UIColor *_Nullable)
JobsGestureLockConfigurationObjectDSL(Font, StatusFont, statusFont, UIFont *_Nullable)
JobsGestureLockConfigurationObjectDSL(Str, CreateStatusText, createStatusText, NSString *_Nullable)
JobsGestureLockConfigurationObjectDSL(Str, ConfirmStatusText, confirmStatusText, NSString *_Nullable)
JobsGestureLockConfigurationObjectDSL(Str, ValidateStatusText, validateStatusText, NSString *_Nullable)
JobsGestureLockConfigurationObjectDSL(Str, TooShortStatusText, tooShortStatusText, NSString *_Nullable)
JobsGestureLockConfigurationObjectDSL(Str, MismatchStatusText, mismatchStatusText, NSString *_Nullable)
JobsGestureLockConfigurationObjectDSL(Str, ErrorFormat, errorFormat, NSString *_Nullable)
JobsGestureLockConfigurationObjectDSL(Image, NodeNormalImage, nodeNormalImage, UIImage *_Nullable)
JobsGestureLockConfigurationObjectDSL(Image, NodeSelectedImage, nodeSelectedImage, UIImage *_Nullable)
JobsGestureLockConfigurationObjectDSL(Image, NodeErrorImage, nodeErrorImage, UIImage *_Nullable)
JobsGestureLockConfigurationObjectDSL(Image, IndicatorNormalImage, indicatorNormalImage, UIImage *_Nullable)
JobsGestureLockConfigurationObjectDSL(Image, IndicatorSelectedImage, indicatorSelectedImage, UIImage *_Nullable)

#undef JobsGestureLockConfigurationObjectDSL

@end
