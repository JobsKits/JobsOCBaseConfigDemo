//
//  JobsBaseLabel.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBASELABEL_E92ECEBB9B
#define JOBS_HEADER_GUARD_JOBSBASELABEL_E92ECEBB9B

#import <UIKit/UIKit.h>
#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/BaseLabel.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

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

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

         _titleLab.getBgImageView.image = @"优惠活动背景图_真人".img

         _titleLab.getLabel.makeLabelByShowingType(UILabelShowingType_03);
         [_titleLab.getLabel appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];

         return _titleLab;
     }
 */
#endif /* JOBS_HEADER_GUARD_JOBSBASELABEL_E92ECEBB9B */
