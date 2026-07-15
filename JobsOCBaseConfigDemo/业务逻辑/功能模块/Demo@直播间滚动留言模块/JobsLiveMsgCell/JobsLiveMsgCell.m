//
//  JobsLiveMsgCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsLiveMsgCell.h"

@interface JobsLiveMsgCell ()

Prop_strong()UILabel *bubbleLabel;

@end

@implementation JobsLiveMsgCell
+(NSString *)reuseIdentifier{
    return NSStringFromClass(self);
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColor.clearColor;
        self.contentView.backgroundColor = UIColor.clearColor;
        self.bubbleLabel.alpha = 1;
    };return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.contentView.transform = CGAffineTransformIdentity;
    self.contentView.alpha = 1;
}

-(void)configureWithText:(NSString *)text{
    self.bubbleLabel.text = text.length ? text : @"...";
}

-(void)playAppearAnimation{
    self.contentView.transform = CGAffineTransformMakeTranslation(0, JobsWidth(14));
    self.contentView.alpha = 0;
    [UIView animateWithDuration:0.22
                          delay:0
         usingSpringWithDamping:0.78
          initialSpringVelocity:0.4
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
        self.contentView.transform = CGAffineTransformIdentity;
        self.contentView.alpha = 1;
    } completion:nil];
}
#pragma mark —— LazyLoad
-(UILabel *)bubbleLabel{
    if (!_bubbleLabel) {
        _bubbleLabel = UILabel.new;
        _bubbleLabel.numberOfLines = 0;
        _bubbleLabel.textColor = UIColor.whiteColor;
        _bubbleLabel.font = UIFontWeightRegularSize(15);
        _bubbleLabel.backgroundColor = UIColor.systemBlueColor;
        _bubbleLabel.layer.cornerRadius = JobsWidth(15);
        _bubbleLabel.layer.masksToBounds = YES;
        [self.contentView addSubview:_bubbleLabel];
        [_bubbleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(16));
            make.right.lessThanOrEqualTo(self.contentView).offset(-JobsWidth(56));
            make.top.equalTo(self.contentView).offset(JobsWidth(6));
            make.bottom.equalTo(self.contentView).offset(-JobsWidth(6));
        }];
    };return _bubbleLabel;
}

@end
