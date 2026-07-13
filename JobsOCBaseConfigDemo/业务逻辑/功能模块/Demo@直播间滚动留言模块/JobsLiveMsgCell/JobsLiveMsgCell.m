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
        self.byBgColor(UIColor.clearColor);
        self.contentView.byBgColor(UIColor.clearColor);
        self.bubbleLabel.byAlpha(1);
    };return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.contentView.transform = CGAffineTransformIdentity;
    self.contentView.byAlpha(1);
}

-(void)configureWithText:(NSString *)text{
    self.bubbleLabel.byText(text.length ? text : @"...");
}

-(void)playAppearAnimation{
    self.contentView.transform = CGAffineTransformMakeTranslation(0, JobsWidth(14));
    self.contentView.byAlpha(0);
    UIView.jobsAnimateWithSpring(0.22,
        0,
        0.78,
        0.4,
        UIViewAnimationOptionCurveEaseOut,
        ^{
        self.contentView.transform = CGAffineTransformIdentity;
        self.contentView.byAlpha(1);
    },
        nil);
}
#pragma mark —— LazyLoad
-(UILabel *)bubbleLabel{
    if (!_bubbleLabel) {
        _bubbleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byNumberOfLines(0)
                .byTextCor(UIColor.whiteColor)
                .byFont(UIFontWeightRegularSize(15))
                .byBgColor(UIColor.systemBlueColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(15))
                        .byMasksToBounds(YES);
                })
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.contentView).offset(JobsWidth(16));
                    make.right.lessThanOrEqualTo(self.contentView).offset(-JobsWidth(56));
                    make.top.equalTo(self.contentView).offset(JobsWidth(6));
                    make.bottom.equalTo(self.contentView).offset(-JobsWidth(6));
                });
        });
    };return _bubbleLabel;
}

@end
