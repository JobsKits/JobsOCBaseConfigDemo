//
//  JobsOCCommentCell.m
//  JobsOCComment
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsOCCommentCell.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

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

-(NSString *)jobs_initialTextByName:(NSString *)name;
-(UIColor *)jobs_avatarColorByText:(NSString *)text;
-(NSString *)jobs_metaTextByComment:(JobsOCCommentModel *)comment;
-(void)jobs_updateReplyHintByParentComment:(JobsOCCommentModel *)parentComment;
-(void)jobs_updateAvatarImageView:(UIImageView *)imageView
                      avatarLabel:(UILabel *)avatarLabel
                          byName:(NSString *)name
                       userAvatar:(NSString *)userAvatar;

@end

@implementation JobsOCCommentCell
+(NSString *)reuseIdentifier{
    return NSStringFromClass(self);
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColor.clearColor;
        self.contentView.backgroundColor = UIColor.clearColor;
        [self.contentView addSubview:self.containerView];
        [self.containerView addSubview:self.avatarImageView];
        [self.avatarImageView addSubview:self.avatarLabel];
        [self.containerView addSubview:self.textStackView];
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
    [super prepareForReuse];
    self.avatarImageView.image = nil;
    self.avatarImageView.hidden = NO;
    self.avatarLabel.text = nil;
    self.avatarLabel.hidden = NO;
    self.nameLabel.text = nil;
    self.nameLabel.hidden = NO;
    self.timeLabel.text = nil;
    self.timeLabel.hidden = NO;
    self.replyHintStackView.hidden = YES;
    self.replyHintAvatarImageView.image = nil;
    self.replyHintAvatarLabel.text = nil;
    self.replyHintLabel.text = nil;
    self.replyHintLabel.hidden = NO;
    self.contentLabel.text = nil;
    self.contentLabel.hidden = NO;
    self.metaLabel.text = nil;
    self.metaLabel.hidden = NO;
    self.replySummaryLabel.text = nil;
    self.replySummaryLabel.hidden = YES;
    self.replySummaryLabel.textAlignment = NSTextAlignmentLeft;
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
    self.containerView.backgroundColor = (isChild && mode == JobsOCCommentModeNetEase) ? [UIColor colorWithRed:0.96 green:0.97 blue:0.99 alpha:1] : UIColor.whiteColor;
    self.nameLabel.text = comment.nickname.length ? comment.nickname : @"匿名用户";
    self.timeLabel.text = comment.publishTime;
    self.contentLabel.text = comment.content;
    self.metaLabel.text = [self jobs_metaTextByComment:comment];
    self.metaLabel.hidden = self.metaLabel.text.length == 0;
    self.replyHintStackView.hidden = YES;
    self.replySummaryLabel.hidden = YES;
    if (mode == JobsOCCommentModeCustom && depth >= 2 && parentComment.nickname.length) {
        [self jobs_updateReplyHintByParentComment:parentComment];
    }
    if (config.showsReplyEntrance &&
        mode == JobsOCCommentModeToutiao &&
        depth == 0 &&
        comment.children.count) {
        self.replySummaryLabel.text = [NSString stringWithFormat:@"查看 %lu 条回复", (unsigned long)comment.children.count];
        self.replySummaryLabel.hidden = NO;
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
    self.containerView.backgroundColor = UIColor.whiteColor;
    self.avatarImageView.hidden = YES;
    self.avatarLabel.hidden = YES;
    self.nameLabel.hidden = YES;
    self.timeLabel.hidden = YES;
    self.replyHintStackView.hidden = YES;
    self.contentLabel.hidden = YES;
    self.metaLabel.hidden = YES;
    self.replySummaryLabel.text = moreText.length ? moreText : JobsOCCommentMoreRepliesText;
    self.replySummaryLabel.textAlignment = NSTextAlignmentCenter;
    self.replySummaryLabel.hidden = NO;
}

-(void)jobs_updateReplyHintByParentComment:(JobsOCCommentModel *)parentComment{
    [self jobs_updateAvatarImageView:self.replyHintAvatarImageView
                          avatarLabel:self.replyHintAvatarLabel
                              byName:parentComment.nickname
                           userAvatar:parentComment.userAvatar];
    self.replyHintLabel.text = [NSString stringWithFormat:@"回复：“%@”", parentComment.nickname];
    self.replyHintStackView.hidden = NO;
}

-(void)jobs_updateAvatarImageView:(UIImageView *)imageView
                      avatarLabel:(UILabel *)avatarLabel
                          byName:(NSString *)name
                       userAvatar:(NSString *)userAvatar{
    UIImage *avatarImage = userAvatar.length ? [UIImage imageNamed:userAvatar] : nil;
    imageView.image = avatarImage;
    avatarLabel.hidden = avatarImage != nil;
    if (!avatarImage) {
        NSString *initialText = [self jobs_initialTextByName:name];
        avatarLabel.text = initialText;
        imageView.backgroundColor = [self jobs_avatarColorByText:initialText];
    }else{
        imageView.backgroundColor = UIColor.clearColor;
    }
}

-(NSString *)jobs_initialTextByName:(NSString *)name{
    NSString *text = name.length ? name : @"匿";
    NSRange range = [text rangeOfComposedCharacterSequenceAtIndex:0];
    return [text substringWithRange:range];
}

-(UIColor *)jobs_avatarColorByText:(NSString *)text{
    NSUInteger hash = text.hash;
    NSArray <UIColor *>*colors = @[
        [UIColor colorWithRed:0.22 green:0.45 blue:0.78 alpha:1],
        [UIColor colorWithRed:0.13 green:0.60 blue:0.42 alpha:1],
        [UIColor colorWithRed:0.82 green:0.31 blue:0.33 alpha:1],
        [UIColor colorWithRed:0.52 green:0.36 blue:0.76 alpha:1],
        [UIColor colorWithRed:0.90 green:0.55 blue:0.18 alpha:1]
    ];
    return colors[hash % colors.count];
}

-(NSString *)jobs_metaTextByComment:(JobsOCCommentModel *)comment{
    NSMutableArray <NSString *>*meta = NSMutableArray.array;
    if (comment.device.length) [meta addObject:comment.device];
    if (comment.location.length) [meta addObject:comment.location];
    return [meta componentsJoinedByString:@" · "];
}
#pragma mark —— LazyLoad
-(UIView *)containerView{
    if (!_containerView) {
        _containerView = UIView.new;
        _containerView.translatesAutoresizingMaskIntoConstraints = NO;
        _containerView.layer.cornerRadius = 8;
        _containerView.layer.masksToBounds = YES;
    };return _containerView;
}

-(UIImageView *)avatarImageView{
    if (!_avatarImageView) {
        _avatarImageView = UIImageView.new;
        _avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImageView.layer.cornerRadius = 18;
        _avatarImageView.layer.masksToBounds = YES;
    };return _avatarImageView;
}

-(UILabel *)avatarLabel{
    if (!_avatarLabel) {
        _avatarLabel = UILabel.new;
        _avatarLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _avatarLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightSemibold];
        _avatarLabel.textAlignment = NSTextAlignmentCenter;
        _avatarLabel.textColor = UIColor.whiteColor;
    };return _avatarLabel;
}

-(UIStackView *)textStackView{
    if (!_textStackView) {
        _textStackView = UIStackView.new;
        _textStackView.translatesAutoresizingMaskIntoConstraints = NO;
        _textStackView.axis = UILayoutConstraintAxisVertical;
        _textStackView.alignment = UIStackViewAlignmentFill;
        _textStackView.spacing = 4;
        [_textStackView addArrangedSubview:self.nameLabel];
        [_textStackView addArrangedSubview:self.timeLabel];
        [_textStackView addArrangedSubview:self.replyHintStackView];
        [_textStackView addArrangedSubview:self.contentLabel];
        [_textStackView addArrangedSubview:self.metaLabel];
        [_textStackView addArrangedSubview:self.replySummaryLabel];
    };return _textStackView;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = UILabel.new;
        _nameLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightSemibold];
        _nameLabel.textColor = [UIColor colorWithRed:0.11 green:0.16 blue:0.23 alpha:1];
    };return _nameLabel;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = UILabel.new;
        _timeLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _timeLabel.textColor = [UIColor colorWithRed:0.54 green:0.60 blue:0.68 alpha:1];
    };return _timeLabel;
}

-(UILabel *)replyHintLabel{
    if (!_replyHintLabel) {
        _replyHintLabel = UILabel.new;
        _replyHintLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        _replyHintLabel.textColor = [UIColor colorWithRed:0.23 green:0.42 blue:0.74 alpha:1];
    };return _replyHintLabel;
}

-(UIStackView *)replyHintStackView{
    if (!_replyHintStackView) {
        _replyHintStackView = UIStackView.new;
        _replyHintStackView.axis = UILayoutConstraintAxisHorizontal;
        _replyHintStackView.alignment = UIStackViewAlignmentCenter;
        _replyHintStackView.spacing = 5;
        _replyHintStackView.hidden = YES;
        [_replyHintStackView addArrangedSubview:self.replyHintAvatarImageView];
        [_replyHintStackView addArrangedSubview:self.replyHintLabel];
    };return _replyHintStackView;
}

-(UIImageView *)replyHintAvatarImageView{
    if (!_replyHintAvatarImageView) {
        _replyHintAvatarImageView = UIImageView.new;
        _replyHintAvatarImageView.contentMode = UIViewContentModeScaleAspectFill;
        _replyHintAvatarImageView.layer.cornerRadius = 8;
        _replyHintAvatarImageView.layer.masksToBounds = YES;
        [_replyHintAvatarImageView addSubview:self.replyHintAvatarLabel];
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
        _replyHintAvatarLabel = UILabel.new;
        _replyHintAvatarLabel.font = [UIFont systemFontOfSize:8 weight:UIFontWeightSemibold];
        _replyHintAvatarLabel.textAlignment = NSTextAlignmentCenter;
        _replyHintAvatarLabel.textColor = UIColor.whiteColor;
    };return _replyHintAvatarLabel;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = UILabel.new;
        _contentLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
        _contentLabel.textColor = [UIColor colorWithRed:0.22 green:0.26 blue:0.32 alpha:1];
        _contentLabel.numberOfLines = 0;
    };return _contentLabel;
}

-(UILabel *)metaLabel{
    if (!_metaLabel) {
        _metaLabel = UILabel.new;
        _metaLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _metaLabel.textColor = [UIColor colorWithRed:0.55 green:0.60 blue:0.66 alpha:1];
    };return _metaLabel;
}

-(UILabel *)replySummaryLabel{
    if (!_replySummaryLabel) {
        _replySummaryLabel = UILabel.new;
        _replySummaryLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightMedium];
        _replySummaryLabel.textColor = [UIColor colorWithRed:0.19 green:0.39 blue:0.72 alpha:1];
        _replySummaryLabel.hidden = YES;
    };return _replySummaryLabel;
}

@end
