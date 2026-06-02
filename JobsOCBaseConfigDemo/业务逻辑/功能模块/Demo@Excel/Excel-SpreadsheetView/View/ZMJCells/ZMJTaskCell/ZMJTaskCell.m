//
//  ZMJTaskCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ZMJTaskCell.h"

@interface ZMJTaskCell ()

@end

@implementation ZMJTaskCell : ZMJCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        
    }return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.btn.alpha = 1;
}

@end
