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
-(jobsByPanGestureRecognizerBlock _Nonnull)jobsHandlePanGesture;
-(void)emitPaintPointsFromPoint:(CGPoint)fromPoint
                        toPoint:(CGPoint)toPoint;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsMosaicBrushImageView
@interface JobsMosaicBrushImageView (JobsPropertyDSLSetterAutogen_4fbe7e7959)
-(void)setBrushDelegate:(id <JobsMosaicBrushImageViewDelegate> _Nullable)data;
-(void)setBrushEnabled:(BOOL)data;
-(void)setHasLastPaintPoint:(BOOL)data;
-(void)setLastPaintPoint:(CGPoint)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsMosaicBrushImageView

@implementation JobsMosaicBrushImageView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byUserInteractionEnabled(YES);
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
    jobsByPanGestureRecognizerBlock action = ((jobsByPanGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMosaicBrushImageView.class, @selector(jobsHandlePanGesture)))(self, @selector(jobsHandlePanGesture));
    if (action) action(gesture);
}

-(jobsByPanGestureRecognizerBlock _Nonnull)jobsHandlePanGesture{
    @jobs_weakify(self)
    return ^(UIPanGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.brushEnabled) return;
        CGPoint point = [gesture locationInView:self];
        if (gesture.state == UIGestureRecognizerStateBegan) {
            self.byHasLastPaintPoint(YES);
            self.byLastPaintPoint(point);
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
            self.byHasLastPaintPoint(YES);
            self.byLastPaintPoint(point);
        }else if (gesture.state == UIGestureRecognizerStateEnded ||
                  gesture.state == UIGestureRecognizerStateCancelled ||
                  gesture.state == UIGestureRecognizerStateFailed){
            self.byHasLastPaintPoint(NO);
        }
    };
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsMosaicBrushImageView
-(JobsRetJobsMosaicBrushImageViewByBOOLBlock _Nonnull)byBrushEnabled{
    @jobs_weakify(self)
    return ^__kindof JobsMosaicBrushImageView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setBrushEnabled:data];
        return self;
    };
}

-(JobsRetJobsMosaicBrushImageViewByBOOLBlock _Nonnull)byHasLastPaintPoint{
    @jobs_weakify(self)
    return ^__kindof JobsMosaicBrushImageView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setHasLastPaintPoint:data];
        return self;
    };
}

-(JobsRetJobsMosaicBrushImageViewByCGPointBlock _Nonnull)byLastPaintPoint{
    @jobs_weakify(self)
    return ^__kindof JobsMosaicBrushImageView * _Nullable(CGPoint data){
        @jobs_strongify(self)
        [self setLastPaintPoint:data];
        return self;
    };
}
-(JobsRetJobsMosaicBrushImageViewByIDJobsMosaicBrushImageViewDelegateBlock _Nonnull)byBrushDelegate{
    @jobs_weakify(self)
    return ^__kindof JobsMosaicBrushImageView * _Nullable(id <JobsMosaicBrushImageViewDelegate> _Nullable data){
        @jobs_strongify(self)
        [self setBrushDelegate:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsMosaicBrushImageView
@end
