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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCSearcherRecordCell
@interface JobsOCSearcherRecordCell (JobsPropertyDSLSetterAutogen_6f9ef4a713)
-(void)setDeleteBlock:(jobsByStrBlock)data;
-(void)setHistoryText:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCSearcherRecordCell

@implementation JobsOCSearcherRecordCell
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
    self.contentView.byBgColor(JobsSecondarySystemBackgroundColor);
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherRecordCell.class, @selector(jobsPrepareForReuse)))(self, @selector(jobsPrepareForReuse));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsPrepareForReuse{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super prepareForReuse];
        self.byHistoryText(@"");
        self.historyLabel.byText(@"");
        self.byDeleteBlock(nil);
    };
}

-(jobsByStrBlock _Nonnull)updateWithText{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        self.byHistoryText(self.normalizedTextBy(text));
        self.historyLabel.byText(self.historyText);
    };
}

-(JobsRetStrByStrBlock _Nonnull)normalizedTextBy{
    @jobs_weakify(self)
    return ^NSString *(NSString * text){
        @jobs_strongify(self)
        if (!self) return nil;
        if (![text isKindOfClass:NSString.class]) return @"";
        return [text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ? : @"";
    };
}

-(jobsByVoidBlock _Nonnull)deleteButtonEvent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.deleteBlock) self.deleteBlock(self.historyText);
    };
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
                .jobsResetBtnTitle(@"删除".jobsTr())
                .jobsResetBtnTitleCor(RGBA_COLOR(0.63 * 255.0, 0.67 * 255.0, 0.73 * 255.0, 1))
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(13))
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    weak_self.deleteButtonEvent();
                });
        });
    };return _deleteButton;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCSearcherRecordCell
-(JobsRetJobsOCSearcherRecordCellByNSStringBlock _Nonnull)byHistoryText{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherRecordCell * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setHistoryText:data];
        return self;
    };
}

-(JobsRetJobsOCSearcherRecordCellByjobsByStrBlockBlock _Nonnull)byDeleteBlock{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherRecordCell * _Nullable(jobsByStrBlock data){
        @jobs_strongify(self)
        [self setDeleteBlock:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCSearcherRecordCell
@end
