//
//  JobsOCCommentCell.m
//  JobsOCComment
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsOCCommentCell.h"

@interface JobsOCCommentCell ()

Prop_strong()UIView *containerView;
Prop_strong()UIImageView *avatarImageView;
Prop_strong()UILabel *avatarLabel;
Prop_strong()UIStackView *textStackView;
Prop_strong()UILabel *nameLabel;
Prop_strong()UILabel *timeLabel;
Prop_strong()UIStackView *replyHintStackView;
Prop_strong()UIImageView *replyHintAvatarImageView;
Prop_strong()UILabel *replyHintAvatarLabel;
Prop_strong()UILabel *replyHintLabel;
Prop_strong()UILabel *contentLabel;
Prop_strong()UILabel *metaLabel;
Prop_strong()UILabel *replySummaryLabel;

-(JobsRetStrByStrBlock _Nonnull)jobs_initialTextByName;
-(JobsRetCorByStrBlock _Nonnull)jobs_avatarColorByText;
-(JobsRetNSStringByJobsOCCommentModelBlock _Nonnull)jobs_metaTextByComment;
-(jobsByJobsOCCommentModelBlock _Nonnull)jobs_updateReplyHintByParentComment;
-(void)jobs_updateAvatarImageView:(UIImageView *)imageView
                      avatarLabel:(UILabel *)avatarLabel
                          byName:(NSString *)name
                       userAvatar:(NSString *)userAvatar;

@end

@implementation JobsOCCommentCell
+(JobsRetStrByVoidBlock _Nonnull)reuseIdentifier{
    return ^NSString *_Nullable{
        return NSStringFromClass(self);
    };
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.bySelectionStyle(UITableViewCellSelectionStyleNone);
        self.byBgColor(UIColor.clearColor);
        self.contentView.byBgColor(UIColor.clearColor);
        self.containerView.addOn(self.contentView);
        self.avatarImageView.addOn(self.containerView);
        self.avatarLabel.addOn(self.avatarImageView);
        self.textStackView.addOn(self.containerView);
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(6);
            make.left.equalTo(self.contentView).offset(12);
            make.right.equalTo(self.contentView).offset(-12);
            make.bottom.equalTo(self.contentView).offset(-6);
        }];
        [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.containerView).offset(12);
            make.size.mas_equalTo(CGSizeMake(36, 36));
        }];
        [self.avatarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.avatarImageView);
        }];
        [self.textStackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.containerView).offset(12);
            make.left.equalTo(self.avatarImageView.mas_right).offset(10);
            make.right.bottom.equalTo(self.containerView).offset(-12);
        }];
    };return self;
}

-(void)prepareForReuse{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCCommentCell.class, @selector(jobsPrepareForReuse)))(self, @selector(jobsPrepareForReuse));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsPrepareForReuse{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super prepareForReuse];
        self.avatarImageView.byImage(nil);
        self.avatarImageView.byHidden(NO);
        self.avatarLabel.byText(nil);
        self.avatarLabel.byHidden(NO);
        self.nameLabel.byText(nil);
        self.nameLabel.byHidden(NO);
        self.timeLabel.byText(nil);
        self.timeLabel.byHidden(NO);
        self.replyHintStackView.byHidden(YES);
        self.replyHintAvatarImageView.byImage(nil);
        self.replyHintAvatarLabel.byText(nil);
        self.replyHintLabel.byText(nil);
        self.replyHintLabel.byHidden(NO);
        self.contentLabel.byText(nil);
        self.contentLabel.byHidden(NO);
        self.metaLabel.byText(nil);
        self.metaLabel.byHidden(NO);
        self.replySummaryLabel.byText(nil);
        self.replySummaryLabel.byHidden(YES);
        self.replySummaryLabel.byTextAlignment(NSTextAlignmentLeft);
    };
}

-(void)updateWithComment:(JobsOCCommentModel *)comment
                  config:(JobsOCCommentConfig *)config
                   depth:(NSInteger)depth
           parentComment:(JobsOCCommentModel *)parentComment{
    JobsOCCommentMode mode = config.mode;
    [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(JobsOCCommentLeadingByModeAndDepth(mode, depth));
    }];
    BOOL isChild = depth > 0;
    self.containerView.byBgColor((isChild && mode == JobsOCCommentModeNetEase) ? RGBA_COLOR(0.96 * 255.0, 0.97 * 255.0, 0.99 * 255.0, 1) : UIColor.whiteColor);
    self.nameLabel.byText(comment.nickname.length ? comment.nickname : @"匿名用户");
    self.timeLabel.byText(comment.publishTime);
    self.contentLabel.byText(comment.content);
    self.metaLabel.byText(self.jobs_metaTextByComment(comment));
    self.metaLabel.byHidden(self.metaLabel.text.length == 0);
    self.replyHintStackView.byHidden(YES);
    self.replySummaryLabel.byHidden(YES);
    if (mode == JobsOCCommentModeCustom && depth >= 2 && parentComment.nickname.length) {
        self.jobs_updateReplyHintByParentComment(parentComment);
    }
    if (config.showsReplyEntrance &&
        mode == JobsOCCommentModeToutiao &&
        depth == 0 &&
        comment.children.count) {
        self.replySummaryLabel.byText([NSString stringWithFormat:@"查看 %lu 条回复", (unsigned long)comment.children.count]);
        self.replySummaryLabel.byHidden(NO);
    }
    [self jobs_updateAvatarImageView:self.avatarImageView
                          avatarLabel:self.avatarLabel
                              byName:comment.nickname
                           userAvatar:comment.userAvatar];
}

-(void)updateWithMoreText:(NSString *)moreText
                   config:(JobsOCCommentConfig *)config
                    depth:(NSInteger)depth{
    [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(JobsOCCommentLeadingByModeAndDepth(config.mode, depth));
    }];
    self.containerView.byBgColor(JobsSecondarySystemBackgroundColor);
    self.avatarImageView.byHidden(YES);
    self.avatarLabel.byHidden(YES);
    self.nameLabel.byHidden(YES);
    self.timeLabel.byHidden(YES);
    self.replyHintStackView.byHidden(YES);
    self.contentLabel.byHidden(YES);
    self.metaLabel.byHidden(YES);
    self.replySummaryLabel.byText(moreText.length ? moreText : JobsOCCommentMoreRepliesText);
    self.replySummaryLabel.byTextAlignment(NSTextAlignmentCenter);
    self.replySummaryLabel.byHidden(NO);
}

-(jobsByJobsOCCommentModelBlock _Nonnull)jobs_updateReplyHintByParentComment{
    @jobs_weakify(self)
    return ^(JobsOCCommentModel * parentComment){
        @jobs_strongify(self)
        if (!self) return;
        [self jobs_updateAvatarImageView:self.replyHintAvatarImageView
                              avatarLabel:self.replyHintAvatarLabel
                                  byName:parentComment.nickname
                               userAvatar:parentComment.userAvatar];
        self.replyHintLabel.byText([NSString stringWithFormat:@"回复：“%@”", parentComment.nickname]);
        self.replyHintStackView.byHidden(NO);
    };
}

-(void)jobs_updateAvatarImageView:(UIImageView *)imageView
                      avatarLabel:(UILabel *)avatarLabel
                          byName:(NSString *)name
                       userAvatar:(NSString *)userAvatar{
    UIImage *avatarImage = userAvatar.length ? [UIImage imageNamed:userAvatar] : nil;
    imageView.byImage(avatarImage);
    avatarLabel.byHidden(avatarImage != nil);
    if (!avatarImage) {
        NSString *initialText = self.jobs_initialTextByName(name);
        avatarLabel.byText(initialText);
        imageView.byBgColor(self.jobs_avatarColorByText(initialText));
    }else{
        imageView.byBgColor(UIColor.clearColor);
    }
}

-(JobsRetStrByStrBlock _Nonnull)jobs_initialTextByName{
    @jobs_weakify(self)
    return ^NSString *(NSString * name){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *text = name.length ? name : @"匿";
        NSRange range = [text rangeOfComposedCharacterSequenceAtIndex:0];
        return [text substringWithRange:range];
    };
}

-(JobsRetCorByStrBlock _Nonnull)jobs_avatarColorByText{
    @jobs_weakify(self)
    return ^UIColor *(NSString * text){
        @jobs_strongify(self)
        if (!self) return nil;
        NSUInteger hash = text.hash;
        NSArray <UIColor *>*colors = @[
            RGBA_COLOR(0.22 * 255.0, 0.45 * 255.0, 0.78 * 255.0, 1),
            RGBA_COLOR(0.13 * 255.0, 0.60 * 255.0, 0.42 * 255.0, 1),
            RGBA_COLOR(0.82 * 255.0, 0.31 * 255.0, 0.33 * 255.0, 1),
            RGBA_COLOR(0.52 * 255.0, 0.36 * 255.0, 0.76 * 255.0, 1),
            RGBA_COLOR(0.90 * 255.0, 0.55 * 255.0, 0.18 * 255.0, 1)
        ];
        return colors[hash % colors.count];
    };
}

-(JobsRetNSStringByJobsOCCommentModelBlock _Nonnull)jobs_metaTextByComment{
    @jobs_weakify(self)
    return ^NSString *(JobsOCCommentModel * comment){
        @jobs_strongify(self)
        if (!self) return nil;
        NSMutableArray <NSString *>*meta = NSMutableArray.array;
        if (comment.device.length) [meta addObject:comment.device];
        if (comment.location.length) [meta addObject:comment.location];
        return [meta componentsJoinedByString:@" · "];
    };
}
#pragma mark —— LazyLoad
-(UIView *)containerView{
    if (!_containerView) {
        _containerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byTranslatesAutoresizingMaskIntoConstraints(NO)

                .byCornerRadius(8)
                .byClipsToBounds(YES);
        });
    };return _containerView;
}

-(UIImageView *)avatarImageView{
    if (!_avatarImageView) {
        _avatarImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.byTranslatesAutoresizingMaskIntoConstraints(NO)

                .byContentMode(UIViewContentModeScaleAspectFill)
                .byUserInteractionEnabled(NO)
                .byCornerRadius(18)
                .byClipsToBounds(YES);
        });
    };return _avatarImageView;
}

-(UILabel *)avatarLabel{
    if (!_avatarLabel) {
        _avatarLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byFont(UIFontWeightSemiboldSize(15))
                .byTextAlignment(NSTextAlignmentCenter)
                .byTextCor(UIColor.whiteColor)
                .byTranslatesAutoresizingMaskIntoConstraints(NO);
        });
    };return _avatarLabel;
}

-(UIStackView *)textStackView{
    if (!_textStackView) {
        _textStackView = jobsMakeStackView(^(__kindof UIStackView *_Nullable stackView) {
            stackView
                .byAxis(UILayoutConstraintAxisVertical)
                .byAlignment(UIStackViewAlignmentFill)
                .bySpacing(4)
                .byTranslatesAutoresizingMaskIntoConstraints(NO);
        });
        _textStackView
            .byAddArrangedSubview(self.nameLabel)
            .byAddArrangedSubview(self.timeLabel)
            .byAddArrangedSubview(self.replyHintStackView)
            .byAddArrangedSubview(self.contentLabel)
            .byAddArrangedSubview(self.metaLabel)
            .byAddArrangedSubview(self.replySummaryLabel);
    };return _textStackView;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightSemiboldSize(15))
                .byTextCor(RGBA_COLOR(0.11 * 255.0, 0.16 * 255.0, 0.23 * 255.0, 1));
        });
    };return _nameLabel;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightRegularSize(12))
                .byTextCor(RGBA_COLOR(0.54 * 255.0, 0.60 * 255.0, 0.68 * 255.0, 1));
        });
    };return _timeLabel;
}

-(UILabel *)replyHintLabel{
    if (!_replyHintLabel) {
        _replyHintLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightMediumSize(12))
                .byTextCor(RGBA_COLOR(0.23 * 255.0, 0.42 * 255.0, 0.74 * 255.0, 1));
        });
    };return _replyHintLabel;
}

-(UIStackView *)replyHintStackView{
    if (!_replyHintStackView) {
        _replyHintStackView = jobsMakeStackView(^(__kindof UIStackView *_Nullable stackView) {
            stackView
                .byAxis(UILayoutConstraintAxisHorizontal)
                .byAlignment(UIStackViewAlignmentCenter)
                .bySpacing(5);
        });
        _replyHintStackView.byHidden(YES);
        _replyHintStackView
            .byAddArrangedSubview(self.replyHintAvatarImageView)
            .byAddArrangedSubview(self.replyHintLabel);
    };return _replyHintStackView;
}

-(UIImageView *)replyHintAvatarImageView{
    if (!_replyHintAvatarImageView) {
        _replyHintAvatarImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byContentMode(UIViewContentModeScaleAspectFill)
                .byUserInteractionEnabled(NO)
                .byCornerRadius(8)
                .byClipsToBounds(YES)
                .addBy(self.replyHintAvatarLabel);
        });
        [_replyHintAvatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];
        [self.replyHintAvatarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_replyHintAvatarImageView);
        }];
    };return _replyHintAvatarImageView;
}

-(UILabel *)replyHintAvatarLabel{
    if (!_replyHintAvatarLabel) {
        _replyHintAvatarLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightSemiboldSize(8))
                .byTextAlignment(NSTextAlignmentCenter)
                .byTextCor(UIColor.whiteColor);
        });
    };return _replyHintAvatarLabel;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightRegularSize(15))
                .byTextCor(RGBA_COLOR(0.22 * 255.0, 0.26 * 255.0, 0.32 * 255.0, 1))
                .byNumberOfLines(0);
        });
    };return _contentLabel;
}

-(UILabel *)metaLabel{
    if (!_metaLabel) {
        _metaLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightRegularSize(12))
                .byTextCor(RGBA_COLOR(0.55 * 255.0, 0.60 * 255.0, 0.66 * 255.0, 1));
        });
    };return _metaLabel;
}

-(UILabel *)replySummaryLabel{
    if (!_replySummaryLabel) {
        _replySummaryLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightMediumSize(13))
                .byTextCor(RGBA_COLOR(0.19 * 255.0, 0.39 * 255.0, 0.72 * 255.0, 1))
                .byHidden(YES);
        });
    };return _replySummaryLabel;
}

@end
