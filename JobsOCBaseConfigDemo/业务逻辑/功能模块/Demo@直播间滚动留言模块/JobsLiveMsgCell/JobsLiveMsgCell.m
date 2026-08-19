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
+(JobsRetStrByVoidBlock _Nonnull)reuseIdentifier{
    return ^NSString *_Nullable{
        return NSStringFromClass(self);
    };
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.bySelectionStyle(UITableViewCellSelectionStyleNone);
        self.byBgColor(UIColor.clearColor);
        self.contentView.byBgColor(UIColor.clearColor);
        self.bubbleLabel.byAlpha(1);
    };return self;
}

-(void)prepareForReuse{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLiveMsgCell.class, @selector(jobsPrepareForReuse)))(self, @selector(jobsPrepareForReuse));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsPrepareForReuse{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super prepareForReuse];
        self.contentView.byTransform(CGAffineTransformIdentity);
        self.contentView.byAlpha(1);
    };
}

-(jobsByStrBlock _Nonnull)configureWithText{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        self.bubbleLabel.byText(text.length ? text : @"...");
    };
}

-(jobsByVoidBlock _Nonnull)playAppearAnimation{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.contentView.byTransform(CGAffineTransformMakeTranslation(0, JobsWidth(14)));
        self.contentView.byAlpha(0);
        UIView.jobsAnimateWithSpring(0.22,
            0,
            0.78,
            0.4,
            UIViewAnimationOptionCurveEaseOut,
            ^{
            self.contentView.byTransform(CGAffineTransformIdentity);
            self.contentView.byAlpha(1);
        },
            nil);
    };
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
