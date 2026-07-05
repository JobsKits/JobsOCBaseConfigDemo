//
//  JobsStepView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSTEPVIEW_F57DC2B909
#define JOBS_HEADER_GUARD_JOBSSTEPVIEW_F57DC2B909

#import <UIKit/UIKit.h>

#import "JobsOCDSL.h"

#import "JobsBaseUI.h"

#import "JobsByOCPods.h"

#import "UIButton+JobsStepView.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsStepView : BaseView

+(JobsRetBtnModelByStrAndImagesBlock _Nonnull)makeButtonModelBy;
/// 值越大 = 按钮之间的距离越小
-(JobsRetStepViewByCGFloatBlock _Nonnull)byOffset;
/// 设置左边线长度
-(JobsRetStepViewByCGFloatBlock _Nonnull)byLeftViewWidth;
/// 设置右边线长度
-(JobsRetStepViewByCGFloatBlock _Nonnull)byRightViewWidth;
/// 设置按钮之间的距离
-(JobsRetStepViewByCGFloatBlock _Nonnull)byBtnOffset;
/// 设置第一个按钮距离父视图左边的距离
-(JobsRetStepViewByCGFloatBlock _Nonnull)byFirstBtnLeftOffset;
/// 设置左边线（高亮）颜色
-(JobsRetStepViewByColorBlock _Nonnull)byLeftLabHighlightBgCor;
/// 设置左边线（普通）颜色
-(JobsRetStepViewByColorBlock _Nonnull)byLeftLabNormalBgCor;
/// 设置右边线（高亮）颜色
-(JobsRetStepViewByColorBlock _Nonnull)byRightLabHighlightBgCor;
/// 设置右边线（普通）颜色
-(JobsRetStepViewByColorBlock _Nonnull)byRightLabNormalBgCor;
/// 设置当前显示状态
-(JobsRetStepViewByNSIntegerBlock _Nonnull)byStatus;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsStepView *_Nonnull jobsMakeStepView(jobsByStepViewBlock _Nonnull block){
    JobsStepView *data = JobsStepView.alloc.init;
    if (block) block(data);
    return data;
}
/**
 
     -(JobsStepView *)stepView{
         if(!_stepView){
             _stepView = self.view.addSubview(jobsMakeStepView(^(__kindof JobsStepView * _Nullable stepView) {
                 stepView.byOffset(JobsWidth(10))
                 .byLeftViewWidth(JobsWidth(60))
                 .byRightViewWidth(JobsWidth(60))
                 .byBtnOffset(JobsWidth(60))
                 .byFirstBtnLeftOffset(JobsWidth(24))
                 .byLeftLabHighlightBgCor(@"#C71A1A".cor)
                 .byRightLabHighlightBgCor(@"#C71A1A".cor)
                 .byLeftLabNormalBgCor(JobsGrayColor)
                 .byRightLabNormalBgCor(JobsGrayColor)
                 .byStatus(VerificationStatusVerifying)
                 .jobsRichViewByModel(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIButtonModel *>* _Nullable data) {
                     data.add(JobsStepView.makeButtonModelBy(@"Unverified".tr,@"正在进行第一步".img,@"正在进行第一步".img))
                         .add(JobsStepView.makeButtonModelBy(@"Verifiying".tr,@"还未进行第二步".img,@"正在进行第二步".img))
                         .add(JobsStepView.makeButtonModelBy(@"Verified".tr,@"还未进行第三步".img,@"正在进行第三步".img));
                 }));
             })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
                 make.top.equalTo(self.gk_navigationBar.mas_bottom);
                 make.centerX.equalTo(self.view);
                 make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(100)));
             }).on().byBgColor(JobsWhiteColor);
         };return _stepView;
     }
 */
#endif /* JOBS_HEADER_GUARD_JOBSSTEPVIEW_F57DC2B909 */
