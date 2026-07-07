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
    shapeLayer.contentsScale = UIScreen.mainScreen.scale;
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = displayColor.CGColor;
    shapeLayer.fillColor = displayColor.CGColor;
    shapeLayer.lineWidth = 0.5f;
    shapeLayer.lineJoin = kCALineJoinBevel;
    return YES;
}

@implementation UILabel (DSL)

-(__kindof NSMutableAttributedString *)makeAttributedStringBySelfText{
    NSString *text = self.text ?: @"";
    NSDictionary<NSAttributedStringKey, id> *attributes = @{
        NSForegroundColorAttributeName: self.textColor ?: UIColor.clearColor,
        NSFontAttributeName: self.font ?: [UIFont systemFontOfSize:UIFont.systemFontSize]
    };
    return [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
}

-(JobsRetLabelByNSIntegerBlock _Nonnull)transformLayer{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSInteger directionType){
        @jobs_strongify(self)
        self.transformLayerDirectionType = (JobsDirectionType)directionType;
        UIColor *displayColor = self.textColor ?: UIColor.clearColor;
        [self.superview layoutIfNeeded];
        [self layoutIfNeeded];
        if (JobsOCDSLRefreshLabelShapeLayer(self, displayColor, self.transformLayerDirectionType)) {
            if (!self.shapeLayer.superlayer) [self.layer addSublayer:self.shapeLayer];
            self.textColor = UIColor.clearColor;
        };return self;
    };
}

-(JobsRetLabelByImageBlock _Nonnull)bgImage{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(UIImage *_Nullable image){
        @jobs_strongify(self)
        self.backgroundColor = image ? [UIColor colorWithPatternImage:image] : UIColor.clearColor;

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
        self.labelShowingType = labelShowingType;
        CGFloat width = CGRectGetWidth(self.bounds);
        CGFloat height = CGRectGetHeight(self.bounds);
        switch (labelShowingType){
            case UILabelShowingType_01:{
                if (width && height) self.lineBreakMode = NSLineBreakByTruncatingMiddle;
            } break;
            case UILabelShowingType_02:{
                if (width && height) self.lineBreakMode = NSLineBreakByTruncatingTail;
            } break;
            case UILabelShowingType_03:{
                if (height) [self sizeToFit];
            } break;
            case UILabelShowingType_04:{
                if (width && height) self.labelAutoFontByWidth();
            } break;
            case UILabelShowingType_05:{
                if (width){
                    self.numberOfLines = 0;
                    self.lineBreakMode = NSLineBreakByWordWrapping;
                }
            } break;
            default:
                break;
        };return self;
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
        self.text = [(self.text ?: @"") stringByAppendingString:(str ?: @"")];
        return self;
    };
}

-(JobsRetLabelByAttributedStringBlock _Nonnull)byNextAttributedText{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSAttributedString *_Nullable attributedString){
        @jobs_strongify(self)
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.text ?: @""];
        if (attributedString) [text appendAttributedString:attributedString];
        self.attributedText = text;
        return self;
    };
}

-(JobsRetLabelByAttributedStringBlock _Nonnull)byNextAttributedTextWithvalue{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof NSAttributedString *_Nullable attributedString){
        @jobs_strongify(self)
        NSMutableAttributedString *text = self.makeAttributedStringBySelfText;
        if (attributedString) [text appendAttributedString:attributedString];
        self.attributedText = text;
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

-(JobsRetLabelByVoidBlock _Nonnull)labelAutoFontByWidth{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(void){
        @jobs_strongify(self)
        self.adjustsFontSizeToFitWidth = YES;
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

#pragma mark —— lastValue
JobsKey(_lastValue)
@dynamic lastValue;
-(CGFloat)lastValue{
    return [Jobs_getAssociatedObject(_lastValue) floatValue];
}

-(void)setLastValue:(CGFloat)lastValue{
    Jobs_setAssociatedRETAIN_NONATOMIC(_lastValue, @(lastValue))
}

#pragma mark —— shapeLayer
JobsKey(_shapeLayer)
@dynamic shapeLayer;
-(CAShapeLayer *)shapeLayer{
    CAShapeLayer *shapeLayer = Jobs_getAssociatedObject(_shapeLayer);
    if (!shapeLayer){
        shapeLayer = CAShapeLayer.layer;
        shapeLayer.frame = self.bounds;

        shapeLayer.contentsScale = UIScreen.mainScreen.scale;
        shapeLayer.fillColor = self.textColor.CGColor;
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
