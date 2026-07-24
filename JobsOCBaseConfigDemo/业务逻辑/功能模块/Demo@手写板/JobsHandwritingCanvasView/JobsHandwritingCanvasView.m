//
//  JobsHandwritingCanvasView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsHandwritingCanvasView.h"

@interface JobsHandwritingCanvasView ()

Prop_strong()NSMutableArray <NSMutableArray <NSValue *>*>*strokePointMutArr;
Prop_strong()NSMutableArray <CAShapeLayer *>*strokeLayerMutArr;
Prop_copy(nullable)jobsByVoidBlock contentDidChange;
Prop_assign()CGSize lastLayoutSize;

-(void)commonInit;
-(CAShapeLayer *)makeStrokeLayer;
-(void)rebuildStrokeLayers;
-(void)updateLatestStrokeLayer;
-(UIBezierPath *)pathForStroke:(NSArray <NSValue *>*)stroke;
-(CGPoint)denormalizedPoint:(CGPoint)point;
-(CGPoint)normalizedPointForViewPoint:(CGPoint)viewPoint
                               valid:(BOOL *)valid;
-(BOOL)shouldAppendNormalizedPoint:(CGPoint)point;
-(void)appendFinalTouch:(nullable UITouch *)touch;

@end

@implementation JobsHandwritingCanvasView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self commonInit];
    };return self;
}

-(void)commonInit{
    self
        .byMultipleTouchEnabled(NO)
        .byExclusiveTouch(YES)
        .byUserInteractionEnabled(YES);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (CGSizeEqualToSize(self.bounds.size, self.lastLayoutSize)) return;
    self.lastLayoutSize = self.bounds.size;
    [self rebuildStrokeLayers];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [super touchesBegan:touches
              withEvent:event];
    BOOL valid = NO;
    CGPoint point = [self normalizedPointForViewPoint:[touches.anyObject locationInView:self]
                                               valid:&valid];
    if (!valid) return;
    [self.strokePointMutArr addObject:[NSMutableArray arrayWithObject:[NSValue valueWithCGPoint:point]]];
    CAShapeLayer *strokeLayer = [self makeStrokeLayer];
    [self.strokeLayerMutArr addObject:strokeLayer];
    self.layer.byAddSublayer(strokeLayer);
    [self updateLatestStrokeLayer];
    if (self.contentDidChange) self.contentDidChange();
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [super touchesMoved:touches
              withEvent:event];
    UITouch *touch = touches.anyObject;
    if (!touch || !self.strokePointMutArr.count) return;
    NSArray <UITouch *>*coalescedTouches = [event coalescedTouchesForTouch:touch] ?: @[touch];
    BOOL appendedPoint = NO;
    for (UITouch *coalescedTouch in coalescedTouches) {
        BOOL valid = NO;
        CGPoint point = [self normalizedPointForViewPoint:[coalescedTouch locationInView:self]
                                                   valid:&valid];
        if (!valid || ![self shouldAppendNormalizedPoint:point]) continue;
        [self.strokePointMutArr.lastObject addObject:[NSValue valueWithCGPoint:point]];
        appendedPoint = YES;
    }
    if (!appendedPoint) return;
    [self updateLatestStrokeLayer];
    if (self.contentDidChange) self.contentDidChange();
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [super touchesEnded:touches
              withEvent:event];
    [self appendFinalTouch:touches.anyObject];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches
              withEvent:(UIEvent *)event{
    [super touchesCancelled:touches
                  withEvent:event];
    [self appendFinalTouch:touches.anyObject];
}

-(BOOL)hasStrokes{
    return self.strokePointMutArr.count > 0;
}

-(instancetype)byContentDidChange:(jobsByVoidBlock)contentDidChange{
    self.contentDidChange = contentDidChange;
    return self;
}

-(void)replaceNormalizedStrokes:(NSArray <NSArray <NSDictionary <NSString *, NSNumber *>*>*>*)strokes{
    [self.strokePointMutArr removeAllObjects];
    for (id strokeObject in strokes) {
        if (![strokeObject isKindOfClass:NSArray.class]) continue;
        NSMutableArray <NSValue *>*strokePointMutArr = NSMutableArray.array;
        for (id pointObject in (NSArray *)strokeObject) {
            if (![pointObject isKindOfClass:NSDictionary.class]) continue;
            NSNumber *x = ((NSDictionary *)pointObject)[@"x"];
            NSNumber *y = ((NSDictionary *)pointObject)[@"y"];
            if (![x isKindOfClass:NSNumber.class] ||
                ![y isKindOfClass:NSNumber.class] ||
                x.doubleValue < 0 ||
                x.doubleValue > 1 ||
                y.doubleValue < 0 ||
                y.doubleValue > 1) continue;
            [strokePointMutArr addObject:[NSValue valueWithCGPoint:CGPointMake(x.doubleValue,
                                                                              y.doubleValue)]];
        }
        if (strokePointMutArr.count) [self.strokePointMutArr addObject:strokePointMutArr];
    }
    [self rebuildStrokeLayers];
}

-(NSArray <NSArray <NSDictionary <NSString *, NSNumber *>*>*>*)normalizedStrokes{
    NSMutableArray <NSArray <NSDictionary <NSString *, NSNumber *>*>*>*strokeMutArr = NSMutableArray.array;
    for (NSArray <NSValue *>*stroke in self.strokePointMutArr) {
        NSMutableArray <NSDictionary <NSString *, NSNumber *>*>*pointMutArr = NSMutableArray.array;
        for (NSValue *pointValue in stroke) {
            CGPoint point = pointValue.CGPointValue;
            [pointMutArr addObject:@{
                @"x": @(point.x),
                @"y": @(point.y)
            }];
        }
        if (pointMutArr.count) [strokeMutArr addObject:pointMutArr.copy];
    };return strokeMutArr.copy;
}

-(void)clearCanvas{
    if (!self.hasStrokes) return;
    [self.strokePointMutArr removeAllObjects];
    for (CAShapeLayer *strokeLayer in self.strokeLayerMutArr) {
        strokeLayer.byRemoveFromSuperlayer();
    }
    [self.strokeLayerMutArr removeAllObjects];
    if (self.contentDidChange) self.contentDidChange();
}
#pragma mark —— Private
-(CAShapeLayer *)makeStrokeLayer{
	    return jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
	        layer
	            .byFillColorUIColor(JobsClearColor)
	            .byStrokeColorUIColor(JobsBlackColor)
	            .byLineWidth(JobsWidth(4))
	            .byLineCap(kCALineCapRound)
	            .byLineJoin(kCALineJoinRound)
	            .byFrame(self.bounds);
	    });
	}

-(void)rebuildStrokeLayers{
    for (CAShapeLayer *strokeLayer in self.strokeLayerMutArr) {
        strokeLayer.byRemoveFromSuperlayer();
    }
    [self.strokeLayerMutArr removeAllObjects];
    for (NSArray <NSValue *>*stroke in self.strokePointMutArr) {
        CAShapeLayer *strokeLayer = [self makeStrokeLayer];
        [self.strokeLayerMutArr addObject:strokeLayer];
        self.layer.byAddSublayer(strokeLayer);
        strokeLayer.byPath([self pathForStroke:stroke].CGPath);
    }
}

-(void)updateLatestStrokeLayer{
    NSArray <NSValue *>*stroke = self.strokePointMutArr.lastObject;
    CAShapeLayer *strokeLayer = self.strokeLayerMutArr.lastObject;
    if (!stroke || !strokeLayer) return;
    strokeLayer.byPath([self pathForStroke:stroke].CGPath);
}

-(UIBezierPath *)pathForStroke:(NSArray <NSValue *>*)stroke{
    UIBezierPath *path = jobsMakeBezierPath(nil);
    if (!stroke.count) return path;
    CGPoint startPoint = [self denormalizedPoint:stroke.firstObject.CGPointValue];
    path.byMoveToPoint(startPoint);
    if (stroke.count == 1) {
        path.byAddLineToPoint(CGPointMake(startPoint.x + 0.1,
                                         startPoint.y));
    } else {
        for (NSValue *pointValue in [stroke subarrayWithRange:NSMakeRange(1,
                                                                          stroke.count - 1)]) {
            path.byAddLineToPoint([self denormalizedPoint:pointValue.CGPointValue]);
        }
    };return path;
}

-(CGPoint)denormalizedPoint:(CGPoint)point{
    return CGPointMake(point.x * CGRectGetWidth(self.bounds),
                       point.y * CGRectGetHeight(self.bounds));
}

-(CGPoint)normalizedPointForViewPoint:(CGPoint)viewPoint
                               valid:(BOOL *)valid{
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    BOOL pointValid = width > 0 && height > 0;
    if (valid) *valid = pointValid;
    if (!pointValid) return CGPointZero;
    return CGPointMake(MIN(MAX(viewPoint.x / width, 0), 1),
                       MIN(MAX(viewPoint.y / height, 0), 1));
}

-(BOOL)shouldAppendNormalizedPoint:(CGPoint)point{
    NSValue *lastPointValue = self.strokePointMutArr.lastObject.lastObject;
    if (!lastPointValue) return YES;
    CGPoint lastPoint = lastPointValue.CGPointValue;
    return hypot(point.x - lastPoint.x,
                 point.y - lastPoint.y) > 0.001;
}

-(void)appendFinalTouch:(UITouch *)touch{
    if (!touch || !self.strokePointMutArr.count) return;
    BOOL valid = NO;
    CGPoint point = [self normalizedPointForViewPoint:[touch locationInView:self]
                                               valid:&valid];
    if (!valid || ![self shouldAppendNormalizedPoint:point]) return;
    [self.strokePointMutArr.lastObject addObject:[NSValue valueWithCGPoint:point]];
    [self updateLatestStrokeLayer];
    if (self.contentDidChange) self.contentDidChange();
}
#pragma mark —— LazyLoad
-(NSMutableArray<NSMutableArray<NSValue *> *> *)strokePointMutArr{
    if (!_strokePointMutArr) {
        _strokePointMutArr = NSMutableArray.array;
    };return _strokePointMutArr;
}

-(NSMutableArray<CAShapeLayer *> *)strokeLayerMutArr{
    if (!_strokeLayerMutArr) {
        _strokeLayerMutArr = NSMutableArray.array;
    };return _strokeLayerMutArr;
}

@end
