//
//  JobsLabelScrollController.m
//  JobsScrollingLabel
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#import "JobsLabelScrollController.h"

static NSAttributedStringKey const JobsLabelScrollConcealedAttribute = @"com.jobs.scrolling-label.concealed";

@interface JobsLabelScrollController ()

Prop_weak()UILabel *label;
Prop_strong()CALayer *viewportLayer;
Prop_strong()JobsCoreTextScrollLayer *textLayer;
Prop_strong()JobsLabelScrollConfiguration *configuration;
Prop_strong(nullable)JobsTimer *timer;
Prop_assign()BOOL startRequested;
Prop_assign()BOOL needsRebuild;
Prop_assign()BOOL overflowing;
Prop_assign()BOOL concealed;
/// 原始文本独立保存，避免隐藏态 `UILabel.textColor == clearColor` 污染新文案。
Prop_assign()BOOL sourceInitialized;
Prop_copy(nullable)NSAttributedString *sourceAttributedText;
Prop_copy(nullable)NSString *sourcePlainText;
Prop_strong()UIColor *sourceTextColor;
Prop_strong()UIFont *sourceFont;
Prop_strong(nullable)UIColor *sourceShadowColor;
Prop_copy(nullable)NSAttributedString *concealedAttributedText;
Prop_assign()CGSize lastBoundsSize;
Prop_assign()CFTimeInterval lastTimestamp;
Prop_assign()CGFloat offsetX;
Prop_assign()CGFloat travelDirection;
Prop_assign()NSTimeInterval delayRemaining;

-(void)requireMainThread;
-(void)rebuild;
-(void)stopForStaticText;
-(void)createAndStartTimer;
-(void)stopTimer;
-(void)tick;
-(void)applyCurrentOffset;
-(void)removeRenderedText;
-(BOOL)captureExternalSourceIfNeeded:(BOOL)force;
-(void)captureCurrentSource;
-(nullable NSAttributedString *)renderedAttributedText;
-(void)concealSourceText;
-(void)revealSourceText;
-(BOOL)isSystemPlainTextRepresentation:(NSAttributedString *)attributedText
                              forLabel:(UILabel *)label;

@end

@implementation JobsLabelScrollController

-(instancetype)initWithLabel:(UILabel *)label{
    if (self = [super init]) {
        _label = label;
        _viewportLayer = CALayer.layer;
        _viewportLayer.masksToBounds = YES;
        _viewportLayer.contentsScale = UIScreen.mainScreen.scale;
        _textLayer = JobsCoreTextScrollLayer.layer;
        [_viewportLayer addSublayer:_textLayer];
        _configuration = JobsLabelScrollConfiguration.continuousConfiguration;
        _sourceTextColor = UIColor.blackColor;
        _sourceFont = [UIFont systemFontOfSize:UIFont.labelFontSize];
        _lastBoundsSize = CGSizeZero;
        _travelDirection = 1;
    };return self;
}

-(void)dealloc{
    [_timer stop];
}

-(BOOL)isRunning{
    return self.overflowing && self.timer.isRunning;
}

-(void)configure:(JobsLabelScrollConfiguration *)configuration{
    [self requireMainThread];
    self.configuration = configuration.copy ?: JobsLabelScrollConfiguration.continuousConfiguration;
    if (!self.startRequested) return;
    [self captureExternalSourceIfNeeded:NO];
    [self stopTimer];
    [self rebuild];
}

-(void)start{
    [self requireMainThread];
    self.startRequested = YES;
    if (!self.sourceInitialized) {
        [self captureCurrentSource];
    }else{
        [self captureExternalSourceIfNeeded:NO];
    }
    [self rebuild];
}

-(void)pause{
    [self requireMainThread];
    [self.timer pause];
    self.lastTimestamp = 0;
}

-(void)resume{
    [self requireMainThread];
    if (!self.startRequested) return;
    if (self.needsRebuild || !self.overflowing) {
        [self captureExternalSourceIfNeeded:NO];
        [self rebuild];
    }else if (self.timer) {
        [self.timer resume];
        self.lastTimestamp = CACurrentMediaTime();
    }else{
        [self createAndStartTimer];
    }
}

-(void)reload{
    [self requireMainThread];
    [self captureExternalSourceIfNeeded:YES];
    if (self.startRequested) [self rebuild];
}

-(void)stop{
    [self requireMainThread];
    [self captureExternalSourceIfNeeded:NO];
    self.startRequested = NO;
    [self stopTimer];
    self.overflowing = NO;
    self.needsRebuild = NO;
    [self removeRenderedText];
    [self revealSourceText];
}
#pragma mark —— Core
-(void)rebuild{
    UILabel *label = self.label;
    if (!label) {
        [self stopTimer];
        return;
    }
    CGSize size = label.bounds.size;
    if (size.width <= 0 || size.height <= 0) {
        self.needsRebuild = YES;
        [self createAndStartTimer];
        return;
    }
    self.needsRebuild = NO;
    self.lastBoundsSize = size;

    NSAttributedString *attributedText = [self renderedAttributedText];
    if (label.numberOfLines != 1 || attributedText.length == 0) {
        [self stopForStaticText];
        return;
    }
    NSNumber *duplicateSpacing = self.configuration.mode == JobsLabelScrollModeContinuous ? @(self.configuration.spacing) : nil;
    [self.textLayer updateWithAttributedText:attributedText
                                      height:size.height
                            duplicateSpacing:duplicateSpacing];
    BOOL reduceMotion = self.configuration.respectsReduceMotion && UIAccessibilityIsReduceMotionEnabled();
    if (self.textLayer.textWidth <= size.width + 0.5 || reduceMotion) {
        [self stopForStaticText];
        return;
    }

    self.overflowing = YES;
    [self concealSourceText];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.viewportLayer.frame = label.bounds;
    if (self.viewportLayer.superlayer != label.layer) {
        [self.viewportLayer removeFromSuperlayer];
        [label.layer addSublayer:self.viewportLayer];
    }
    self.textLayer.hidden = NO;
    self.offsetX = 0;
    self.travelDirection = 1;
    self.delayRemaining = self.configuration.startDelay;
    [self applyCurrentOffset];
    [CATransaction commit];
    [self createAndStartTimer];
}

-(void)stopForStaticText{
    [self stopTimer];
    self.overflowing = NO;
    [self removeRenderedText];
    [self revealSourceText];
}

-(void)createAndStartTimer{
    if (!self.startRequested) return;
    if (!self.timer) {
        NSTimeInterval interval = 1.0 / (double)self.configuration.framesPerSecond;
        __weak typeof(self) weakSelf = self;
        self.timer = jobsMakeTimer(^(JobsTimer *timer) {
            timer.byTimerType(weakSelf.configuration.timerType)
                .byTimerStyle(TimerStyle_clockwise)
                .byTimeInterval(interval)
                .byStartTime(0)
                .byTimeSecIntervalSinceDate(0)
                .byQueue(dispatch_get_main_queue())
                .byPauseInBackground(1)
                .byAutoManageAppState(1)
                .byOnTick(^(__unused CGFloat time) {
                    __strong typeof(weakSelf) self = weakSelf;
                    if (!self) return;
                    if (NSThread.isMainThread) {
                        [self tick];
                    }else{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self tick];
                        });
                    }
                });
        });
    }
    self.lastTimestamp = CACurrentMediaTime();
    [self.timer start];
}

-(void)stopTimer{
    [self.timer stop];
    self.timer = nil;
    self.lastTimestamp = 0;
}

-(void)tick{
    UILabel *label = self.label;
    if (!self.startRequested || !label) return;
    if ([self captureExternalSourceIfNeeded:NO]) {
        [self rebuild];
        return;
    }
    if (self.needsRebuild || !CGSizeEqualToSize(label.bounds.size, self.lastBoundsSize)) {
        [self rebuild];
        return;
    }
    if (!self.overflowing) return;

    CFTimeInterval now = CACurrentMediaTime();
    if (self.lastTimestamp <= 0) {
        self.lastTimestamp = now;
        return;
    }
    CFTimeInterval elapsed = MIN(MAX(0, now - self.lastTimestamp), 0.1);
    self.lastTimestamp = now;
    if (self.delayRemaining > 0) {
        self.delayRemaining = MAX(0, self.delayRemaining - elapsed);
        return;
    }

    if (self.configuration.mode == JobsLabelScrollModeContinuous) {
        CGFloat cycleWidth = self.textLayer.textWidth + self.configuration.spacing;
        if (cycleWidth <= 0) return;
        self.offsetX += self.configuration.speed * elapsed;
        while (self.offsetX >= cycleWidth) self.offsetX -= cycleWidth;
    }else{
        CGFloat maximumOffset = MAX(0, self.textLayer.textWidth - CGRectGetWidth(label.bounds));
        if (maximumOffset <= 0) return;
        self.offsetX += self.travelDirection * self.configuration.speed * elapsed;
        if (self.offsetX >= maximumOffset) {
            self.offsetX = maximumOffset;
            self.travelDirection = -1;
            self.delayRemaining = self.configuration.edgePause;
        }else if (self.offsetX <= 0){
            self.offsetX = 0;
            self.travelDirection = 1;
            self.delayRemaining = self.configuration.edgePause;
        }
    }
    [self applyCurrentOffset];
}

-(void)applyCurrentOffset{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [self.textLayer setAffineTransform:CGAffineTransformMakeTranslation(-self.offsetX, 0)];
    [CATransaction commit];
}

-(void)removeRenderedText{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [self.viewportLayer removeFromSuperlayer];
    [self.textLayer setAffineTransform:CGAffineTransformIdentity];
    [CATransaction commit];
}
#pragma mark —— UILabel source state
-(BOOL)captureExternalSourceIfNeeded:(BOOL)force{
    UILabel *label = self.label;
    if (!label) return NO;
    if (!self.sourceInitialized) {
        [self captureCurrentSource];
        return YES;
    }

    BOOL textChanged = NO;
    if (self.concealed) {
        if (self.concealedAttributedText) {
            textChanged = ![label.attributedText isEqualToAttributedString:self.concealedAttributedText];
        }else{
            textChanged = label.attributedText != nil || ![label.text ?: @"" isEqualToString:self.sourcePlainText ?: @""];
        }
    }else if (self.sourceAttributedText) {
        textChanged = ![label.attributedText isEqualToAttributedString:self.sourceAttributedText];
    }else{
        textChanged = label.attributedText != nil || ![label.text ?: @"" isEqualToString:self.sourcePlainText ?: @""];
    }
    BOOL fontChanged = ![label.font isEqual:self.sourceFont];
    BOOL colorChanged = self.concealed ? ![label.textColor isEqual:UIColor.clearColor] : ![label.textColor isEqual:self.sourceTextColor];
    if (!force && !textChanged && !fontChanged && !colorChanged) return NO;
    if (force && self.concealed && !textChanged && !fontChanged && !colorChanged) return YES;
    [self captureCurrentSource];
    return YES;
}

-(void)captureCurrentSource{
    UILabel *label = self.label;
    if (!label) return;
    NSAttributedString *currentAttributedText = nil;
    if (self.concealed &&
        self.concealedAttributedText &&
        [label.attributedText isEqualToAttributedString:self.concealedAttributedText]) {
        currentAttributedText = self.sourceAttributedText;
    }else{
        currentAttributedText = label.attributedText;
    }

    BOOL inheritsConcealedStyle = NO;
    if (currentAttributedText.length > 0) {
        inheritsConcealedStyle = [[currentAttributedText attribute:JobsLabelScrollConcealedAttribute
                                                           atIndex:0
                                                    effectiveRange:nil] boolValue];
    }
    if (currentAttributedText.length > 0 &&
        !inheritsConcealedStyle &&
        ![self isSystemPlainTextRepresentation:currentAttributedText forLabel:label]) {
        self.sourceAttributedText = currentAttributedText.copy;
        self.sourcePlainText = nil;
    }else{
        self.sourceAttributedText = nil;
        self.sourcePlainText = label.text ?: currentAttributedText.string;
    }
    if (!self.concealed || ![label.textColor isEqual:UIColor.clearColor]) self.sourceTextColor = label.textColor;
    self.sourceFont = label.font;
    if (!self.concealed || ![label.shadowColor isEqual:UIColor.clearColor]) self.sourceShadowColor = label.shadowColor;
    self.sourceInitialized = YES;
}

-(NSAttributedString *)renderedAttributedText{
    if (self.sourceAttributedText) {
        NSMutableAttributedString *result = [self.sourceAttributedText mutableCopy];
        NSRange fullRange = NSMakeRange(0, result.length);
        NSMutableArray<NSValue *> *missingFontRanges = NSMutableArray.array;
        NSMutableArray<NSValue *> *missingColorRanges = NSMutableArray.array;
        [result enumerateAttribute:NSFontAttributeName
                          inRange:fullRange
                          options:0
                       usingBlock:^(id value, NSRange range, __unused BOOL *stop) {
            if (!value) [missingFontRanges addObject:[NSValue valueWithRange:range]];
        }];
        [result enumerateAttribute:NSForegroundColorAttributeName
                          inRange:fullRange
                          options:0
                       usingBlock:^(id value, NSRange range, __unused BOOL *stop) {
            if (!value) [missingColorRanges addObject:[NSValue valueWithRange:range]];
        }];
        for (NSValue *value in missingFontRanges) {
            [result addAttribute:NSFontAttributeName value:self.sourceFont range:value.rangeValue];
        }
        for (NSValue *value in missingColorRanges) {
            [result addAttribute:NSForegroundColorAttributeName value:self.sourceTextColor range:value.rangeValue];
        };return result;
    }
    if (self.sourcePlainText.length == 0) return nil;
    NSMutableDictionary<NSAttributedStringKey,id> *attributes = [@{
        NSFontAttributeName: self.sourceFont,
        NSForegroundColorAttributeName: self.sourceTextColor
    } mutableCopy];
    if (self.sourceShadowColor && self.label) {
        NSShadow *shadow = NSShadow.new;
        shadow.shadowColor = self.sourceShadowColor;
        shadow.shadowOffset = self.label.shadowOffset;
        attributes[NSShadowAttributeName] = shadow;
    }return [NSAttributedString.alloc initWithString:self.sourcePlainText
                                          attributes:attributes];
}

-(void)concealSourceText{
    UILabel *label = self.label;
    NSAttributedString *renderedText = [self renderedAttributedText];
    if (!label || renderedText.length == 0) return;
    NSMutableAttributedString *hiddenText = [renderedText mutableCopy];
    NSRange fullRange = NSMakeRange(0, hiddenText.length);
    NSShadow *hiddenShadow = NSShadow.new;
    hiddenShadow.shadowColor = UIColor.clearColor;
    hiddenShadow.shadowOffset = CGSizeZero;
    hiddenShadow.shadowBlurRadius = 0;
    [hiddenText addAttributes:@{
        NSForegroundColorAttributeName: UIColor.clearColor,
        NSBackgroundColorAttributeName: UIColor.clearColor,
        NSStrokeColorAttributeName: UIColor.clearColor,
        NSUnderlineStyleAttributeName: @0,
        NSStrikethroughStyleAttributeName: @0,
        NSShadowAttributeName: hiddenShadow,
        JobsLabelScrollConcealedAttribute: @YES
    } range:fullRange];

    label.textColor = UIColor.clearColor;
    label.shadowColor = UIColor.clearColor;
    self.concealedAttributedText = hiddenText.copy;
    label.attributedText = self.concealedAttributedText;
    self.concealed = YES;
    [label setNeedsDisplay];
}

-(void)revealSourceText{
    UILabel *label = self.label;
    if (!self.concealed || !label) return;
    label.textColor = self.sourceTextColor;
    label.shadowColor = self.sourceShadowColor;
    if (self.sourceAttributedText) {
        label.attributedText = self.sourceAttributedText;
    }else{
        label.attributedText = nil;
        label.text = self.sourcePlainText;
    }
    self.concealedAttributedText = nil;
    self.concealed = NO;
    [label setNeedsDisplay];
}

-(BOOL)isSystemPlainTextRepresentation:(NSAttributedString *)attributedText
                              forLabel:(UILabel *)label{
    if (![attributedText.string isEqualToString:label.text]) return NO;
    UILabel *referenceLabel = UILabel.new;
    referenceLabel.font = label.font;
    referenceLabel.textColor = label.textColor;
    referenceLabel.textAlignment = label.textAlignment;
    referenceLabel.lineBreakMode = label.lineBreakMode;
    referenceLabel.numberOfLines = label.numberOfLines;
    referenceLabel.shadowColor = label.shadowColor;
    referenceLabel.shadowOffset = label.shadowOffset;
    referenceLabel.adjustsFontSizeToFitWidth = label.adjustsFontSizeToFitWidth;
    referenceLabel.minimumScaleFactor = label.minimumScaleFactor;
    referenceLabel.baselineAdjustment = label.baselineAdjustment;
    referenceLabel.allowsDefaultTighteningForTruncation = label.allowsDefaultTighteningForTruncation;
    referenceLabel.text = attributedText.string;
    return [referenceLabel.attributedText isEqualToAttributedString:attributedText];
}

-(void)requireMainThread{
    NSAssert(NSThread.isMainThread, @"JobsScrollingLabel must be configured on the main thread.");
}

@end
