//
//  ZMJTextCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ZMJTextCell.h"

@interface ZMJTextCell ()

@end

@implementation ZMJTextCell : ZMJCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.btn.alpha = 1;
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.btn.alpha = 1;
    }return self;
}

@end
