//
//  JobsGestureLockView.m
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsGestureLockView.h"

typedef NS_ENUM(NSUInteger, JobsGestureLockNodeVisualState) {
    JobsGestureLockNodeVisualStateNormal,
    JobsGestureLockNodeVisualStateSelected,
    JobsGestureLockNodeVisualStateError
};

@interface JobsGestureLockView ()

Prop_strong()NSMutableArray<UIButton *> *selectedButtons;
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
        _selectedButtons = NSMutableArray.array;
        _nodeButtons = NSMutableArray.array;
        self.byBgColor(JobsClearColor);
        [self buildSubviews];
    };return self;
}

- (void)buildSubviews {
    self.panGesture = [UIPanGestureRecognizer.alloc initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:self.panGesture];
    for (NSInteger index = 0; index < 9; index++) {
        UIButton *button = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .byTag(index)
                .byUserInteractionEnabled(NO)
                .addOn(self);
        });
        [self applyVisualState:JobsGestureLockNodeVisualStateNormal toButton:button];
        [self.nodeButtons addObject:button];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger columns = 3;
    CGFloat spacingX = CGRectGetWidth(self.bounds) / (columns + 1.0);
    CGFloat spacingY = CGRectGetHeight(self.bounds) / (columns + 1.0);
    CGFloat side = MIN(56.0, MIN(spacingX, spacingY) * 0.65);
    [self.nodeButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
        NSUInteger row = idx / columns;
        NSUInteger column = idx % columns;
        CGPoint center = CGPointMake(spacingX * (column + 1.0), spacingY * (row + 1.0));
        button.frame = CGRectMake(center.x - side * 0.5, center.y - side * 0.5, side, side);
        button.jobsResetBtnCornerRadiusValue(side * 0.5);
    }];
}

- (void)drawRect:(CGRect)rect {
    if (self.selectedButtons.count == 0) return;
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
        [self reset];
    }
    self.currentPoint = [pan locationInView:self];
    UIButton *hitButton = [self hitButtonAtPoint:self.currentPoint];
    if (hitButton) [self appendButtonWithInterpolation:hitButton];
    if (pan.state == UIGestureRecognizerStateEnded ||
        pan.state == UIGestureRecognizerStateCancelled ||
        pan.state == UIGestureRecognizerStateFailed) {
        self.finished = YES;
        NSString *pattern = [self currentPattern];
        if ([self.delegate respondsToSelector:@selector(gestureLockView:didCompletePattern:)]) {
            [self.delegate gestureLockView:self didCompletePattern:pattern];
        }
    }
    [self setNeedsDisplay];
}

-(UIButton *)hitButtonAtPoint:(CGPoint)point{
    for (UIButton *button in self.nodeButtons) {
        if (CGRectContainsPoint(CGRectInset(button.frame, -10.0, -10.0), point)) return button;
    };return nil;
}

-(void)appendButtonWithInterpolation:(UIButton *)button{
    if ([self.selectedButtons containsObject:button]) return;
    UIButton *lastButton = self.selectedButtons.lastObject;
    if (lastButton) {
        NSArray<NSNumber *> *intermediateIndexes = [self intermediateIndexesFrom:lastButton.tag to:button.tag];
        for (NSNumber *index in intermediateIndexes) {
            UIButton *intermediateButton = self.nodeButtons[index.integerValue];
            if (![self.selectedButtons containsObject:intermediateButton]) {
                [self selectButton:intermediateButton];
            }
        }
    }
    [self selectButton:button];
}

-(NSArray<NSNumber *> *)intermediateIndexesFrom:(NSInteger)fromIndex to:(NSInteger)toIndex{
    NSInteger columns = 3;
    NSInteger fromRow = fromIndex / columns;
    NSInteger fromColumn = fromIndex % columns;
    NSInteger toRow = toIndex / columns;
    NSInteger toColumn = toIndex % columns;
    NSInteger rowDelta = toRow - fromRow;
    NSInteger columnDelta = toColumn - fromColumn;
    NSInteger divisor = [self greatestCommonDivisor:ABS(rowDelta) other:ABS(columnDelta)];
    if (divisor <= 1) return @[];
    NSInteger rowStep = rowDelta / divisor;
    NSInteger columnStep = columnDelta / divisor;
    NSMutableArray<NSNumber *> *indexes = NSMutableArray.array;
    for (NSInteger step = 1; step < divisor; step++) {
        NSInteger row = fromRow + rowStep * step;
        NSInteger column = fromColumn + columnStep * step;
        if (row >= 0 && row < columns && column >= 0 && column < columns) {
            [indexes addObject:@(row * columns + column)];
        }
    };return indexes.copy;
}

-(NSInteger)greatestCommonDivisor:(NSInteger)value other:(NSInteger)other{
    NSInteger x = value;
    NSInteger y = other;
    while (y != 0) {
        NSInteger remainder = x % y;
        x = y;
        y = remainder;
    };return MAX(1, x);
}

-(void)selectButton:(UIButton *)button{
    [self.selectedButtons addObject:button];
    [self applyVisualState:JobsGestureLockNodeVisualStateSelected toButton:button];
}

- (NSString *)currentPattern {
    NSMutableString *pattern = NSMutableString.string;
    for (UIButton *button in self.selectedButtons) {
        [pattern appendFormat:@"%ld", (long)button.tag];
    };return pattern.copy;
}

- (void)reset {
    self.finished = NO;
    self.validationResult = JobsGestureLockValidationResultNone;
    for (UIButton *button in self.nodeButtons) {
        [self applyVisualState:JobsGestureLockNodeVisualStateNormal toButton:button];
    }
    [self.selectedButtons removeAllObjects];
    [self setNeedsDisplay];
}

- (void)showValidationResult:(JobsGestureLockValidationResult)result {
    self.validationResult = result;
    JobsGestureLockNodeVisualState state = JobsGestureLockNodeVisualStateSelected;
    if (result == JobsGestureLockValidationResultFailure ||
        result == JobsGestureLockValidationResultTooShort) {
        state = JobsGestureLockNodeVisualStateError;
    }
    for (UIButton *button in self.selectedButtons) {
        [self applyVisualState:state toButton:button];
    }
    [self setNeedsDisplay];
}

-(void)applyVisualState:(JobsGestureLockNodeVisualState)state toButton:(UIButton *)button{
    BOOL usesImages = self.configuration.nodeNormalImage ||
        self.configuration.nodeSelectedImage ||
        self.configuration.nodeErrorImage;
    if (usesImages) {
        UIImage *normalImage = self.configuration.nodeNormalImage;
        UIImage *selectedImage = self.configuration.nodeSelectedImage;
        BOOL selected = state == JobsGestureLockNodeVisualStateSelected;
        if (state == JobsGestureLockNodeVisualStateError) {
            normalImage = self.configuration.nodeErrorImage;
            selectedImage = self.configuration.nodeErrorImage;
            selected = NO;
        }
        button
            .jobsResetBtnImage(normalImage)
            .selectedStateImageBy(selectedImage)
            .jobsResetBtnBgCor(JobsClearColor)
            .jobsResetBtnLayerBorderWidth(0)
            .bySelected(selected);
        return;
    }
    UIColor *borderColor = JobsSystemGray3Color;
    UIColor *fillColor = JobsClearColor;
    switch (state) {
        /// 处理 JobsGestureLockNodeVisualStateNormal 分支
        case JobsGestureLockNodeVisualStateNormal:
            break;
        /// 处理 JobsGestureLockNodeVisualStateSelected 分支
        case JobsGestureLockNodeVisualStateSelected:
            borderColor = self.configuration.selectedLineColor;
            fillColor = self.configuration.selectedLineColor.colorWithAlphaComponentBy(0.22);
            break;
        /// 处理 JobsGestureLockNodeVisualStateError 分支
        case JobsGestureLockNodeVisualStateError:
            borderColor = self.configuration.errorLineColor;
            fillColor = self.configuration.errorLineColor.colorWithAlphaComponentBy(0.18);
            break;
    }
    button
        .jobsResetBtnImage(nil)
        .selectedStateImageBy(nil)
        .jobsResetBtnBgCor(fillColor)
        .jobsResetBtnLayerBorderCor(borderColor)
        .jobsResetBtnLayerBorderWidth(2)
        .bySelected(state != JobsGestureLockNodeVisualStateNormal);
}

@end
