//
//  JobsCoreTextScrollLayer.m
//  JobsOCBaseConfigDemo
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

@end

@implementation JobsCoreTextScrollLayer

-(instancetype)init{
    if (self = [super init]) [self prepareLayer];
    return self;
}

-(instancetype)initWithLayer:(id)layer{
    if (self = [super initWithLayer:layer]) {
        [self prepareLayer];
        if ([layer isKindOfClass:JobsCoreTextScrollLayer.class]) {
            JobsCoreTextScrollLayer *sourceLayer = layer;
            self.textLine = sourceLayer.textLine ? CFRetain(sourceLayer.textLine) : NULL;
            self.lineOriginX = sourceLayer.lineOriginX;
            self.baselineY = sourceLayer.baselineY;
            self.duplicateOriginX = sourceLayer.duplicateOriginX;
            self.textWidth = sourceLayer.textWidth;
        }
    };return self;
}

-(void)dealloc{
    if (_textLine) CFRelease(_textLine);
}

-(void)prepareLayer{
    self.contentsScale = UIScreen.mainScreen.scale;
    self.drawsAsynchronously = YES;
    self.needsDisplayOnBoundsChange = YES;
    self.anchorPoint = CGPointZero;
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
    self.textLine = line;
    self.lineOriginX = -minimumX;
    self.baselineY = MAX(0, (normalizedHeight - ascent - descent) * 0.5 + descent);
    self.textWidth = ceil(MAX(0, maximumX - minimumX));

    if (duplicateSpacing) {
        self.duplicateOriginX = @(self.lineOriginX + self.textWidth + MAX(0, duplicateSpacing.doubleValue));
    }else{
        self.duplicateOriginX = nil;
    }
    CGFloat canvasWidth = self.duplicateOriginX ? self.duplicateOriginX.doubleValue + self.textWidth : self.textWidth;
    self.bounds = CGRectMake(0, 0, ceil(canvasWidth), normalizedHeight);
    self.position = CGPointZero;
    [self setNeedsDisplay];
}

-(void)drawInContext:(CGContextRef)context{
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
}

@end
