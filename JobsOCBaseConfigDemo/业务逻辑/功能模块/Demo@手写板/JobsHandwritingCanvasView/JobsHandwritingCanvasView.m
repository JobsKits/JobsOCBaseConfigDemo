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

-(jobsByVoidBlock _Nonnull)commonInit;
-(JobsRetCAShapeLayerByVoidBlock _Nonnull)makeStrokeLayer;
-(jobsByVoidBlock _Nonnull)rebuildStrokeLayers;
-(jobsByVoidBlock _Nonnull)updateLatestStrokeLayer;
-(JobsRetUIBezierPathByNSArrayNSValueBlock _Nonnull)pathForStroke;
-(JobsRetCGPointByCGPointBlock _Nonnull)denormalizedPoint;
-(CGPoint)normalizedPointForViewPoint:(CGPoint)viewPoint
                               valid:(BOOL *)valid;
-(JobsRetBOOLByPointBlock _Nonnull)shouldAppendNormalizedPoint;
-(jobsByUITouchBlock _Nonnull)appendFinalTouch;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsHandwritingCanvasView
@interface JobsHandwritingCanvasView (JobsPropertyDSLSetterAutogen_eeb49add24)
-(void)setLastLayoutSize:(CGSize)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsHandwritingCanvasView

@implementation JobsHandwritingCanvasView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.commonInit();
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.commonInit();
    };return self;
}

-(jobsByVoidBlock _Nonnull)commonInit{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self
            .byMultipleTouchEnabled(NO)
            .byExclusiveTouch(YES)
            .byUserInteractionEnabled(YES);
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsHandwritingCanvasView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        if (CGSizeEqualToSize(self.bounds.size, self.lastLayoutSize)) return;
        self.byLastLayoutSize(self.bounds.size);
        self.rebuildStrokeLayers();
    };
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
    CAShapeLayer *strokeLayer = self.makeStrokeLayer();
    [self.strokeLayerMutArr addObject:strokeLayer];
    self.layer.byAddSublayer(strokeLayer);
    self.updateLatestStrokeLayer();
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
        if (!valid || !self.shouldAppendNormalizedPoint(point)) continue;
        [self.strokePointMutArr.lastObject addObject:[NSValue valueWithCGPoint:point]];
        appendedPoint = YES;
    }
    if (!appendedPoint) return;
    self.updateLatestStrokeLayer();
    if (self.contentDidChange) self.contentDidChange();
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [super touchesEnded:touches
              withEvent:event];
    self.appendFinalTouch(touches.anyObject);
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches
              withEvent:(UIEvent *)event{
    [super touchesCancelled:touches
                  withEvent:event];
    self.appendFinalTouch(touches.anyObject);
}

-(BOOL)hasStrokes{
    return self.strokePointMutArr.count > 0;
}

-(JobsRetIDByVoidBlocks _Nonnull)byContentDidChange{
    @jobs_weakify(self)
    return ^id(jobsByVoidBlock contentDidChange){
        @jobs_strongify(self)
        if (!self) return nil;
        self.contentDidChange = contentDidChange;
        return self;
    };
}

-(jobsByNSArrayNSArrayNSDictionaryNSStringNSNumberBlock _Nonnull)replaceNormalizedStrokes{
    @jobs_weakify(self)
    return ^(NSArray <NSArray <NSDictionary <NSString *, NSNumber *>*>*>* strokes){
        @jobs_strongify(self)
        if (!self) return;
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
        self.rebuildStrokeLayers();
    };
}

-(JobsRetNSArrayNSArrayNSDictionaryNSStringNSNumberByVoidBlock _Nonnull)normalizedStrokes{
    @jobs_weakify(self)
    return ^NSArray <NSArray <NSDictionary <NSString *, NSNumber *>*>*>*{
        @jobs_strongify(self)
        if (!self) return nil;
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
    };
}

-(jobsByVoidBlock _Nonnull)clearCanvas{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.hasStrokes) return;
        [self.strokePointMutArr removeAllObjects];
        for (CAShapeLayer *strokeLayer in self.strokeLayerMutArr) {
            strokeLayer.byRemoveFromSuperlayer();
        }
        [self.strokeLayerMutArr removeAllObjects];
        if (self.contentDidChange) self.contentDidChange();
    };
}
#pragma mark —— Private
-(JobsRetCAShapeLayerByVoidBlock _Nonnull)makeStrokeLayer{
    @jobs_weakify(self)
    return ^CAShapeLayer *{
        @jobs_strongify(self)
        if (!self) return nil;
            return jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
                layer
                    .byFillColorUIColor(JobsClearColor)
                    .byStrokeColorUIColor(JobsBlackColor)
                    .byLineWidth(JobsWidth(4))
                    .byLineCap(kCALineCapRound)
                    .byLineJoin(kCALineJoinRound)
                    .byFrame(self.bounds);
            });
    };
}

-(jobsByVoidBlock _Nonnull)rebuildStrokeLayers{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (CAShapeLayer *strokeLayer in self.strokeLayerMutArr) {
            strokeLayer.byRemoveFromSuperlayer();
        }
        [self.strokeLayerMutArr removeAllObjects];
        for (NSArray <NSValue *>*stroke in self.strokePointMutArr) {
            CAShapeLayer *strokeLayer = self.makeStrokeLayer();
            [self.strokeLayerMutArr addObject:strokeLayer];
            self.layer.byAddSublayer(strokeLayer);
            strokeLayer.byPath(self.pathForStroke(stroke).CGPath);
        }
    };
}

-(jobsByVoidBlock _Nonnull)updateLatestStrokeLayer{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSArray <NSValue *>*stroke = self.strokePointMutArr.lastObject;
        CAShapeLayer *strokeLayer = self.strokeLayerMutArr.lastObject;
        if (!stroke || !strokeLayer) return;
        strokeLayer.byPath(self.pathForStroke(stroke).CGPath);
    };
}

-(JobsRetUIBezierPathByNSArrayNSValueBlock _Nonnull)pathForStroke{
    @jobs_weakify(self)
    return ^UIBezierPath *(NSArray <NSValue *>* stroke){
        @jobs_strongify(self)
        if (!self) return nil;
        UIBezierPath *path = jobsMakeBezierPath(nil);
        if (!stroke.count) return path;
        CGPoint startPoint = self.denormalizedPoint(stroke.firstObject.CGPointValue);
        path.byMoveToPoint(startPoint);
        if (stroke.count == 1) {
            path.byAddLineToPoint(CGPointMake(startPoint.x + 0.1,
                                             startPoint.y));
        } else {
            for (NSValue *pointValue in [stroke subarrayWithRange:NSMakeRange(1,
                                                                              stroke.count - 1)]) {
                path.byAddLineToPoint(self.denormalizedPoint(pointValue.CGPointValue));
            }
        };return path;
    };
}

-(JobsRetCGPointByCGPointBlock _Nonnull)denormalizedPoint{
    @jobs_weakify(self)
    return ^CGPoint(CGPoint point){
        @jobs_strongify(self)
        if (!self) return (CGPoint){0};
        return CGPointMake(point.x * CGRectGetWidth(self.bounds),
                           point.y * CGRectGetHeight(self.bounds));
    };
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

-(JobsRetBOOLByPointBlock _Nonnull)shouldAppendNormalizedPoint{
    @jobs_weakify(self)
    return ^BOOL(CGPoint point){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSValue *lastPointValue = self.strokePointMutArr.lastObject.lastObject;
        if (!lastPointValue) return YES;
        CGPoint lastPoint = lastPointValue.CGPointValue;
        return hypot(point.x - lastPoint.x,
                     point.y - lastPoint.y) > 0.001;
    };
}

-(jobsByUITouchBlock _Nonnull)appendFinalTouch{
    @jobs_weakify(self)
    return ^(UITouch * touch){
        @jobs_strongify(self)
        if (!self) return;
        if (!touch || !self.strokePointMutArr.count) return;
        BOOL valid = NO;
        CGPoint point = [self normalizedPointForViewPoint:[touch locationInView:self]
                                                   valid:&valid];
        if (!valid || !self.shouldAppendNormalizedPoint(point)) return;
        [self.strokePointMutArr.lastObject addObject:[NSValue valueWithCGPoint:point]];
        self.updateLatestStrokeLayer();
        if (self.contentDidChange) self.contentDidChange();
    };
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsHandwritingCanvasView
-(JobsRetJobsHandwritingCanvasViewByCGSizeBlock _Nonnull)byLastLayoutSize{
    @jobs_weakify(self)
    return ^__kindof JobsHandwritingCanvasView * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setLastLayoutSize:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsHandwritingCanvasView
@end
