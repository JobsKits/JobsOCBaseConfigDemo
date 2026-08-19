//
//  UILabel+Extra.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021/12/27.
//

#import "UILabel+Extra.h"

@implementation UILabel (Extra)
#pragma mark —— 一些公共方法
/// 将label.text + label.textColor + label.font;包装成富文本
/// UILabel文字旋转
/// 通过传入的(UIImage *)bgImage 来设置背景颜色
/// 行数
/// 设置UILabel的显示样式 【在Masonry以后拿到了frame】
-(JobsRetLabelByVoidBlock _Nonnull)labelAutoWidthByFont{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(void) {
        @jobs_strongify(self)
        CGFloat height = self.height;
        [self sizeToFit];
        if (height) self.height = height;
        return self;
    };
}
#pragma mark —— 系统方法链式语法封装
-(JobsRetLabelByCorBlock _Nonnull)byBgColor{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        [self setBackgroundColor:cor];
        return self;
    };
}

#pragma mark —— Prop_assign()UILabelShowingType labelShowingType;
JobsKey(_labelShowingType)
@dynamic labelShowingType;
-(UILabelShowingType)labelShowingType{
    return [Jobs_getAssociatedObject(_labelShowingType) integerValue];
}

-(void)setLabelShowingType:(UILabelShowingType)labelShowingType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_labelShowingType, @(labelShowingType))
}
#pragma mark —— Prop_assign()CGFloat value;
JobsKey(_value)
@dynamic value;
-(CGFloat)value{
    return [Jobs_getAssociatedObject(_value) floatValue];
}

-(void)setValue:(CGFloat)value{
    Jobs_setAssociatedRETAIN_NONATOMIC(_value, @(value));
}
#pragma mark —— Prop_assign()CGFloat lastValue;
JobsKey(_lastValue)
@dynamic lastValue;
-(CGFloat)lastValue{
    return [Jobs_getAssociatedObject(_lastValue) floatValue];
}

-(void)setLastValue:(CGFloat)lastValue{
    Jobs_setAssociatedRETAIN_NONATOMIC(_lastValue, @(lastValue));
}
#pragma mark —— Prop_strong()CAShapeLayer *shapeLayer;
JobsKey(_shapeLayer)
@dynamic shapeLayer;
-(CAShapeLayer *)shapeLayer{
    CAShapeLayer *ShapeLayer = Jobs_getAssociatedObject(_shapeLayer);
    if (!ShapeLayer) {
        Jobs_setAssociatedRETAIN_NONATOMIC(_shapeLayer, [self.text animateOnView:self
                                                                          atRect:self.bounds
                                                                         forFont:self.font
                                                                       withColor:self.textColor
                                                                    andDirection:self.transformLayerDirectionType]);
    };return ShapeLayer;
}

-(void)setShapeLayer:(CAShapeLayer *)shapeLayer{
    Jobs_setAssociatedRETAIN_NONATOMIC(_shapeLayer, shapeLayer);
}
#pragma mark —— Prop_assign()JobsDirection transformLayerDirectionType;
JobsKey(_transformLayerDirectionType)
@dynamic transformLayerDirectionType;
-(JobsDirection)transformLayerDirectionType{
    return [Jobs_getAssociatedObject(_transformLayerDirectionType) unsignedIntegerValue];
}

-(void)setTransformLayerDirectionType:(JobsDirection)transformLayerDirectionType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_transformLayerDirectionType, @(transformLayerDirectionType))
}

@end
