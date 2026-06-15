//
//  PointLabBaseView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_POINTLABBASEVIEW_870F83CE08
#define JOBS_HEADER_GUARD_POINTLABBASEVIEW_870F83CE08

#import <UIKit/UIKit.h>
#import <JobsBaseUI/BaseView.h>
#import <JobsBaseUI/UIView+Extra.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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
/// 文本前面有个小圆点
@interface PointLabBaseView : BaseView

-(UIView *)pointView;
-(UILabel *)label;

-(jobsByCGFloatBlock _Nonnull)updatePointViewPositionWithOffsetY;
-(jobsByCGFloatBlock _Nonnull)updateLabelPositionWithOffsetX;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof PointLabBaseView *_Nonnull jobsMakePointLabView(jobsByPointLabBaseViewBlock _Nonnull block){
    PointLabBaseView *data = PointLabBaseView.alloc.init;
    if (block) block(data);
    return data;
}
/**

     -(void)layoutSubviews{
         [super layoutSubviews];
         self.tipsLab.updatePointViewPositionWithOffsetY(10);
         self.tipsLab updateLabelPositionWithOffsetX(20);
     }

     -(PointLabView *)tipsLab{
         if(!_tipsLab){
             @jobs_weakify(self)
             _tipsLab = jobsMakePointLabView(^(__kindof PointLabBaseView * _Nullable view) {
                 @jobs_strongify(self)
                 view.pointView.byBgColor(@"#D0D0D0".cor);

                 view.pointView.cornerCutToCircleWithCornerRadius(JobsWidth(4));
                 view.label.byText(@"Your deposit will be successfully credited to your wallet once the transaction completed.".tr);

                 view.label.byTextCor(@"#D0D0D0".cor);

                 view.label.byFont(UIFontWeightRegularSize(JobsWidth(12)));

                 view.label.byTextAlignment(NSTextAlignmentLeft);

                 view.label.byNumberOfLines(0);

                 view.label.lineBreakMode = NSLineBreakByWordWrapping;
                 view.label.byBgColor(JobsClearColor.colorWithAlphaComponentBy(0));

                 view.byBgColor(JobsClearColor.colorWithAlphaComponentBy(0));

                 _tipsLab.addOn(self).byAdd(^(MASConstraintMaker *make) {
                     make.centerX.equalTo(self);
                     make.top.equalTo(self.tableView.mas_bottom).offset(JobsWidth(0));
                     make.width.mas_equalTo(JobsWidth(256));
                 });
                 view.label.makeLabelByShowingType(UILabelShowingType_05);
             });
         };return _tipsLab;
     }
 */
#endif /* JOBS_HEADER_GUARD_POINTLABBASEVIEW_870F83CE08 */
