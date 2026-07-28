//
//  JobsAnimationLabel.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSANIMATIONLABEL_D61CD3D838
#define JOBS_HEADER_GUARD_JOBSANIMATIONLABEL_D61CD3D838

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsAnimationLabel : UILabel
/**
 动画数字改变
 
 @param fromValue 开始数值
 @param toValue 结束数值
 @param duration 动画时间
 @param complete 完成回调
 */
- (void)animationTextStartValue:(CGFloat)fromValue
                       endValue:(CGFloat)toValue
                       duration:(CGFloat)duration
                       complete:(void (^)(UILabel *label, CGFloat value))complete;
@end

NS_ASSUME_NONNULL_END

/**
 
 调用示例：
 -(JobsAnimationLabel *)animationLab{
     if (!_animationLab) {
         _animationLab = JobsAnimationLabel.new;
         _animationLab.byTextCor(JobsLabelColor);

         
         _animationLab.byText(@"12");

         _animationLab.value = 12;
         _animationLab.lastValue = 120;
         
         [_animationLab animationTextStartValue:_animationLab.value
                                       endValue:_animationLab.lastValue
                                       duration:1.0
                                       complete:^(UILabel *label, CGFloat value) {
             label.byText([NSString stringWithFormat:@"%f", value]);

             label.value = value;
             label.lastValue = (label.value * 3);
         }];
         
         _animationLab.addOn(self).byAdd(^(MASConstraintMaker *make) {
             make.bottom.equalTo(self.progressView);
             make.left.equalTo(self.progressView);
         });

     };return _animationLab;
 }

 */
#endif /* JOBS_HEADER_GUARD_JOBSANIMATIONLABEL_D61CD3D838 */
