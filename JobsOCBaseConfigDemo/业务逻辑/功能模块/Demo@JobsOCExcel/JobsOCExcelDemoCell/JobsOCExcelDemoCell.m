//
//  JobsOCExcelDemoCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelDemoCell.h"

@interface JobsOCExcelDemoCell ()

Prop_strong()UILabel *titleLabel;
Prop_strong()JobsOCExcelView *excelView;

@end

@implementation JobsOCExcelDemoCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.bySelectionStyle(UITableViewCellSelectionStyleNone)
            .byBgColor(JobsClearColor);
        self.contentView.byBgColor(JobsClearColor);
        self.titleLabel.byAlpha(1);
        self.excelView.byAlpha(1);
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.bySelectionStyle(UITableViewCellSelectionStyleNone);
        self.titleLabel.byAlpha(1);
        self.excelView.byAlpha(1);
    };return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.excelView.delegate = nil;
    [self.excelView setHorizontalContentOffset:0
                                      animated:NO];
}

-(void)configureWithTitle:(NSString *)title
                  columns:(NSArray<JobsOCExcelColumn *> *)columns
                     rows:(NSArray<JobsOCExcelRow *> *)rows
      freezeThroughColumn:(NSInteger)freezeThroughColumn
                 delegate:(id<JobsOCExcelViewDelegate>)delegate{
    self.titleLabel.byText(title);
    self.excelView.delegate = delegate;
    [self.excelView configureWithColumns:columns
                                    rows:rows
                     freezeThroughColumn:freezeThroughColumn
                                   style:nil];
}

#pragma mark —— lazyLoad
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byFont(UIFontWeightSemiboldSize(17))
                .byTextCor(UIColor.labelColor)
                .byNumberOfLines(0)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).offset(JobsWidth(16));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(16));
                });
        });
    };return _titleLabel;
}

-(JobsOCExcelView *)excelView{
    if (!_excelView) {
        _excelView = JobsOCExcelView.new;
        _excelView.byCornerRadius(JobsWidth(12))
            .byClipsToBounds(YES)
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLabel.mas_bottom).offset(JobsWidth(10));
                make.left.right.equalTo(self.contentView).inset(JobsWidth(16));
                make.bottom.equalTo(self.contentView).inset(JobsWidth(16)).priority(999);
            });
    };return _excelView;
}

@end
