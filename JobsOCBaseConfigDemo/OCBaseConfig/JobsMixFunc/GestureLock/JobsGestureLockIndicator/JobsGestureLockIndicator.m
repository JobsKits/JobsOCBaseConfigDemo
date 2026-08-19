//
//  JobsGestureLockIndicator.m
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsGestureLockIndicator.h"

#import "JobsGestureLockConfiguration.h"

@interface JobsGestureLockIndicator ()

Prop_strong()NSMutableArray<UIButton *> *nodeButtons;

@end

@implementation JobsGestureLockIndicator
- (instancetype)initWithFrame:(CGRect)frame {
    self = [self initWithConfiguration:nil];
    if (self) {
        self.byFrame(frame);
    };return self;
}

- (instancetype)initWithConfiguration:(JobsGestureLockConfiguration *)configuration {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _configuration = configuration ?: JobsGestureLockConfiguration.defaultConfiguration();
        _nodeButtons = [NSMutableArray array];
        self.buildSubviews();
    };return self;
}

- (jobsByVoidBlock _Nonnull)buildSubviews {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (NSInteger index = 0; index < 9; index++) {
            UIButton *button = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
                button
                    .byUserInteractionEnabled(NO)
                    .addOn(self);
            });
            [self applySelected:NO toButton:button];
            [self.nodeButtons addObject:button];
        }
    };
}

- (void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsGestureLockIndicator.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
            button
                .jobsResetBtnCornerRadiusValue(width * 0.5)
                .byFrame(CGRectMake(x, y, width, height));
        }];
    };
}

-(jobsByStrBlock _Nonnull)updateWithPattern{
    @jobs_weakify(self)
    return ^(NSString * pattern){
        @jobs_strongify(self)
        if (!self) return;
        [self.nodeButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
            [self applySelected:NO toButton:button];
        }];
        for (NSUInteger index = 0; index < pattern.length; index++) {
            NSString *character = [pattern substringWithRange:NSMakeRange(index, 1)];
            NSInteger buttonIndex = character.integerValue;
            if (buttonIndex >= 0 && buttonIndex < self.nodeButtons.count) {
                [self applySelected:YES toButton:self.nodeButtons[buttonIndex]];
            }
        }
    };
}

-(void)applySelected:(BOOL)selected toButton:(UIButton *)button{
    if (self.configuration.indicatorNormalImage || self.configuration.indicatorSelectedImage) {
        button
            .jobsResetBtnImage(self.configuration.indicatorNormalImage)
            .selectedStateImageBy(self.configuration.indicatorSelectedImage)
            .jobsResetBtnBgCor(JobsClearColor)
            .jobsResetBtnLayerBorderWidth(0)
            .bySelected(selected);
        return;
    }
    button
        .jobsResetBtnImage(nil)
        .selectedStateImageBy(nil)
        .jobsResetBtnBgCor(selected ? self.configuration.selectedLineColor : JobsClearColor)
        .jobsResetBtnLayerBorderCor(selected ? self.configuration.selectedLineColor : JobsSystemGray3Color)
        .jobsResetBtnLayerBorderWidth(1)
        .bySelected(selected);
}

@end
