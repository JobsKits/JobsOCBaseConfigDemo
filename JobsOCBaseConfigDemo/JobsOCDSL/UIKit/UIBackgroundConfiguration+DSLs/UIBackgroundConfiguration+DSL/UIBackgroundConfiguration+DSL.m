//
//  UIBackgroundConfiguration+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#import "UIBackgroundConfiguration+DSL.h"

@implementation UIBackgroundConfiguration (DSL)
#pragma mark —— 自定义视图
-(JobsRetBackgroundConfigByViewBlock _Nonnull)byCustomView{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(UIView *_Nullable view){
        @jobs_strongify(self)
        self.customView = view;
        return self;
    };
}
#pragma mark —— 背景
-(JobsRetBackgroundConfigByCorBlock _Nonnull)byBackgroundColor{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.backgroundColor = color;
        return self;
    };
}

-(JobsRetBackgroundConfigByCorTransformerBlock _Nonnull)byBackgroundColorTransformer{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(UIConfigurationColorTransformer _Nullable transformer){
        @jobs_strongify(self)
        self.backgroundColorTransformer = transformer;
        return self;
    };
}

-(JobsRetBackgroundConfigByVisualEffectBlock _Nonnull)byVisualEffect{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(UIVisualEffect *_Nullable effect){
        @jobs_strongify(self)
        self.visualEffect = effect;
        return self;
    };
}
#pragma mark —— 圆角 / 边距
-(JobsRetBackgroundConfigByCGFloatBlock _Nonnull)byCornerRadius{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(CGFloat radius){
        @jobs_strongify(self)
        self.cornerRadius = radius;
        return self;
    };
}

-(JobsRetBackgroundConfigByInsetsBlock _Nonnull)byBackgroundInsets{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(NSDirectionalEdgeInsets insets){
        @jobs_strongify(self)
        self.backgroundInsets = insets;
        return self;
    };
}

-(JobsRetBackgroundConfigByRectEdgeBlock _Nonnull)byEdgesAddingLayoutMargins{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(NSDirectionalRectEdge edges){
        @jobs_strongify(self)
        self.edgesAddingLayoutMarginsToBackgroundInsets = edges;
        return self;
    };
}
#pragma mark —— 描边
-(JobsRetBackgroundConfigByCorBlock _Nonnull)byStrokeColor{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.strokeColor = color;
        return self;
    };
}

-(JobsRetBackgroundConfigByCorTransformerBlock _Nonnull)byStrokeColorTransformer{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(UIConfigurationColorTransformer _Nullable transformer){
        @jobs_strongify(self)
        self.strokeColorTransformer = transformer;
        return self;
    };
}

-(JobsRetBackgroundConfigByCGFloatBlock _Nonnull)byStrokeWidth{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(CGFloat width){
        @jobs_strongify(self)
        self.strokeWidth = width;
        return self;
    };
}

-(JobsRetBackgroundConfigByCGFloatBlock _Nonnull)byStrokeOutset{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(CGFloat outset){
        @jobs_strongify(self)
        self.strokeOutset = outset;
        return self;
    };
}
#pragma mark —— 图片
-(JobsRetBackgroundConfigByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(UIImage *_Nullable image){
        @jobs_strongify(self)
        self.image = image;
        return self;
    };
}

-(JobsRetBackgroundConfigByContentModeBlock _Nonnull)byImageContentMode{
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *_Nonnull(UIViewContentMode mode){
        @jobs_strongify(self)
        self.imageContentMode = mode;
        return self;
    };
}

@end
