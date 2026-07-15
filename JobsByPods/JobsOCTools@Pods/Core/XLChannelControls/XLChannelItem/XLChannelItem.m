//
//  XLChannelItem.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "XLChannelItem.h"

@interface XLChannelItem ()

Prop_strong()UILabel *textLabel;
Prop_strong()CAShapeLayer *borderLayer;

@end

@implementation XLChannelItem
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    };return self;
}

-(void)initUI{
    self.userInteractionEnabled = true;
    self.layer.cornerRadius = 5.0f;
    self.byBgColor([self backgroundColor]);
    self.textLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byTextAlignment(NSTextAlignmentCenter)
            .byTextCor([self textColor])
            .labelAutoFontByWidth()
            .byFrame(self.bounds)
            .byUserInteractionEnabled(YES)
            .addOn(self);
    });
    [self addBorderLayer];
}

-(void)addBorderLayer{
    self.borderLayer = CAShapeLayer.layer;
    self.borderLayer.bounds = self.bounds;
    self.borderLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    self.borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.borderLayer.bounds cornerRadius:self.layer.cornerRadius].CGPath;
    self.borderLayer.lineWidth = 1;
    self.borderLayer.lineDashPattern = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        data.add(@5);
        data.add(@3);
    });
    self.borderLayer.fillColor = JobsClearColor.CGColor;
    self.borderLayer.strokeColor = [self backgroundColor].CGColor;
    [self.layer addSublayer:self.borderLayer];
    self.borderLayer.byHidden(true);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.byFrame(self.bounds);
}

-(UIColor*)backgroundColor{
    return [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
}

-(UIColor*)textColor{
    return [UIColor colorWithRed:40/255.0f green:40/255.0f blue:40/255.0f alpha:1];
}

-(UIColor*)lightTextColor{
    return [UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1];
}

-(void)setTitle:(NSString *)title{
    _title = title;
    self.textLabel.byText(title);
}

-(void)setIsMoving:(BOOL)isMoving{
    _isMoving = isMoving;
    if (_isMoving) {
        self.byBgColor([UIColor clearColor]);
        self.borderLayer.byHidden(false);
    }else{
        self.byBgColor([self backgroundColor]);
        self.borderLayer.byHidden(true);
    }
}

-(void)setIsFixed:(BOOL)isFixed{
    _isFixed = isFixed;
    if (isFixed) {
        self.textLabel.byTextCor([self lightTextColor]);
    }else{
        self.textLabel.byTextCor([self textColor]);
    }
}

@end
