//
//  XLChannelHeader.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "XLChannelHeader.h"

@interface XLChannelHeader ()

Prop_strong()UILabel *titleLabel;

Prop_strong()UILabel *subtitleLabel;

@end

@implementation XLChannelHeader

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    };return self;
}

-(void)buildUI
{
    CGFloat marginX = 15.0f;
    
    CGFloat labelWidth = (self.bounds.size.width - 2*marginX)/2.0f;
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(marginX, 0, labelWidth, self.bounds.size.height)];
    self.titleLabel.byTextCor([UIColor blackColor]);

    [self addSubview:self.titleLabel];
    
    self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelWidth + marginX, 0, labelWidth, self.bounds.size.height)];
    self.subtitleLabel.byTextCor([UIColor lightGrayColor]);

    self.subtitleLabel.byTextAlignment(NSTextAlignmentRight);

    self.subtitleLabel.byFont([UIFont systemFontOfSize:15.0f weight:UIFontWeightRegular]);

    [self addSubview:self.subtitleLabel];
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.byText(title);

}

-(void)setSubTitle:(NSString *)subTitle
{
    _subTitle = subTitle;
    self.subtitleLabel.byText(subTitle);

}

@end
