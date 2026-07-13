//
//  JobsOCSearcherRecordCell.m
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#import "JobsOCSearcherRecordCell.h"

@interface JobsOCSearcherRecordCell ()

Prop_strong()UILabel *historyLabel;
Prop_strong()UIButton *deleteButton;
Prop_copy()NSString *historyText;

@end

@implementation JobsOCSearcherRecordCell

+(NSString *)reuseIdentifier{
    return NSStringFromClass(self);
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.byBgColor(UIColor.clearColor);
        self.contentView.byBgColor(UIColor.whiteColor);
        self.historyLabel.addOn(self.contentView);
        self.deleteButton.addOn(self.contentView);
        [NSLayoutConstraint activateConstraints:@[
            [self.historyLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16],
            [self.historyLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
            [self.historyLabel.rightAnchor constraintEqualToAnchor:self.deleteButton.leftAnchor constant:-12],
            [self.deleteButton.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-10],
            [self.deleteButton.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
            [self.deleteButton.widthAnchor constraintEqualToConstant:40],
            [self.deleteButton.heightAnchor constraintEqualToConstant:40]
        ]];
    };return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.historyText = @"";
    self.historyLabel.byText(@"");
    self.deleteBlock = nil;
}

-(void)updateWithText:(NSString *)text{
    self.historyText = [self normalizedTextBy:text];
    self.historyLabel.byText(self.historyText);
}

-(NSString *)normalizedTextBy:(NSString *)text{
    if (![text isKindOfClass:NSString.class]) return @"";
    return [text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ? : @"";
}

-(void)deleteButtonEvent{
    if (self.deleteBlock) self.deleteBlock(self.historyText);
}

-(UILabel *)historyLabel{
    if (!_historyLabel) {
        _historyLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.translatesAutoresizingMaskIntoConstraints = NO;
            label
                .byFont(UIFontWeightRegularSize(15))
                .byTextCor(RGBA_COLOR(0.24 * 255.0, 0.29 * 255.0, 0.35 * 255.0, 1))
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail);
        });
    };return _historyLabel;
}

-(UIButton *)deleteButton{
    if (!_deleteButton) {
        _deleteButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button.translatesAutoresizingMaskIntoConstraints = NO;
            button
                .jobsResetBtnTitle(@"删除".tr)
                .jobsResetBtnTitleCor(RGBA_COLOR(0.63 * 255.0, 0.67 * 255.0, 0.73 * 255.0, 1))
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(13))
                .byAddTarget(self, @selector(deleteButtonEvent), UIControlEventTouchUpInside);
        });
    };return _deleteButton;
}

@end
