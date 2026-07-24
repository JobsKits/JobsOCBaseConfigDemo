//
//  JobsGestureLockView.m
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsGestureLockView.h"

@interface JobsGestureLockView ()

Prop_strong()NSMutableArray<UIButton *> *selectedButtons;
Prop_strong()NSMutableArray<UIButton *> *errorButtons;
Prop_strong()NSMutableArray<UIButton *> *nodeButtons;
Prop_strong()UIPanGestureRecognizer *panGesture;
Prop_assign()CGPoint currentPoint;
Prop_assign()BOOL finished;
Prop_assign(readwrite)JobsGestureLockValidationResult validationResult;

@end

@implementation JobsGestureLockView
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
        _selectedButtons = [NSMutableArray array];
        _errorButtons = [NSMutableArray array];
        self.byBgColor(UIColor.clearColor);
        [self buildSubviews];
    };return self;
}

- (void)buildSubviews {
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:self.panGesture];
    for (NSInteger index = 0; index < 9; index++) {
        UIButton *button = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnImage(self.configuration.nodeNormalImage)
                .selectedStateImageBy(self.configuration.nodeSelectedImage)
                .byTag(index)
                .byUserInteractionEnabled(NO)
                .addOn(self);
        });
        [self.nodeButtons addObject:button];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger columns = 3;
    CGFloat side = CGRectGetWidth(self.bounds) <= 320.0 ? 50.0 : 58.0;
    CGFloat margin = (CGRectGetWidth(self.bounds) - columns * side) / (columns + 1);
    [self.nodeButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        NSUInteger row = idx / columns;
        NSUInteger column = idx % columns;
        CGFloat x = margin + (side + margin) * column;
        CGFloat y = margin + (side + margin) * row;
        view.frame = CGRectMake(x, y, side, side);
    }];
}

- (void)drawRect:(CGRect)rect {
    if (self.selectedButtons.count == 0) {
        return;
    }
    UIBezierPath *path = jobsMakeBezierPath(nil);
    [self.selectedButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            [path moveToPoint:button.center];
        } else {
            [path addLineToPoint:button.center];
        }
    }];
    if (!self.finished) {
        [path addLineToPoint:self.currentPoint];
        [self.configuration.selectedLineColor setStroke];
    } else {
        switch (self.validationResult) {
            /// 处理 JobsGestureLockValidationResultFailure 分支
            case JobsGestureLockValidationResultFailure:
            /// 处理 JobsGestureLockValidationResultTooShort 分支
            case JobsGestureLockValidationResultTooShort:
                [self.configuration.errorLineColor setStroke];
                break;
            /// 处理 JobsGestureLockValidationResultSuccess 分支
            case JobsGestureLockValidationResultSuccess:
                [self.configuration.selectedLineColor setStroke];
                break;
            /// 处理 JobsGestureLockValidationResultNone 分支
            case JobsGestureLockValidationResultNone:
            /// 未匹配已知分支时执行兜底处理
            default:
                [self.configuration.normalLineColor setStroke];
                break;
        }
    }
    path.lineWidth = self.configuration.lineWidth;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineCapStyle = kCGLineCapRound;
    [path stroke];
}

- (void)handlePan:(UIPanGestureRecognizer *)pan {
    if (pan.state == UIGestureRecognizerStateBegan) {
        [self restoreErrorButtonsIfNeeded];
    }
    self.currentPoint = [pan locationInView:self];
    for (UIButton *button in self.nodeButtons) {
        if (CGRectContainsPoint(button.frame, self.currentPoint) && !button.jobs_isSelected) {
            button.bySelected(YES);
            [self.selectedButtons addObject:button];
        }
    }
    if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateFailed) {
        self.finished = YES;
        NSString *pattern = [self currentPattern];
        if ([self.delegate respondsToSelector:@selector(gestureLockView:didCompletePattern:)]) {
            [self.delegate gestureLockView:self didCompletePattern:pattern];
        }
    }
    [self setNeedsDisplay];
}

- (NSString *)currentPattern {
    NSMutableString *pattern = [NSMutableString string];
    for (UIButton *button in self.selectedButtons) {
        [pattern appendFormat:@"%ld", (long)button.tag];
    };return pattern.copy;
}

- (void)restoreErrorButtonsIfNeeded {
    for (UIButton *button in self.errorButtons) {
        button
            .jobsResetBtnImage(self.configuration.nodeNormalImage)
            .selectedStateImageBy(self.configuration.nodeSelectedImage);
    }
    [self.errorButtons removeAllObjects];
    self.validationResult = JobsGestureLockValidationResultNone;
}

- (void)reset {
    self.finished = NO;
    self.validationResult = JobsGestureLockValidationResultNone;
    for (UIButton *button in self.selectedButtons) {
        button.bySelected(NO);
        button.jobsResetBtnImage(self.configuration.nodeNormalImage);
    }
    [self.selectedButtons removeAllObjects];
    [self setNeedsDisplay];
}

- (void)showValidationResult:(JobsGestureLockValidationResult)result {
    self.validationResult = result;
    if (result == JobsGestureLockValidationResultFailure || result == JobsGestureLockValidationResultTooShort) {
        [self.errorButtons removeAllObjects];
        [self.errorButtons addObjectsFromArray:self.selectedButtons];
        for (UIButton *button in self.errorButtons) {
            button.jobsResetBtnImage(self.configuration.nodeErrorImage);
        }
    }
    [self setNeedsDisplay];
}

-(NSMutableArray<UIButton *> *)nodeButtons{
    if (!_nodeButtons) {
        _nodeButtons = NSMutableArray.array;
    };return _nodeButtons;
}

@end
