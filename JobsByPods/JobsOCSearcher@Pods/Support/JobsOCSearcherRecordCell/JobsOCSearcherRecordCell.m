//
//  JobsOCSearcherRecordCell.m
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#import "JobsOCSearcherRecordCell.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

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
        [self.historyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(16);
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.deleteButton.mas_left).offset(-12);
        }];
        [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-10);
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
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
        @jobs_weakify(self)
        _deleteButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"删除".tr)
                .jobsResetBtnTitleCor(RGBA_COLOR(0.63 * 255.0, 0.67 * 255.0, 0.73 * 255.0, 1))
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(13))
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    [weak_self deleteButtonEvent];
                });
        });
    };return _deleteButton;
}

@end
