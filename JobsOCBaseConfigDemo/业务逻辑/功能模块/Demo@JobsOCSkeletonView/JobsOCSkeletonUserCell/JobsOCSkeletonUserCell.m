//
//  JobsOCSkeletonUserCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsOCSkeletonUserCell.h"

@interface JobsOCSkeletonUserCell ()

Prop_strong()UIImageView *avatarImageView;
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subtitleLab;
Prop_strong()UIView *subtitleShortLineView;

@end

@implementation JobsOCSkeletonUserCell
+(NSString *)reuseIdentifier{
    return NSStringFromClass(self);
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.byBgColor(UIColor.secondarySystemGroupedBackgroundColor);
        self.byBgColor(UIColor.clearColor);
        self.avatarImageView.byAlpha(1);
        self.titleLab.byAlpha(1);
        self.subtitleLab.byAlpha(1);
        self.subtitleShortLineView.byAlpha(1);
        self.bySkeletonable(YES);
        self.contentView.bySkeletonable(YES);
    };return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    [self hideSkeleton];
    self.avatarImageView
        .byImage(nil)
        .byBgColor(UIColor.clearColor);
    self.titleLab.byText(nil);
    self.subtitleLab.byText(nil);
    self.subtitleShortLineView.byHidden(YES);
}

-(void)configureWithUser:(JobsOCSkeletonUser *)user{
    [self hideSkeleton];
    self.avatarImageView.byBgColor(user.color);
    self.titleLab.byText(user.name);
    self.subtitleLab.byText(user.detail);
    self.subtitleShortLineView.byHidden(YES);
}

-(void)showSkeletonWithConfig:(JobsOCSkeletonConfig *)config{
    self.avatarImageView.byBgColor(UIColor.clearColor);
    self.titleLab.byText(@"");
    self.subtitleLab.byText(@"");
    self.subtitleShortLineView.byHidden(NO);
    [self.avatarImageView jobs_startSkeletonWithConfig:config];
    [self.titleLab jobs_startSkeletonWithConfig:config];
    [self.subtitleLab jobs_startSkeletonWithConfig:config];
    [self.subtitleShortLineView jobs_startSkeletonWithConfig:config];
}

-(void)hideSkeleton{
    [self.avatarImageView jobs_stopSkeleton];
    [self.titleLab jobs_stopSkeleton];
    [self.subtitleLab jobs_stopSkeleton];
    [self.subtitleShortLineView jobs_stopSkeleton];
}
#pragma mark —— LazyLoad
-(UIImageView *)avatarImageView{
    if (!_avatarImageView) {
        @jobs_weakify(self)
        _avatarImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byContentMode(UIViewContentModeScaleAspectFill)
                .byClipsToBounds(YES)
                .bySkeletonable(YES)
                .bySkeletonCornerRadius(JobsWidth(24))
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(48), JobsWidth(48)));
                    make.left.equalTo(self.contentView).offset(JobsWidth(16));
                    make.centerY.equalTo(self.contentView);
                    make.top.greaterThanOrEqualTo(self.contentView).offset(JobsWidth(12));
                    make.bottom.lessThanOrEqualTo(self.contentView).offset(-JobsWidth(12));
                });
        });
        _avatarImageView.byLayer(^(__kindof CALayer * _Nullable layer) {
            layer.byCornerRadius(JobsWidth(24));
        });
    };return _avatarImageView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont(UIFontWeightSemiboldSize(16))
                .byTextCor(UIColor.labelColor)
                .byNumberOfLines(1)
                .bySkeletonLinesCornerRadius(6)
                .bySkeletonable(YES)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.avatarImageView.mas_right).offset(JobsWidth(12));
                    make.right.equalTo(self.contentView).offset(-JobsWidth(16));
                    make.top.equalTo(self.contentView).offset(JobsWidth(16));
                    make.height.mas_equalTo(JobsWidth(18));
                });
        });
    };return _titleLab;
}

-(UILabel *)subtitleLab{
    if (!_subtitleLab) {
        @jobs_weakify(self)
        _subtitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont(UIFontWeightRegularSize(13))
                .byTextCor(UIColor.secondaryLabelColor)
                .byNumberOfLines(2)
                .bySkeletonLinesCornerRadius(6)
                .bySkeletonLastLineFillPercent(60)
                .bySkeletonable(YES)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.titleLab);
                    make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(8));
                    make.height.mas_equalTo(JobsWidth(16));
                });
        });
    };return _subtitleLab;
}

-(UIView *)subtitleShortLineView{
    if (!_subtitleShortLineView) {
        @jobs_weakify(self)
        _subtitleShortLineView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byHidden(YES)
                .bySkeletonable(YES)
                .bySkeletonCornerRadius(6)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.titleLab);
                    make.top.equalTo(self.subtitleLab.mas_bottom).offset(JobsWidth(6));
                    make.width.equalTo(self.titleLab).multipliedBy(0.6);
                    make.height.mas_equalTo(JobsWidth(14));
                    make.bottom.lessThanOrEqualTo(self.contentView).offset(-JobsWidth(12));
                });
        });
    };return _subtitleShortLineView;
}

@end
