//
//  JobsBaseLabel.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBASELABEL_E92ECEBB9B
#define JOBS_HEADER_GUARD_JOBSBASELABEL_E92ECEBB9B

#import <UIKit/UIKit.h>
#import "UIView+Extra.h"
#import "BaseLabel.h"

#import "JobsOCDSL.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#import "JobsModelDSL.h"

#import "JobsMakes.h"

#import "JobsLanMgr.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// UILabel实现背景图片
@interface JobsBaseLabel : BaseLabel
#pragma mark —— 一些公有方法
-(UIImageView *)getBgImageView;
-(BaseLabel *)getLabel;

@end

NS_ASSUME_NONNULL_END
/**
 
     -(JobsBaseLabel *)titleLab{
         if (!_titleLab) {
             _titleLab = JobsBaseLabel.new;
             _titleLab.jobsRichViewByModel(nil);
             _titleLab.getLabel.offsetY = JobsWidth(-2);
             _titleLab.getLabel.byTextCor(JobsWhiteColor);

             _titleLab.getLabel.byFont(UIFontWeightRegularSize(12));

             _titleLab.getLabel.byTextAlignment(NSTextAlignmentCenter);

             _titleLab.addOn(self.contentView).byAdd(^(MASConstraintMaker *make) {
                 make.top.left.equalTo(self.contentView);
                 make.height.mas_equalTo(JobsWidth(26));
             });

         }
         _titleLab.getLabel.byText(@" 真人           ".tr);

        _titleLab.getBgImageView.byImage(@"优惠活动背景图_真人".img)

         _titleLab.getLabel.makeLabelByShowingType(UILabelShowingType_03);
         [_titleLab.getLabel appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];

         return _titleLab;
     }
 */
#endif /* JOBS_HEADER_GUARD_JOBSBASELABEL_E92ECEBB9B */
