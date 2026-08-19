//
//  JobsCoreTextScrollLayer.m
//  JobsOCUILabelScrolling
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#import "JobsCoreTextScrollLayer.h"

@interface JobsCoreTextScrollLayer ()

Prop_assign()CTLineRef textLine;
Prop_assign()CGFloat lineOriginX;
Prop_assign()CGFloat baselineY;
Prop_strong(nullable)NSNumber *duplicateOriginX;
Prop_assign(readwrite)CGFloat textWidth;
Prop_assign(readwrite)CGFloat textLayoutWidth;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsCoreTextScrollLayer
@interface JobsCoreTextScrollLayer (JobsPropertyDSLSetterAutogen_0c786b773f)
-(void)setBaselineY:(CGFloat)data;
-(void)setDuplicateOriginX:(NSNumber * _Nullable)data;
-(void)setLineOriginX:(CGFloat)data;
-(void)setTextLayoutWidth:(CGFloat)data;
-(void)setTextLine:(CTLineRef)data;
-(void)setTextWidth:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsCoreTextScrollLayer

@implementation JobsCoreTextScrollLayer

-(instancetype)init{
    if (self = [super init]) self.prepareLayer();
    return self;
}

-(instancetype)initWithLayer:(id)layer{
    if (self = [super initWithLayer:layer]) {
        self.prepareLayer();
        if ([layer isKindOfClass:JobsCoreTextScrollLayer.class]) {
            JobsCoreTextScrollLayer *sourceLayer = layer;
            self.textLine = sourceLayer.textLine ? CFRetain(sourceLayer.textLine) : NULL;
            self.lineOriginX = sourceLayer.lineOriginX;
            self.baselineY = sourceLayer.baselineY;
            self.duplicateOriginX = sourceLayer.duplicateOriginX;
            self.textWidth = sourceLayer.textWidth;
            self.textLayoutWidth = sourceLayer.textLayoutWidth;
        }
    };return self;
}

-(void)dealloc{
    if (_textLine) CFRelease(_textLine);
}

-(jobsByVoidBlock _Nonnull)prepareLayer{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byContentsScale(UIScreen.mainScreen.scale);
        self.byDrawsAsynchronously(YES);
        self.byNeedsDisplayOnBoundsChange(YES);
        self.byAnchorPoint(CGPointZero);
    };
}

-(void)updateWithAttributedText:(NSAttributedString *)attributedText
                         height:(CGFloat)height
               duplicateSpacing:(NSNumber *)duplicateSpacing{
    CTLineRef line = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)attributedText);
    CGFloat ascent = 0;
    CGFloat descent = 0;
    CGFloat leading = 0;
    CGFloat typographicWidth = (CGFloat)CTLineGetTypographicBounds(line,
                                                                   &ascent,
                                                                   &descent,
                                                                   &leading);
    CGRect glyphBounds = CTLineGetBoundsWithOptions(line,
                                                     kCTLineBoundsUseOpticalBounds |
                                                     kCTLineBoundsIncludeLanguageExtents);
    CGFloat minimumX = MIN(0, CGRectGetMinX(glyphBounds));
    CGFloat maximumX = MAX(typographicWidth, CGRectGetMaxX(glyphBounds));
    CGFloat normalizedHeight = MAX(0, height);

    if (_textLine) CFRelease(_textLine);
    self.byTextLine(line);
    self.byLineOriginX(-minimumX);
    self.byBaselineY(MAX(0, (normalizedHeight - ascent - descent) * 0.5 + descent));
    self.byTextLayoutWidth(MAX(0, typographicWidth));
    self.byTextWidth(ceil(MAX(0, maximumX - minimumX)));

    if (duplicateSpacing) {
        self.byDuplicateOriginX(@(self.lineOriginX + self.textWidth + MAX(0, duplicateSpacing.doubleValue)));
    }else{
        self.byDuplicateOriginX(nil);
    }
    CGFloat canvasWidth = self.duplicateOriginX ? self.duplicateOriginX.doubleValue + self.textWidth : self.textWidth;
    self.byBounds(CGRectMake(0, 0, ceil(canvasWidth), normalizedHeight));
    self.byPosition(CGPointZero);
    [self setNeedsDisplay];
}

-(void)drawInContext:(CGContextRef)context{
    ((((jobsByCGContextRefBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCoreTextScrollLayer.class, @selector(drawInContext)))(self, @selector(drawInContext))))(context);
}
-(jobsByCGContextRefBlock _Nonnull)drawInContext{
    @jobs_weakify(self)
    return ^(CGContextRef context){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.textLine) return;
        CGContextSaveGState(context);
        CGContextSetShouldAntialias(context, YES);
        CGContextSetShouldSmoothFonts(context, YES);
        CGContextSetTextMatrix(context, CGAffineTransformIdentity);
        CGContextTranslateCTM(context, 0, CGRectGetHeight(self.bounds));
        CGContextScaleCTM(context, 1, -1);
        CGContextSetTextPosition(context, self.lineOriginX, self.baselineY);
        CTLineDraw(self.textLine, context);
        if (self.duplicateOriginX) {
            CGContextSetTextPosition(context,
                                     self.duplicateOriginX.doubleValue,
                                     self.baselineY);
            CTLineDraw(self.textLine, context);
        }
        CGContextRestoreGState(context);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsCoreTextScrollLayer
-(JobsRetJobsCoreTextScrollLayerByCGFloatBlock _Nonnull)byBaselineY{
    @jobs_weakify(self)
    return ^__kindof JobsCoreTextScrollLayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBaselineY:data];
        return self;
    };
}

-(JobsRetJobsCoreTextScrollLayerByCGFloatBlock _Nonnull)byLineOriginX{
    @jobs_weakify(self)
    return ^__kindof JobsCoreTextScrollLayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setLineOriginX:data];
        return self;
    };
}

-(JobsRetJobsCoreTextScrollLayerByCGFloatBlock _Nonnull)byTextLayoutWidth{
    @jobs_weakify(self)
    return ^__kindof JobsCoreTextScrollLayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setTextLayoutWidth:data];
        return self;
    };
}

-(JobsRetJobsCoreTextScrollLayerByCGFloatBlock _Nonnull)byTextWidth{
    @jobs_weakify(self)
    return ^__kindof JobsCoreTextScrollLayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setTextWidth:data];
        return self;
    };
}

-(JobsRetJobsCoreTextScrollLayerByCTLineRefBlock _Nonnull)byTextLine{
    @jobs_weakify(self)
    return ^__kindof JobsCoreTextScrollLayer * _Nullable(CTLineRef data){
        @jobs_strongify(self)
        [self setTextLine:data];
        return self;
    };
}

-(JobsRetJobsCoreTextScrollLayerByNSNumberBlock _Nonnull)byDuplicateOriginX{
    @jobs_weakify(self)
    return ^__kindof JobsCoreTextScrollLayer * _Nullable(NSNumber * _Nullable data){
        @jobs_strongify(self)
        [self setDuplicateOriginX:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsCoreTextScrollLayer
@end
