//
//  IrregularBtn.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "IrregularBtn.h"

@interface IrregularBtn()
/// UI
Prop_strong()UIBezierPath *path;
Prop_strong()CAShapeLayer *shapLayer;

@end

static dispatch_once_t irregularBtnDispatchOnce;
@implementation IrregularBtn
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        irregularBtnDispatchOnce = 0;
    };return self;
}
// 绘制图形时添加path遮罩
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    dispatch_once(&irregularBtnDispatchOnce, ^{
        self.shapLayer.byHidden(NO);
    });
}
// 点击的覆盖方法，点击时判断点是否在path内，YES则响应，NO则不响应
- (BOOL)pointInside:(CGPoint)point
          withEvent:(UIEvent *)event{
    BOOL res = [super pointInside:point withEvent:event];
    if (res){
        if ([self.path containsPoint:point]){
            return YES;
        };return NO;
    };return NO;
}
#pragma mark —— lazyLoad
-(CAShapeLayer *)shapLayer{
    if (!_shapLayer) {
        @jobs_weakify(self)
        self.layer.byMask(_shapLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            layer.byPath(self.path.CGPath);
        }));
    };return _shapLayer;
}

-(UIBezierPath *)path{
    if (!_path) {
        _path = UIBezierPath.bezierPath;
        for (int i = 0; i < self.pointMutArr.count; i++) {
            CGPoint retrievedPoint = self.pointMutArr[i].CGPointValue;
            if (i == 0) {
                [_path moveToPoint:retrievedPoint];
            }else
                [_path addLineToPoint:retrievedPoint];
        }
        [_path closePath];
    };return _path;
}

-(NSMutableArray<NSValue *> *)pointMutArr{
    if (!_pointMutArr) {
        _pointMutArr = NSMutableArray.array;
    };return _pointMutArr;
}

@end
