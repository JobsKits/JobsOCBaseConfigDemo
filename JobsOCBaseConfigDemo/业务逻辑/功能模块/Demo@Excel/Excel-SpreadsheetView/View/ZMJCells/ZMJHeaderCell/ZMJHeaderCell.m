//
//  ZMJHeaderCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ZMJHeaderCell.h"

@interface ZMJHeaderCell ()

@end

@implementation ZMJHeaderCell : ZMJCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1.0];
        self.btn.alpha = 1;
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1.0];
        self.btn.alpha = 1;
    }return self;
}

@end
