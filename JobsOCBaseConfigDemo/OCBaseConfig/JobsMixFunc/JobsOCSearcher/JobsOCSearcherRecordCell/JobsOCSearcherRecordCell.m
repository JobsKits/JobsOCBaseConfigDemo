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
        self.backgroundColor = UIColor.clearColor;
    self.contentView.byBgColor(JobsSecondarySystemBackgroundColor);
        [self.contentView addSubview:self.historyLabel];
        [self.contentView addSubview:self.deleteButton];
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
    self.historyLabel.text = @"";
    self.deleteBlock = nil;
}

-(void)updateWithText:(NSString *)text{
    self.historyText = [self normalizedTextBy:text];
    self.historyLabel.text = self.historyText;
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
        _historyLabel = UILabel.new;
        _historyLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
        _historyLabel.textColor = [UIColor colorWithRed:0.24 green:0.29 blue:0.35 alpha:1];
        _historyLabel.numberOfLines = 1;
        _historyLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    };return _historyLabel;
}

-(UIButton *)deleteButton{
    if (!_deleteButton) {
        _deleteButton = UIButton.new;
        _deleteButton.titleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        [_deleteButton setTitle:@"删除"
                       forState:UIControlStateNormal];
        [_deleteButton setTitleColor:[UIColor colorWithRed:0.63 green:0.67 blue:0.73 alpha:1]
                            forState:UIControlStateNormal];
        [_deleteButton addTarget:self
                          action:@selector(deleteButtonEvent)
                forControlEvents:UIControlEventTouchUpInside];
    };return _deleteButton;
}

@end
