//
//  JobsLabelScrollController.m
//  JobsOCBaseConfigDemo
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

-(jobsByVoidBlock _Nonnull)requireMainThread;
-(jobsByVoidBlock _Nonnull)rebuild;
-(jobsByVoidBlock _Nonnull)stopForStaticText;
-(jobsByVoidBlock _Nonnull)createAndStartTimer;
-(jobsByVoidBlock _Nonnull)stopTimer;
-(jobsByVoidBlock _Nonnull)tick;
-(jobsByVoidBlock _Nonnull)applyCurrentOffset;
-(jobsByVoidBlock _Nonnull)removeRenderedText;
-(JobsRetBOOLByBOOLBlock _Nonnull)captureExternalSourceIfNeeded;
-(jobsByVoidBlock _Nonnull)captureCurrentSource;
-(JobsRetAttributedStringByVoidBlock _Nonnull)renderedAttributedText;
-(JobsRetUIColorByUIColorBlock _Nonnull)resolvedColor;
-(jobsByNSMutableAttributedStringBlock _Nonnull)resolveDynamicForegroundColorsInAttributedText;
-(void)globalThemeDidChange:(NSNotification *)notification;
-(jobsByNotificationBlock _Nonnull)jobsGlobalThemeDidChange;
-(jobsByVoidBlock _Nonnull)concealSourceText;
-(jobsByVoidBlock _Nonnull)revealSourceText;
-(JobsRetIDByIDBlock _Nonnull)byConfiguration;
-(JobsRetIDByIDBlock _Nonnull)byTimer;
-(BOOL)isSystemPlainTextRepresentation:(NSAttributedString *)attributedText
                              forLabel:(UILabel *)label;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsLabelScrollController
@interface JobsLabelScrollController (JobsPropertyDSLSetterAutogen_6bf287a3e6)
-(void)setConcealed:(BOOL)data;
-(void)setConcealedAttributedText:(NSAttributedString * _Nullable)data;
-(void)setDelayRemaining:(NSTimeInterval)data;
-(void)setLastBoundsSize:(CGSize)data;
-(void)setLastTimestamp:(CFTimeInterval)data;
-(void)setNeedsRebuild:(BOOL)data;
-(void)setOffsetX:(CGFloat)data;
-(void)setOverflowing:(BOOL)data;
-(void)setSourceAttributedText:(NSAttributedString * _Nullable)data;
-(void)setSourceFont:(UIFont * _Nullable)data;
-(void)setSourceInitialized:(BOOL)data;
-(void)setSourcePlainText:(NSString * _Nullable)data;
-(void)setStartRequested:(BOOL)data;
-(void)setTravelDirection:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsLabelScrollController

@implementation JobsLabelScrollController

-(JobsRetIDByIDBlock _Nonnull)byConfiguration{
    @jobs_weakify(self)
    return ^id(JobsLabelScrollConfiguration *configuration){
        @jobs_strongify(self)
        self.configuration = configuration;
        return self;
    };
}

-(JobsRetIDByIDBlock _Nonnull)byTimer{
    @jobs_weakify(self)
    return ^id(JobsTimer *timer){
        @jobs_strongify(self)
        self.timer = timer;
        return self;
    };
}

-(instancetype)initWithLabel:(UILabel *)label{
    if (self = [super init]) {
        _label = label;
        _viewportLayer = CALayer.layer;
        _viewportLayer.byMasksToBounds(YES);
        _viewportLayer.byContentsScale(UIScreen.mainScreen.scale);
        _textLayer = JobsCoreTextScrollLayer.layer;
        [_viewportLayer addSublayer:_textLayer];
        _configuration = JobsLabelScrollConfiguration.continuousConfiguration();
        _sourceTextColor = JobsLabelColor;
        _sourceFont = [UIFont systemFontOfSize:UIFont.labelFontSize];
        _lastBoundsSize = CGSizeZero;
        _travelDirection = 1;
        [NSNotificationCenter.defaultCenter addObserver:self
                                               selector:@selector(globalThemeDidChange:)
                                                   name:JobsThemeDidChangeNotification
                                                 object:nil];
    };return self;
}

-(void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
    if (_timer) _timer.jobsStop();
}

-(BOOL)isRunning{
    return self.overflowing && self.timer.isRunning;
}

-(jobsByJobsLabelScrollConfigurationBlock _Nonnull)configure{
    @jobs_weakify(self)
    return ^(JobsLabelScrollConfiguration * configuration){
        @jobs_strongify(self)
        if (!self) return;
        self.requireMainThread();
        self.byConfiguration(configuration.copy ?: JobsLabelScrollConfiguration.continuousConfiguration());
        if (!self.startRequested) return;
        self.captureExternalSourceIfNeeded(NO);
        self.stopTimer();
        [self rebuild]();
    };
}

-(jobsByVoidBlock _Nonnull)start{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.requireMainThread();
        self.byStartRequested(YES);
        if (!self.sourceInitialized) {
            self.captureCurrentSource();
        }else{
            self.captureExternalSourceIfNeeded(NO);
        }
        [self rebuild]();
    };
}

-(jobsByVoidBlock _Nonnull)pause{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.requireMainThread();
        if (self.timer) self.timer.pause();
        self.byLastTimestamp(0);
    };
}

-(jobsByVoidBlock _Nonnull)resume{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.requireMainThread();
        if (!self.startRequested) return;
        if (self.needsRebuild || !self.overflowing) {
            self.captureExternalSourceIfNeeded(NO);
            [self rebuild]();
        }else if (self.timer) {
            self.timer.resume();
            self.byLastTimestamp(CACurrentMediaTime());
        }else{
            self.createAndStartTimer();
        }
    };
}

-(void)reload{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLabelScrollController.class, @selector(jobsReload)))(self, @selector(jobsReload));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsReload{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.requireMainThread();
        self.captureExternalSourceIfNeeded(YES);
        if (self.startRequested) [self rebuild]();
    };
}

-(jobsByVoidBlock _Nonnull)jobsStop{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.requireMainThread();
        self.captureExternalSourceIfNeeded(NO);
        self.byStartRequested(NO);
        self.stopTimer();
        self.byOverflowing(NO);
        self.byNeedsRebuild(NO);
        self.removeRenderedText();
        self.revealSourceText();
    };
}
#pragma mark —— Core
-(jobsByVoidBlock _Nonnull)rebuild{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UILabel *label = self.label;
        if (!label) {
            self.stopTimer();
            return;
        }
        CGSize size = label.bounds.size;
        if (size.width <= 0 || size.height <= 0) {
            self.byNeedsRebuild(YES);
            self.createAndStartTimer();
            return;
        }
        self.byNeedsRebuild(NO);
        self.byLastBoundsSize(size);

        NSAttributedString *attributedText = self.renderedAttributedText();
        if (label.numberOfLines != 1 || attributedText.length == 0) {
            self.stopForStaticText();
            return;
        }
        NSNumber *duplicateSpacing = self.configuration.mode == JobsLabelScrollModeContinuous ? @(self.configuration.spacing) : nil;
        [self.textLayer updateWithAttributedText:attributedText
                                          height:size.height
                                duplicateSpacing:duplicateSpacing];
        BOOL reduceMotion = self.configuration.respectsReduceMotion && UIAccessibilityIsReduceMotionEnabled();
        /// 光学字形画布会额外扩展以防绘制裁切，不能拿它判断 UILabel 是否容纳得下文案。
        if (self.textLayer.textLayoutWidth <= size.width + 0.5 || reduceMotion) {
            self.stopForStaticText();
            return;
        }

        self.byOverflowing(YES);
        self.concealSourceText();
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.viewportLayer.byFrame(label.bounds);
        if (self.viewportLayer.superlayer != label.layer) {
            [self.viewportLayer removeFromSuperlayer];
            [label.layer addSublayer:self.viewportLayer];
        }
        self.textLayer.byHidden(NO);
        self.byOffsetX(0);
        self.byTravelDirection(1);
        self.byDelayRemaining(self.configuration.startDelay);
        self.applyCurrentOffset();
        [CATransaction commit];
        self.createAndStartTimer();
    };
}

-(jobsByVoidBlock _Nonnull)stopForStaticText{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.stopTimer();
        self.byOverflowing(NO);
        self.removeRenderedText();
        self.revealSourceText();
    };
}

-(jobsByVoidBlock _Nonnull)createAndStartTimer{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.startRequested) return;
        if (!self.timer) {
            NSTimeInterval interval = 1.0 / (double)self.configuration.framesPerSecond;
            @jobs_weakify(self)
            self.byTimer(jobsMakeTimer(^(JobsTimer *timer) {
                @jobs_strongify(self)
                if (!self) return;
                timer.byTimerType(self.configuration.timerType)
                    .byTimerStyle(TimerStyle_clockwise)
                    .byTimeInterval(interval)
                    .byStartTime(0)
                    .byTimeSecIntervalSinceDate(0)
                    .byQueue(dispatch_get_main_queue())
                    .byPauseInBackground(1)
                    .byAutoManageAppState(1)
                    .byOnTick(^(__unused CGFloat time) {
                        @jobs_strongify(self)
                        if (!self) return;
                        if (NSThread.isMainThread) {
                            self.tick();
                        }else{
                            dispatch_async(dispatch_get_main_queue(), ^{
                                self.tick();
                            });
                        }
                    });
            }));
        }
        self.byLastTimestamp(CACurrentMediaTime());
        self.timer.start();
    };
}

-(jobsByVoidBlock _Nonnull)stopTimer{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.timer) self.timer.jobsStop();
        self.byTimer(nil);
        self.byLastTimestamp(0);
    };
}

-(jobsByVoidBlock _Nonnull)tick{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UILabel *label = self.label;
        if (!self.startRequested || !label) return;
        if (self.captureExternalSourceIfNeeded(NO)) {
            [self rebuild]();
            return;
        }
        if (self.needsRebuild || !CGSizeEqualToSize(label.bounds.size, self.lastBoundsSize)) {
            [self rebuild]();
            return;
        }
        if (!self.overflowing) return;

        CFTimeInterval now = CACurrentMediaTime();
        if (self.lastTimestamp <= 0) {
            self.byLastTimestamp(now);
            return;
        }
        CFTimeInterval elapsed = MIN(MAX(0, now - self.lastTimestamp), 0.1);
        self.byLastTimestamp(now);
        if (self.delayRemaining > 0) {
            self.byDelayRemaining(MAX(0, self.delayRemaining - elapsed));
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
                self.byOffsetX(maximumOffset);
                self.byTravelDirection(-1);
                self.byDelayRemaining(self.configuration.edgePause);
            }else if (self.offsetX <= 0){
                self.byOffsetX(0);
                self.byTravelDirection(1);
                self.byDelayRemaining(self.configuration.edgePause);
            }
        }
        self.applyCurrentOffset();
    };
}

-(jobsByVoidBlock _Nonnull)applyCurrentOffset{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        [self.textLayer setAffineTransform:CGAffineTransformMakeTranslation(-self.offsetX, 0)];
        [CATransaction commit];
    };
}

-(jobsByVoidBlock _Nonnull)removeRenderedText{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        [self.viewportLayer removeFromSuperlayer];
        [self.textLayer setAffineTransform:CGAffineTransformIdentity];
        [CATransaction commit];
    };
}
#pragma mark —— UILabel source state
-(JobsRetBOOLByBOOLBlock _Nonnull)captureExternalSourceIfNeeded{
    @jobs_weakify(self)
    return ^BOOL(BOOL force){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        UILabel *label = self.label;
        if (!label) return NO;
        if (!self.sourceInitialized) {
            self.captureCurrentSource();
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
        self.captureCurrentSource();
        return YES;
    };
}

-(jobsByVoidBlock _Nonnull)captureCurrentSource{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
            self.bySourceAttributedText(currentAttributedText.copy);
            self.bySourcePlainText(nil);
        }else{
            self.bySourceAttributedText(nil);
            self.bySourcePlainText(label.text ?: currentAttributedText.string);
        }
        if (!self.concealed || ![label.textColor isEqual:UIColor.clearColor]) self.sourceTextColor = label.textColor;
        self.bySourceFont(label.font);
        if (!self.concealed || ![label.shadowColor isEqual:UIColor.clearColor]) self.sourceShadowColor = label.shadowColor;
        self.bySourceInitialized(YES);
    };
}

-(JobsRetAttributedStringByVoidBlock _Nonnull)renderedAttributedText{
    @jobs_weakify(self)
    return ^NSAttributedString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
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
            UIColor *resolvedTextColor = self.resolvedColor(self.sourceTextColor);
            for (NSValue *value in missingColorRanges) {
                [result addAttribute:NSForegroundColorAttributeName value:resolvedTextColor range:value.rangeValue];
            }
            self.resolveDynamicForegroundColorsInAttributedText(result);
            return result;
        }
        if (self.sourcePlainText.length == 0) return nil;
        NSMutableDictionary<NSAttributedStringKey,id> *attributes = [@{
            NSFontAttributeName: self.sourceFont,
            NSForegroundColorAttributeName: self.resolvedColor(self.sourceTextColor)
        } mutableCopy];
        if (self.sourceShadowColor && self.label) {
            NSShadow *shadow = jobsMakeShadow(^(NSShadow *object){});
            shadow.byShadowColor(self.resolvedColor(self.sourceShadowColor));
            shadow.byShadowOffset(self.label.shadowOffset);
            attributes[NSShadowAttributeName] = shadow;
        };return [NSAttributedString.alloc initWithString:self.sourcePlainText
                                              attributes:attributes];
    };
}

-(JobsRetUIColorByUIColorBlock _Nonnull)resolvedColor{
    @jobs_weakify(self)
    return ^UIColor *(UIColor * color){
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 13.0, *)) {
            UITraitCollection *traitCollection = self.label.traitCollection ?: UITraitCollection.currentTraitCollection;
            return [color resolvedColorWithTraitCollection:traitCollection];
        };return color;
    };
}

-(jobsByNSMutableAttributedStringBlock _Nonnull)resolveDynamicForegroundColorsInAttributedText{
    @jobs_weakify(self)
    return ^(NSMutableAttributedString * attributedText){
        @jobs_strongify(self)
        if (!self) return;
        NSRange fullRange = NSMakeRange(0, attributedText.length);
        NSMutableArray<NSValue *> *rangeArr = NSMutableArray.array;
        NSMutableArray<UIColor *> *colorArr = NSMutableArray.array;
        [attributedText enumerateAttribute:NSForegroundColorAttributeName
                                  inRange:fullRange
                                  options:0
                               usingBlock:^(id value, NSRange range, __unused BOOL *stop) {
            if (![value isKindOfClass:UIColor.class]) return;
            UIColor *resolvedColor = self.resolvedColor(value);
            if ([resolvedColor isEqual:value]) return;
            [rangeArr addObject:[NSValue valueWithRange:range]];
            [colorArr addObject:resolvedColor];
        }];
        [rangeArr enumerateObjectsUsingBlock:^(NSValue *value, NSUInteger index, __unused BOOL *stop) {
            [attributedText addAttribute:NSForegroundColorAttributeName
                                  value:colorArr[index]
                                  range:value.rangeValue];
        }];
    };
}

-(void)globalThemeDidChange:(NSNotification *)notification{
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLabelScrollController.class, @selector(jobsGlobalThemeDidChange)))(self, @selector(jobsGlobalThemeDidChange));
    if (action) action(notification);
}

-(jobsByNotificationBlock _Nonnull)jobsGlobalThemeDidChange{
    @jobs_weakify(self)
    return ^(NSNotification * notification){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.startRequested) return;
        if (!NSThread.isMainThread) {
            @jobs_weakify(self)
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self globalThemeDidChange:notification];
            });
            return;
        }
        [self rebuild]();
    };
}

-(jobsByVoidBlock _Nonnull)concealSourceText{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UILabel *label = self.label;
        NSAttributedString *renderedText = self.renderedAttributedText();
        if (!label || renderedText.length == 0) return;
        NSMutableAttributedString *hiddenText = [renderedText mutableCopy];
        NSRange fullRange = NSMakeRange(0, hiddenText.length);
        NSShadow *hiddenShadow = jobsMakeShadow(^(NSShadow *object){});
        hiddenShadow.byShadowColor(UIColor.clearColor);
        hiddenShadow.byShadowOffset(CGSizeZero);
        hiddenShadow.byShadowBlurRadius(0);
        [hiddenText addAttributes:@{
            NSForegroundColorAttributeName: UIColor.clearColor,
            NSBackgroundColorAttributeName: UIColor.clearColor,
            NSStrokeColorAttributeName: UIColor.clearColor,
            NSUnderlineStyleAttributeName: @0,
            NSStrikethroughStyleAttributeName: @0,
            NSShadowAttributeName: hiddenShadow,
            JobsLabelScrollConcealedAttribute: @YES
        } range:fullRange];

        self.byConcealedAttributedText(hiddenText.copy);
        label.byTextCor(UIColor.clearColor)
            .byShadowColor(UIColor.clearColor)
            .byAttributedString(self.concealedAttributedText);
        self.byConcealed(YES);
        [label setNeedsDisplay];
    };
}

-(jobsByVoidBlock _Nonnull)revealSourceText{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UILabel *label = self.label;
        if (!self.concealed || !label) return;
        label.byTextCor(self.sourceTextColor)
            .byShadowColor(self.sourceShadowColor);
        if (self.sourceAttributedText) {
            label.byAttributedString(self.sourceAttributedText);
        }else{
            label.byAttributedString(nil)
                .byText(self.sourcePlainText);
        }
        self.byConcealedAttributedText(nil);
        self.byConcealed(NO);
        [label setNeedsDisplay];
    };
}

-(BOOL)isSystemPlainTextRepresentation:(NSAttributedString *)attributedText
                              forLabel:(UILabel *)label{
    if (![attributedText.string isEqualToString:label.text]) return NO;
    UILabel *referenceLabel = jobsMakeLabel(^(UILabel *object){})
        .byFont(label.font)
        .byTextCor(label.textColor)
        .byTextAlignment(label.textAlignment)
        .byLineBreakMode(label.lineBreakMode)
        .byNumberOfLines(label.numberOfLines)
        .byShadowColor(label.shadowColor)
        .byShadowOffset(label.shadowOffset)
        .byAdjustsFontSizeToFitWidth(label.adjustsFontSizeToFitWidth)
        .byMinimumScaleFactor(label.minimumScaleFactor)
        .byBaselineAdjustment(label.baselineAdjustment)
        .byAllowsDefaultTighteningForTruncation(label.allowsDefaultTighteningForTruncation)
        .byText(attributedText.string);
    return [referenceLabel.attributedText isEqualToAttributedString:attributedText];
}

-(jobsByVoidBlock _Nonnull)requireMainThread{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSAssert(NSThread.isMainThread, @"UILabel+Scrolling must be configured on the main thread.");
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsLabelScrollController
-(JobsRetJobsLabelScrollControllerByBOOLBlock _Nonnull)byConcealed{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setConcealed:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByBOOLBlock _Nonnull)byNeedsRebuild{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setNeedsRebuild:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByBOOLBlock _Nonnull)byOverflowing{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setOverflowing:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByBOOLBlock _Nonnull)bySourceInitialized{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setSourceInitialized:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByBOOLBlock _Nonnull)byStartRequested{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setStartRequested:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByCFTimeIntervalBlock _Nonnull)byLastTimestamp{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        [self setLastTimestamp:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByCGFloatBlock _Nonnull)byOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setOffsetX:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByCGFloatBlock _Nonnull)byTravelDirection{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setTravelDirection:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByCGSizeBlock _Nonnull)byLastBoundsSize{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setLastBoundsSize:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByNSAttributedStringBlock _Nonnull)byConcealedAttributedText{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(NSAttributedString * _Nullable data){
        @jobs_strongify(self)
        [self setConcealedAttributedText:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByNSAttributedStringBlock _Nonnull)bySourceAttributedText{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(NSAttributedString * _Nullable data){
        @jobs_strongify(self)
        [self setSourceAttributedText:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByNSStringBlock _Nonnull)bySourcePlainText{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setSourcePlainText:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByNSTimeIntervalBlock _Nonnull)byDelayRemaining{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        [self setDelayRemaining:data];
        return self;
    };
}

-(JobsRetJobsLabelScrollControllerByUIFontBlock _Nonnull)bySourceFont{
    @jobs_weakify(self)
    return ^__kindof JobsLabelScrollController * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        [self setSourceFont:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsLabelScrollController
@end
