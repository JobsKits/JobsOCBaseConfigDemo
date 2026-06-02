//
//  TestCollectionReusableView.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TestCollectionReusableView.h"

@implementation TestCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UILabel *lab = [[UILabel alloc] init];
        lab.frame = CGRectMake(kWidth(15)+3+4, 10, 100, 50);
        lab.font = kBlodFont(18);
        lab.textColor = [UIColor blackColor];
        lab.text = @"嵌套嵌套";
        self.titleLab = lab;
        [self addSubview:lab];
        
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(kWidth(15), 10+8+10, 3, 14);
        view.backgroundColor = kColor(0xE74E46FF);
        view.layer.cornerRadius = 1.5f;
        self.lineView = lab;
        [self addSubview:view];
    }
    return self;
}

@end
