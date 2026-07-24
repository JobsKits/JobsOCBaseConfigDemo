//
//  UIView+Extra.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+Extra.h"

@implementation UIView (JobsBaseUIExtra)
+(JobsRetViewByFrameBlock _Nonnull)initByFrame{
    return ^__kindof UIView *_Nullable(CGRect data){
        return [UIView.alloc initWithFrame:data];
    };
}
/// 描边：统一设置Layer的线宽+颜色+圆切角（不一定切角）
-(JobsRetViewByLocationModelBlock _Nonnull)layerBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof JobsLocationModel *_Nullable data){
        @jobs_strongify(self)
        self.layer.borderColor = data.layerCor.CGColor;
        self.layer.borderWidth = data.jobsWidth;
        self.layer.cornerRadius = data.cornerRadiusValue;
        self.layer.masksToBounds = data.masksToBounds;
        return self;
    };
}
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".cor).layerByBorderWidth(1);
-(JobsRetViewByCorBlock _Nonnull)layerByBorderCor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable layerBorderCor) {
        @jobs_strongify(self)
        self.layer.borderColor = layerBorderCor.CGColor;
        return self;
    };
}
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".cor).layerByBorderWidth(1);
-(JobsRetViewByFloatBlock _Nonnull)layerByBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float borderWidth) {
        @jobs_strongify(self)
        self.layer.borderWidth = borderWidth;
        return self;
    };
}
/// 切整个View的4个角为统一的切角参数
-(JobsRetViewByFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float cornerRadiusValue) {
        @jobs_strongify(self)
        self.layer.cornerRadius = cornerRadiusValue;
        self.layer.masksToBounds = YES;
        return self;
    };
}
/// 指定圆切角
/// ⚠️这种写法存在一定的弊端：如果在某个View上添加子View，并对这个View使用如下方法的圆切角，则这个View上的子视图不可见⚠️
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii{
    // 设置切哪个直角
    //    UIRectCornerTopLeft     = 1 << 0,  左上角
    //    UIRectCornerTopRight    = 1 << 1,  右上角
    //    UIRectCornerBottomLeft  = 1 << 2,  左下角
    //    UIRectCornerBottomRight = 1 << 3,  右下角
    //    UIRectCornerAllCorners  = ~0UL     全部角
    /// 得到view的遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:cornerRadii];
    @jobs_weakify(self)
    self.layer.mask = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable data) {
        @jobs_strongify(self)
        data.byFrame(self.bounds);
        data.path = maskPath.CGPath;
    });
}

-(JobsRetViewByGestureRecognizer _Nonnull)addGesture{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIGestureRecognizer *_Nonnull gesture) {
        @jobs_strongify(self)
        if(gesture) self.addGestureRecognizer(gesture);
        return self;
    };
}

-(JobsRetGestureByGesture _Nonnull)addGestureRecognizer{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(__kindof UIGestureRecognizer *_Nullable gesture) {
        @jobs_strongify(self)
        if(gesture) [self addGestureRecognizer:gesture];
        return gesture;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)byVisible{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat alpha){
        @jobs_strongify(self)
        self.jobsVisible = alpha;
        return self;
    };
}
/// iOS 阴影效果 添加了shadowPath后消除了离屏渲染问题 。特别提示：不能存在 -(void)drawRect:(CGRect)rect 或者在-(void)drawRect:(CGRect)rect里面写，否则无效
/// @param targetShadowview 需要作用阴影效果的View
/// @param superview 该阴影效果的View的父View
/// @param ShadowDirection 阴影朝向
/// @param offsetX 贝塞尔曲线X轴偏移量
/// @param offsetY 贝塞尔曲线Y轴偏移量
/// @param cornerRadius 圆切角参数，传0表示不切
/// @param shadowOffset  阴影偏移量
/// @param shadowOpacity 阴影的不透明度,取值范围在0~1
/// @param layerShadowColor 阴影颜色
/// @param layerShadowRadius  模糊计算的半径
+(void)makeTargetShadowview:(__kindof UIView *__nonnull)targetShadowview
                  superView:(__kindof UIView *__nullable)superview
            shadowDirection:(ShadowDirection)ShadowDirection
          shadowWithOffsetX:(CGFloat)offsetX
                    offsetY:(CGFloat)offsetY
               cornerRadius:(CGFloat)cornerRadius
               shadowOffset:(CGSize)shadowOffset
              shadowOpacity:(CGFloat)shadowOpacity
           layerShadowColor:(UIColor *__nullable)layerShadowColor
          layerShadowRadius:(CGFloat)layerShadowRadius{
    targetShadowview.layer.cornerRadius = cornerRadius;/// 圆切角
    /// targetShadowview当在某些masonry约束的时候，没有frame,需要进行刷新得到frame，否则不会出现阴影效果
    if (superview && CGRectEqualToRect(targetShadowview.frame,CGRectZero)) superview.refresh();
    targetShadowview.layer.shadowOpacity = (shadowOpacity != 0) ? : 0.7f;//shadowOpacity设置了阴影的不透明度,取值范围在0~1;
    targetShadowview.layer.shadowOffset = shadowOffset;//阴影偏移量
    targetShadowview.layer.shadowColor = (layerShadowColor ? :JobsDarkGrayColor).CGColor;//阴影颜色   JobsLightGrayColor.CGColor;
    targetShadowview.layer.shadowRadius = (layerShadowRadius != 0) ? : 8.0f;//模糊计算的半径
    /// 偏移量保持为正数，便于后续计算
    offsetX = offsetX >= 0 ? offsetX : -offsetX;
    offsetY = offsetY >= 0 ? offsetY : -offsetY;
    /// 偏移量默认值
    offsetX = offsetX != 0 ? :20;
    offsetY = offsetY != 0 ? :20;
    targetShadowview.layer.shadowPath = jobsMakeBezierPath(^(__kindof UIBezierPath * _Nullable path) {
        switch (ShadowDirection) {
            /// 处理 ShadowDirection_top 分支
            case ShadowDirection_top:{
                path.moveTo(CGPointMake(0, -offsetY));/// 左上角为绘制的贝塞尔曲线原点
                path.add(CGPointMake(0, targetShadowview.height));/// 👇
                path.add(CGPointMake(targetShadowview.width, targetShadowview.height));/// 👉
                path.add(CGPointMake(targetShadowview.width, -offsetY));///👆
            }break;
            /// 处理 ShadowDirection_down 分支
            case ShadowDirection_down:{
                path.moveTo(CGPointZero);/// 左上角为绘制的贝塞尔曲线原点
                path.add(CGPointMake(0, targetShadowview.height + offsetY));/// 👇
                path.add(CGPointMake(targetShadowview.width, targetShadowview.height + offsetY));/// 👉
                path.add(CGPointMake(targetShadowview.width, 0));///👆
            }break;
            /// 处理 ShadowDirection_left 分支
            case ShadowDirection_left:{
                path.moveTo(CGPointMake(offsetX, 0));/// 左上角
                path.add(CGPointMake(offsetX, targetShadowview.height));///👇
                path.add(CGPointMake(targetShadowview.width, targetShadowview.height));/// 👉
                path.add(CGPointMake(targetShadowview.width, 0));/// 👆
            }break;
            /// 处理 ShadowDirection_right 分支
            case ShadowDirection_right:{
                path.moveTo(CGPointZero);/// 左上角
                path.add(CGPointMake(0, targetShadowview.height));/// 👇
                path.add(CGPointMake(targetShadowview.width + offsetX, targetShadowview.height));/// 👉
                path.add(CGPointMake(targetShadowview.width + offsetX, 0));/// 👆
            }break;
            /// 处理 ShadowDirection_leftTop 分支
            case ShadowDirection_leftTop:{
                path.moveTo(CGPointMake(-offsetX, -offsetY));/// 左上角
                path.add(CGPointMake(-offsetX, targetShadowview.height - offsetY));/// 👇
                path.add(CGPointMake(targetShadowview.width - offsetX, targetShadowview.height - offsetY));/// 👉
                path.add(CGPointMake(targetShadowview.width - offsetX, -offsetY));/// 👆
            }break;
            /// 处理 ShadowDirection_leftDown 分支
            case ShadowDirection_leftDown:{
                path.moveTo(CGPointMake(-offsetX, offsetY));/// 左上角
                path.add(CGPointMake(-offsetX, targetShadowview.height + offsetY));/// 👇
                path.add(CGPointMake(targetShadowview.width - offsetX, targetShadowview.height + offsetX));/// 👉
                path.add(CGPointMake(targetShadowview.width - offsetX, offsetY));/// 👆
            }break;
            /// 处理 ShadowDirection_rightTop 分支
            case ShadowDirection_rightTop:{
                path.moveTo(CGPointMake(offsetX, -offsetY));/// 左上角
                path.add(CGPointMake(offsetX, targetShadowview.height - offsetY));/// 👇
                path.add(CGPointMake(targetShadowview.width + offsetX, targetShadowview.height - offsetY));/// 👉
                path.add(CGPointMake(targetShadowview.width + offsetX, -offsetY));/// 👆
            }break;
            /// 处理 ShadowDirection_rightDown 分支
            case ShadowDirection_rightDown:{
                path.moveTo(CGPointMake(offsetX, offsetY));/// 左上角
                path.add(CGPointMake(offsetX, targetShadowview.height + offsetY));/// 👇
                path.add(CGPointMake(targetShadowview.width + offsetX, targetShadowview.height + offsetY));/// 👉
                path.add(CGPointMake(targetShadowview.width + offsetX, offsetY));/// 👆
            }break;
            /// 处理 ShadowDirection_All 分支
            case ShadowDirection_All:{
                path.moveTo(CGPointMake(-offsetX, -offsetY));/// 左上角
                path.add(CGPointMake(-offsetX, targetShadowview.height + offsetY));/// 👇
                path.add(CGPointMake(targetShadowview.width + offsetX, targetShadowview.height + offsetY));/// 👉
                path.add(CGPointMake(targetShadowview.width + offsetX, -offsetY));/// 👆
            }break;
            /// 未匹配已知分支时执行兜底处理
            default:
                break;
        }
    }).CGPath;
}
#pragma mark —— UILabel
/// 确定Label的字体大小，使其宽度自适应
-(JobsRetViewByVoidBlock _Nonnull)bySizeToFit{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable() {
        @jobs_strongify(self)
        [self sizeToFit];// 必须有text，然后根据text来进行约束计算和布局
        return self;
    };
}
/// 确定Label的宽度，使字体大小自适应
-(JobsRetViewByVoidBlock _Nonnull)labelAutoFontByWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable() {
        @jobs_strongify(self)
        if ([self isKindOfClass:UILabel.class]) {
            UILabel *label = (UILabel *)self;
            label.adjustsFontSizeToFitWidth = YES;// 必须有text，然后根据text来进行约束计算和布局
        };return self;
    };
}
#pragma mark —— Prop_assign()BOOL ableRespose
JobsKey(_ableRespose)
@dynamic ableRespose;
- (void)setAbleRespose:(BOOL)ableRespose {
    Jobs_setAssociatedRETAIN_NONATOMIC(_ableRespose, @(ableRespose))
}

-(BOOL)ableRespose {
    return Jobs_getAssociatedObject(_ableRespose) != nil ? [Jobs_getAssociatedObject(_ableRespose) boolValue] : NO;
}
/// 设置控件是否可见，对影响可视化的hidden 和 alpha属性进行操作
/// 需要特别注意的是：这个地方的jobsVisible不能属性化，否则在某些情况下会出现异常（只会走子类方法不会走分类方法）
#pragma mark —— Prop_assign()CGFloat jobsVisible;
JobsKey(_jobsVisible)
-(CGFloat)jobsVisible{
    BOOL JobsVisible = [Jobs_getAssociatedObject(_jobsVisible) floatValue];
    return JobsVisible;
}

-(void)setJobsVisible:(CGFloat)jobsVisible{
    self.byHidden(!jobsVisible);
    self.byAlpha(jobsVisible);
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobsVisible, @(jobsVisible))
}

@end
