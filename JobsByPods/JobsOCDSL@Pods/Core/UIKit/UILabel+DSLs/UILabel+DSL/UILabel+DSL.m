//
//  UILabel+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "UILabel+DSL.h"

static NSString *JobsOCDSLLabelLayerText(UILabel *label){
    if (label.attributedText.string.length) return label.attributedText.string;
    return label.text ?: @"";
}

static UIBezierPath *JobsOCDSLLabelLayerPath(UILabel *label, JobsDirectionType directionType){
    NSString *text = JobsOCDSLLabelLayerText(label);
    if (!text.length) return nil;
    UIFont *font = label.font ?: [UIFont systemFontOfSize:UIFont.systemFontSize];
    CTFontRef ctFont = CTFontCreateWithName((__bridge CFStringRef)font.fontName,
                                            font.pointSize,
                                            NULL);
    if (!ctFont) return nil;
    NSDictionary *attributes = @{(__bridge id)kCTFontAttributeName: (__bridge id)ctFont};
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:text
                                                                           attributes:attributes];
    CTLineRef line = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)attributedString);
    CFRelease(ctFont);
    if (!line) return nil;
    CGMutablePathRef glyphPath = CGPathCreateMutable();
    CFArrayRef runs = CTLineGetGlyphRuns(line);
    if (!runs) {
        CGPathRelease(glyphPath);
        CFRelease(line);
        return nil;
    }
    for (CFIndex iRun = 0, iRunMax = CFArrayGetCount(runs); iRun < iRunMax; iRun++) {
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runs, iRun);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        for (CFIndex iGlyph = 0, iGlyphMax = CTRunGetGlyphCount(run); iGlyph < iGlyphMax; iGlyph++) {
            CFRange glyphRange = CFRangeMake(iGlyph, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, glyphRange, &glyph);
            CTRunGetPositions(run, glyphRange, &position);
            CGPathRef glyphItemPath = CTFontCreatePathForGlyph(runFont, glyph, NULL);
            if (glyphItemPath) {
                CGAffineTransform positionTransform = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(glyphPath, &positionTransform, glyphItemPath);
                CGPathRelease(glyphItemPath);
            }
        }
    }
    if (CGPathIsEmpty(glyphPath)) {
        CGPathRelease(glyphPath);
        CFRelease(line);
        return nil;
    }
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:glyphPath];
    CGRect boundingBox = CGPathGetPathBoundingBox(glyphPath);
    CGPathRelease(glyphPath);
    CFRelease(line);
    [path applyTransform:CGAffineTransformMakeScale(1.0, -1.0)];
    [path applyTransform:CGAffineTransformMakeTranslation(0.0, boundingBox.size.height)];
    [path applyTransform:CGAffineTransformMakeRotation(M_PI * directionType * 0.5)];
    CGRect pathBounds = CGPathGetPathBoundingBox(path.CGPath);
    if (!CGRectIsEmpty(pathBounds)) {
        [path applyTransform:CGAffineTransformMakeTranslation(-CGRectGetMinX(pathBounds),
                                                              -CGRectGetMinY(pathBounds))];
    };return path;
}

static BOOL JobsOCDSLRefreshLabelShapeLayer(UILabel *label,
                                            UIColor *displayColor,
                                            JobsDirectionType directionType){
    UIBezierPath *path = JobsOCDSLLabelLayerPath(label, directionType);
    if (!path) return NO;
    CGRect pathBounds = CGPathGetPathBoundingBox(path.CGPath);
    CAShapeLayer *shapeLayer = label.shapeLayer;
    shapeLayer.bounds = CGRectMake(0,
                                   0,
                                   CGRectGetWidth(pathBounds),
                                   CGRectGetHeight(pathBounds));
    shapeLayer.position = CGPointMake(CGRectGetMidX(label.bounds),
                                      CGRectGetMidY(label.bounds));
    shapeLayer.byContentsScale(UIScreen.mainScreen.scale);
    shapeLayer.byPath(path.CGPath);
    shapeLayer.byStrokeColor(displayColor.CGColor);
    shapeLayer.byFillColor(displayColor.CGColor);
    shapeLayer.byLineWidth(0.5f);
    shapeLayer.byLineJoin(kCALineJoinBevel);
    return YES;
}

@interface JobsOCDSLAnimatedNumberStore : NSObject

Prop_strong(nullable) NSNumber *start;
Prop_strong(nullable) NSNumber *step;
Prop_assign()NSTimeInterval duration;
Prop_assign()NSTimeInterval minimumInterval;
Prop_copy(nullable) jobsByVoidBlock completion;
Prop_strong(nullable) JobsTimer *timer;
Prop_assign()double targetValue;
Prop_assign()double currentValue;
Prop_assign()double deltaPerTick;
Prop_assign()NSInteger decimals;
Prop_copy()NSString *originalText;

-(JobsRetIDByIDBlock _Nonnull)byStart;
-(JobsRetIDByDoubleBlock _Nonnull)byDuration;
-(JobsRetIDByIDBlock _Nonnull)byCompletion;
-(JobsRetIDByIDBlock _Nonnull)byTimer;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCDSLAnimatedNumberStore
-(JobsRetJobsOCDSLAnimatedNumberStoreBydoubleBlock _Nonnull)byCurrentValue;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCDSLAnimatedNumberStore
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCDSLAnimatedNumberStore
@interface JobsOCDSLAnimatedNumberStore (JobsPropertyDSLSetterAutogen_5605ba6375)
-(void)setCurrentValue:(double)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCDSLAnimatedNumberStore

@implementation JobsOCDSLAnimatedNumberStore
-(JobsRetIDByIDBlock _Nonnull)byStart{
    @jobs_weakify(self)
    return ^id _Nullable(NSNumber *_Nullable data){
        @jobs_strongify(self)
        self.start = data;
        return self;
    };
}

-(JobsRetIDByDoubleBlock _Nonnull)byDuration{
    @jobs_weakify(self)
    return ^id _Nullable(double data){
        @jobs_strongify(self)
        self.duration = data;
        return self;
    };
}

-(JobsRetIDByIDBlock _Nonnull)byCompletion{
    @jobs_weakify(self)
    return ^id _Nullable(jobsByVoidBlock _Nullable data){
        @jobs_strongify(self)
        self.completion = data;
        return self;
    };
}

-(JobsRetIDByIDBlock _Nonnull)byTimer{
    @jobs_weakify(self)
    return ^id _Nullable(JobsTimer *_Nullable data){
        @jobs_strongify(self)
        self.timer = data;
        return self;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        _duration = 0.8;
        _minimumInterval = 1.0 / 60.0;
        _originalText = @"0";
    };return self;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCDSLAnimatedNumberStore
-(JobsRetJobsOCDSLAnimatedNumberStoreBydoubleBlock _Nonnull)byCurrentValue{
    @jobs_weakify(self)
    return ^__kindof JobsOCDSLAnimatedNumberStore * _Nullable(double data){
        @jobs_strongify(self)
        [self setCurrentValue:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCDSLAnimatedNumberStore
@end

JobsKey(_jobsOCDSLAnimatedNumberStore)

static NSNumber *JobsOCDSLAnimatedNumberValue(NSString *text){
    NSString *trimmed = [text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (!trimmed.length) return nil;
    NSScanner *scanner = [NSScanner scannerWithString:trimmed];
    double value = 0;
    if (![scanner scanDouble:&value]) return nil;
    if (!scanner.isAtEnd) return nil;
    return @(value);
}

static NSInteger JobsOCDSLAnimatedNumberDecimals(NSString *text){
    NSRange dotRange = [text rangeOfString:@"."];
    if (dotRange.location == NSNotFound) return 0;
    NSString *fraction = [text substringFromIndex:NSMaxRange(dotRange)];
    NSInteger count = 0;
    for (NSUInteger idx = 0; idx < fraction.length; idx++) {
        unichar ch = [fraction characterAtIndex:idx];
        if (![[NSCharacterSet decimalDigitCharacterSet] characterIsMember:ch]) break;
        count += 1;
    };return count;
}

static NSString *JobsOCDSLAnimatedNumberText(double value, NSInteger decimals){
    if (decimals <= 0) return [NSString stringWithFormat:@"%lld", (long long)llround(value)];
    return [NSString stringWithFormat:@"%.*f", (int)decimals, value];
}

@interface UILabel (JobsOCDSLAnimatedNumber)

-(JobsRetJobsOCDSLAnimatedNumberStoreByVoidBlock _Nonnull)jobs_ocdslAnimatedNumberStore;
-(jobsByVoidBlock _Nonnull)jobs_ocdslStopAnimatedNumberTimer;
-(jobsByVoidBlock _Nonnull)jobs_ocdslTickAnimatedNumber;

@end

@implementation UILabel (DSL)
-(JobsRetNSMutableAttributedStringByVoidBlock _Nonnull)makeAttributedStringBySelfText{
    @jobs_weakify(self)
    return ^__kindof NSMutableAttributedString *{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *text = self.text ?: @"";
        NSDictionary<NSAttributedStringKey, id> *attributes = @{
            NSForegroundColorAttributeName: self.textColor ?: UIColor.clearColor,
            NSFontAttributeName: self.font ?: [UIFont systemFontOfSize:UIFont.systemFontSize]
        };
        return [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    };
}

-(JobsRetLabelByNSIntegerBlock _Nonnull)transformLayer{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSInteger directionType){
        @jobs_strongify(self)
        self.byTransformLayerDirectionType((JobsDirectionType)directionType);
        UIColor *displayColor = self.textColor ?: UIColor.clearColor;
        [self.superview layoutIfNeeded];
        [self layoutIfNeeded];
        if (JobsOCDSLRefreshLabelShapeLayer(self, displayColor, self.transformLayerDirectionType)) {
            if (!self.shapeLayer.superlayer) [self.layer addSublayer:self.shapeLayer];
            self.byTextCor(UIColor.clearColor);
        };return self;
    };
}

-(JobsRetLabelByImageBlock _Nonnull)bgImage{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UIImage *_Nullable image){
        @jobs_strongify(self)
        self.byBackgroundColor(image ? [UIColor colorWithPatternImage:image] : UIColor.clearColor);
        return self;
    };
}

-(JobsRetLabelByNSIntegerBlock _Nonnull)byNumberOfLines{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSInteger numberOfLines){
        @jobs_strongify(self)
        self.numberOfLines = numberOfLines;
        return self;
    };
}

-(JobsRetLabelByNSUIntegerBlock _Nonnull)makeLabelByShowingType{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UILabelShowingType labelShowingType){
        @jobs_strongify(self)
        [self.superview layoutIfNeeded];
        self.byLabelShowingType(labelShowingType);
        CGFloat width = CGRectGetWidth(self.bounds);
        CGFloat height = CGRectGetHeight(self.bounds);
        switch (labelShowingType){
            /// 处理 UILabelShowingType_01 分支
            case UILabelShowingType_01:{
                if (width && height) self.lineBreakMode = NSLineBreakByTruncatingMiddle;
            } break;
            /// 处理 UILabelShowingType_02 分支
            case UILabelShowingType_02:{
                if (width && height) self.lineBreakMode = NSLineBreakByTruncatingTail;
            } break;
            /// 处理 UILabelShowingType_03 分支
            case UILabelShowingType_03:{
                if (height) [self sizeToFit];
            } break;
            /// 处理 UILabelShowingType_04 分支
            case UILabelShowingType_04:{
                if (width && height) self.labelAutoFontByWidth();
            } break;
            /// 处理 UILabelShowingType_05 分支
            case UILabelShowingType_05:{
                if (width){
                    self.byNumberOfLines(0);
                    self.byLineBreakMode(NSLineBreakByWordWrapping);
                }
            } break;
            /// 未匹配已知分支时执行兜底处理
            default:
                break;
        };return self;
    };
}

-(JobsRetLabelByNSUIntegerBlock _Nonnull)byLabelShowingType{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSUInteger labelShowingType){
        @jobs_strongify(self)
        self.labelShowingType = (UILabelShowingType)labelShowingType;
        return self;
    };
}

-(JobsRetLabelByAttributedStringBlock _Nonnull)byAttributedString{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSAttributedString *_Nullable attributedString){
        @jobs_strongify(self)
        self.attributedText = attributedString;
        return self;
    };
}

-(JobsRetLabelByTextBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSString *_Nullable str){
        @jobs_strongify(self)
        self.text = str;
        return self;
    };
}

-(JobsRetLabelByTextBlock _Nonnull)byNextText{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSString *_Nullable str){
        @jobs_strongify(self)
        self.byText([(self.text ?: @"") stringByAppendingString:(str ?: @"")]);
        return self;
    };
}

-(JobsRetLabelByAttributedStringBlock _Nonnull)byNextAttributedText{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSAttributedString *_Nullable attributedString){
        @jobs_strongify(self)
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.text ?: @""];
        if (attributedString) [text appendAttributedString:attributedString];
        self.byAttributedString(text);
        return self;
    };
}

-(JobsRetLabelByAttributedStringBlock _Nonnull)byNextAttributedTextWithvalue{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSAttributedString *_Nullable attributedString){
        @jobs_strongify(self)
        NSMutableAttributedString *text = self.makeAttributedStringBySelfText();
        if (attributedString) [text appendAttributedString:attributedString];
        self.byAttributedString(text);
        return self;
    };
}

-(JobsRetLabelByLabelBlock _Nonnull)byLabelBlock{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(jobsByLabelBlock _Nullable block){
        @jobs_strongify(self)
        if (block) block(self);
        return self;
    };
}

-(JobsRetLabelByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.textColor = cor;
        return self;
    };
}

-(JobsRetLabelByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof UIFont *_Nullable font){
        @jobs_strongify(self)
        self.font = font;
        return self;
    };
}

-(JobsRetLabelByTextAlignmentBlock _Nonnull)byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSTextAlignment textAlignment){
        @jobs_strongify(self)
        self.textAlignment = textAlignment;
        return self;
    };
}

-(JobsRetUILabelByVibrancyBlock _Nonnull)byPreferredVibrancy API_AVAILABLE(ios(17.0), tvos(17.0), visionos(1.0)) API_UNAVAILABLE(watchos){
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UILabelVibrancy data){
        @jobs_strongify(self)
        self.preferredVibrancy = data;
        return self;
    };
}

-(JobsRetUILabelByLineBreakModeBlock _Nonnull)byLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSLineBreakMode data){
        @jobs_strongify(self)
        self.lineBreakMode = data;
        return self;
    };
}

-(JobsRetUILabelByUIColorBlock _Nonnull)byHighlightedTextColor{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.highlightedTextColor = data;
        return self;
    };
}

-(JobsRetUILabelByBOOLBlock _Nonnull)byHighlighted{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.highlighted = data;
        return self;
    };
}

-(JobsRetUILabelByBOOLBlock _Nonnull)byEnabled{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.enabled = data;
        return self;
    };
}

-(JobsRetUILabelByBOOLBlock _Nonnull)byAdjustsFontSizeToFitWidth{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.adjustsFontSizeToFitWidth = data;
        return self;
    };
}

-(JobsRetUILabelByBOOLBlock _Nonnull)byAdjustsFontForContentSizeCategory{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.adjustsFontForContentSizeCategory = data;
        return self;
    };
}

-(JobsRetUILabelByBaselineAdjustmentBlock _Nonnull)byBaselineAdjustment{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UIBaselineAdjustment data){
        @jobs_strongify(self)
        self.baselineAdjustment = data;
        return self;
    };
}

-(JobsRetUILabelByCGFloatBlock _Nonnull)byMinimumScaleFactor API_AVAILABLE(ios(6.0)){
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.minimumScaleFactor = data;
        return self;
    };
}

-(JobsRetUILabelByBOOLBlock _Nonnull)byAllowsDefaultTighteningForTruncation API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsDefaultTighteningForTruncation = data;
        return self;
    };
}

-(JobsRetUILabelByLineBreakStrategyBlock _Nonnull)byLineBreakStrategy API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos){
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSLineBreakStrategy data){
        @jobs_strongify(self)
        self.lineBreakStrategy = data;
        return self;
    };
}

-(JobsRetUILabelByCGFloatBlock _Nonnull)byPreferredMaxLayoutWidth API_AVAILABLE(ios(6.0)){
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.preferredMaxLayoutWidth = data;
        return self;
    };
}

-(JobsRetUILabelByBOOLBlock _Nonnull)byShowsExpansionTextWhenTruncated API_AVAILABLE(macCatalyst(15.0)) API_UNAVAILABLE(watchos){
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsExpansionTextWhenTruncated = data;
        return self;
    };
}

-(UILabel *)byAnimatedTextNumberFrom:(NSNumber *)start
                                step:(NSNumber *)step
                            duration:(NSTimeInterval)duration
                     minimumInterval:(NSTimeInterval)minimumInterval
                          completion:(jobsByVoidBlock)completion{
    JobsOCDSLAnimatedNumberStore *store = self.jobs_ocdslAnimatedNumberStore();
    store.byStart(start);
    store.step = step;
    store.byDuration(MAX(0, duration));
    store.minimumInterval = MAX(0.000001, minimumInterval);
    store.byCompletion(completion);
    return self;
}

-(JobsRetLabelByTextBlock _Nonnull)byStartAnimatedTextNumber{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSString *_Nullable text){
        @jobs_strongify(self)
        JobsOCDSLAnimatedNumberStore *store = self.jobs_ocdslAnimatedNumberStore();
        self.jobs_ocdslStopAnimatedNumberTimer();
        NSString *targetText = [text ?: @"" stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        NSNumber *targetNumber = JobsOCDSLAnimatedNumberValue(targetText);
        if (!targetNumber) {
            self.byText(text);
            if (store.completion) store.completion();
            return self;
        }
        NSNumber *fromNumber = store.start ?: JobsOCDSLAnimatedNumberValue(self.text ?: @"") ?: @0;
        double from = fromNumber.doubleValue;
        double target = targetNumber.doubleValue;
        if (fabs(from - target) < 0.0000001) {
            self.byText(text);
            if (store.completion) store.completion();
            return self;
        }
        NSInteger decimals = JobsOCDSLAnimatedNumberDecimals(targetText);
        NSTimeInterval interval = MAX(0.000001, store.minimumInterval);
        NSInteger ticks = MAX(1, (NSInteger)llround(store.duration / interval));
        double delta = target - from;
        double perTick = 0;
        if (store.step && fabs(store.step.doubleValue) > 0.0000001) {
            double stepAbs = fabs(store.step.doubleValue);
            perTick = delta > 0 ? stepAbs : -stepAbs;
        }else perTick = delta / (double)ticks;
        store.targetValue = target;
        store.currentValue = from;
        store.deltaPerTick = perTick;
        store.decimals = decimals;
        store.originalText = text ?: @"";
        self.byText(JobsOCDSLAnimatedNumberText(from, decimals));
        @jobs_weakify(self)
        JobsTimer *timer = jobsMakeTimer(^(__kindof JobsTimer * _Nullable timer) {
            timer.byTimerType(JobsTimerTypeGCD)
                .byTimerStyle(TimerStyle_clockwise)
                .byTimeInterval(interval)
                .byStartTime(0)
                .byTimeSecIntervalSinceDate(0)
                .byQueue(dispatch_get_main_queue())
                .byOnTick(^(CGFloat time) {
                    @jobs_strongify(self)
                    self.jobs_ocdslTickAnimatedNumber();
                });
        });
        store.byTimer(timer);
        timer.start();
        return self;
    };
}

-(JobsRetLabelByVoidBlock _Nonnull)byStopAnimatedTextNumber{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(void){
        @jobs_strongify(self)
        self.jobs_ocdslStopAnimatedNumberTimer();
        return self;
    };
}

-(JobsRetLabelByVoidBlock _Nonnull)labelAutoFontByWidth{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(void){
        @jobs_strongify(self)
        self.byAdjustsFontSizeToFitWidth(YES);
        return self;
    };
}

#pragma mark —— labelShowingType
JobsKey(_labelShowingType)
@dynamic labelShowingType;
-(UILabelShowingType)labelShowingType{
    return [Jobs_getAssociatedObject(_labelShowingType) integerValue];
}

-(void)setLabelShowingType:(UILabelShowingType)labelShowingType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_labelShowingType, @(labelShowingType))
}

#pragma mark —— value
JobsKey(_value)
@dynamic value;
-(CGFloat)value{
    return [Jobs_getAssociatedObject(_value) floatValue];
}

-(void)setValue:(CGFloat)value{
    Jobs_setAssociatedRETAIN_NONATOMIC(_value, @(value))
}

-(JobsRetUILabelByCGFloatBlock _Nonnull)byValue{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(CGFloat value){
        @jobs_strongify(self)
        self.value = value;
        return self;
    };
}

#pragma mark —— lastValue
JobsKey(_lastValue)
@dynamic lastValue;
-(CGFloat)lastValue{
    return [Jobs_getAssociatedObject(_lastValue) floatValue];
}

-(void)setLastValue:(CGFloat)lastValue{
    Jobs_setAssociatedRETAIN_NONATOMIC(_lastValue, @(lastValue))
}

-(JobsRetUILabelByCGFloatBlock _Nonnull)byLastValue{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(CGFloat lastValue){
        @jobs_strongify(self)
        self.lastValue = lastValue;
        return self;
    };
}

#pragma mark —— shapeLayer
JobsKey(_shapeLayer)
@dynamic shapeLayer;
-(CAShapeLayer *)shapeLayer{
    CAShapeLayer *shapeLayer = Jobs_getAssociatedObject(_shapeLayer);
    if (!shapeLayer){
        shapeLayer = CAShapeLayer.layer;
        shapeLayer.byFrame(self.bounds);
        shapeLayer.byContentsScale(UIScreen.mainScreen.scale);
        shapeLayer.byFillColor(self.textColor.CGColor);
        Jobs_setAssociatedRETAIN_NONATOMIC(_shapeLayer, shapeLayer)
    };return shapeLayer;
}

-(void)setShapeLayer:(CAShapeLayer *)shapeLayer{
    Jobs_setAssociatedRETAIN_NONATOMIC(_shapeLayer, shapeLayer)
}

#pragma mark —— transformLayerDirectionType
JobsKey(_transformLayerDirectionType)
@dynamic transformLayerDirectionType;
-(JobsDirectionType)transformLayerDirectionType{
    return [Jobs_getAssociatedObject(_transformLayerDirectionType) integerValue];
}

-(void)setTransformLayerDirectionType:(JobsDirectionType)transformLayerDirectionType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_transformLayerDirectionType, @(transformLayerDirectionType))
}

@end

@implementation UILabel (JobsOCDSLAnimatedNumber)
-(JobsRetJobsOCDSLAnimatedNumberStoreByVoidBlock _Nonnull)jobs_ocdslAnimatedNumberStore{
    @jobs_weakify(self)
    return ^JobsOCDSLAnimatedNumberStore *{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsOCDSLAnimatedNumberStore *store = Jobs_getAssociatedObject(_jobsOCDSLAnimatedNumberStore);
        if (!store) {
            store = JobsOCDSLAnimatedNumberStore.new;
            Jobs_setAssociatedRETAIN_NONATOMIC(_jobsOCDSLAnimatedNumberStore, store)
        };return store;
    };
}

-(jobsByVoidBlock _Nonnull)jobs_ocdslStopAnimatedNumberTimer{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsOCDSLAnimatedNumberStore *store = self.jobs_ocdslAnimatedNumberStore();
        store.timer.jobsStop();
        store.byTimer(nil);
    };
}

-(jobsByVoidBlock _Nonnull)jobs_ocdslTickAnimatedNumber{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsOCDSLAnimatedNumberStore *store = self.jobs_ocdslAnimatedNumberStore();
        if (!store.timer) return;
        double current = store.currentValue + store.deltaPerTick;
        store.byCurrentValue(current);
        BOOL reached = store.deltaPerTick > 0 ? current >= store.targetValue : current <= store.targetValue;
        if (reached) {
            self.byText(store.originalText);
            self.jobs_ocdslStopAnimatedNumberTimer();
            if (store.completion) store.completion();
            return;
        }
        self.byText(JobsOCDSLAnimatedNumberText(current, store.decimals));
    };
}

@end
