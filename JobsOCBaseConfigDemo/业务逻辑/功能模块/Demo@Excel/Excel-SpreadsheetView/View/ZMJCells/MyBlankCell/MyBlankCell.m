//
//  MyBlankCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MyBlankCell.h"

@interface MyBlankCell ()

@end

@implementation MyBlankCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byBgColor([UIColor colorWithWhite:0.9 alpha:1]);

    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.byBgColor([UIColor colorWithWhite:0.9 alpha:1]);

    };return self;
}

#pragma mark —— LazyLoad

@end
