//
//  JobsMosaicBrushImageView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsMosaicBrushImageView.h"

@interface JobsMosaicBrushImageView ()

Prop_assign()CGPoint lastPaintPoint;
Prop_assign()BOOL hasLastPaintPoint;

-(void)handlePanGesture:(UIPanGestureRecognizer *)gesture;
-(void)emitPaintPointsFromPoint:(CGPoint)fromPoint
                        toPoint:(CGPoint)toPoint;

@end

@implementation JobsMosaicBrushImageView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self
            .byContentMode(UIViewContentModeScaleAspectFit)
            .byClipsToBounds(YES);
        self.brushEnabled = YES;
        UIPanGestureRecognizer *gesture = [UIPanGestureRecognizer.alloc initWithTarget:self
                                                                                action:@selector(handlePanGesture:)];
        [self addGestureRecognizer:gesture];
    };return self;
}

-(void)handlePanGesture:(UIPanGestureRecognizer *)gesture{
    if (!self.brushEnabled) return;
    CGPoint point = [gesture locationInView:self];
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.hasLastPaintPoint = YES;
        self.lastPaintPoint = point;
        [self emitPaintPointsFromPoint:point
                               toPoint:point];

    }else if (gesture.state == UIGestureRecognizerStateChanged){
        if (self.hasLastPaintPoint) {
            [self emitPaintPointsFromPoint:self.lastPaintPoint
                                   toPoint:point];
        }else{
            [self emitPaintPointsFromPoint:point
                                   toPoint:point];
        }
        self.hasLastPaintPoint = YES;
        self.lastPaintPoint = point;

    }else if (gesture.state == UIGestureRecognizerStateEnded ||
              gesture.state == UIGestureRecognizerStateCancelled ||
              gesture.state == UIGestureRecognizerStateFailed){
        self.hasLastPaintPoint = NO;
    }
}

-(void)emitPaintPointsFromPoint:(CGPoint)fromPoint
                        toPoint:(CGPoint)toPoint{
    CGFloat dx = toPoint.x - fromPoint.x;
    CGFloat dy = toPoint.y - fromPoint.y;
    CGFloat distance = hypot(dx, dy);
    NSInteger steps = MAX(1, (NSInteger)ceil(distance / 6.0));
    for (NSInteger index = 0; index <= steps; index++) {
        CGFloat progress = steps == 0 ? 1 : (CGFloat)index / (CGFloat)steps;
        CGPoint point = CGPointMake(fromPoint.x + dx * progress,
                                    fromPoint.y + dy * progress);
        [self.brushDelegate mosaicBrushImageView:self
                             didPaintAtViewPoint:point];
    }
}

@end
