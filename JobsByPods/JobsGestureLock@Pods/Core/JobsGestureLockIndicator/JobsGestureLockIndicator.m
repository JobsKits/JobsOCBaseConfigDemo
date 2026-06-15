//
//  JobsGestureLockIndicator.m
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsGestureLockIndicator.h"
#import <JobsGestureLock/JobsGestureLockConfiguration.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

@interface JobsGestureLockIndicator ()

Prop_strong()NSMutableArray<UIButton *> *nodeButtons;

@end

@implementation JobsGestureLockIndicator

- (instancetype)initWithFrame:(CGRect)frame {
    self = [self initWithConfiguration:nil];
    if (self) {
        self.frame = frame;
    };return self;
}

- (instancetype)initWithConfiguration:(JobsGestureLockConfiguration *)configuration {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _configuration = configuration ?: [JobsGestureLockConfiguration defaultConfiguration];
        _nodeButtons = [NSMutableArray array];
        [self buildSubviews];
    };return self;
}

- (void)buildSubviews {
    for (NSInteger index = 0; index < 9; index++) {
        UIButton *button = (UIButton *)UIButton.alloc.init
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *btn = (UIButton *)view;
                [btn setImage:self.configuration.indicatorNormalImage forState:UIControlStateNormal];
                [btn setImage:self.configuration.indicatorSelectedImage forState:UIControlStateSelected];
            })
            .byUserInteractionEnabled(NO)
            .addOn(self);
        [self.nodeButtons addObject:button];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];

    NSInteger columns = 3;
    CGFloat width = 9.0;
    CGFloat height = 9.0;
    CGFloat margin = (CGRectGetWidth(self.bounds) - columns * width) / (columns + 1);

    [self.nodeButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
        NSUInteger row = idx / columns;
        NSUInteger column = idx % columns;
        CGFloat x = margin + (width + margin) * column;
        CGFloat y = margin + (height + margin) * row;
        button.frame = CGRectMake(x, y, width, height);
    }];
}

- (void)updateWithPattern:(NSString *)pattern {
    [self.nodeButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
        button.selected = NO;
    }];

    for (NSUInteger index = 0; index < pattern.length; index++) {
        NSString *character = [pattern substringWithRange:NSMakeRange(index, 1)];
        NSInteger buttonIndex = character.integerValue;
        if (buttonIndex >= 0 && buttonIndex < self.nodeButtons.count) {
            self.nodeButtons[buttonIndex].selected = YES;
        }
    }
}

@end
