//
//  CALayer+Extra.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CALayer+Extra.h"

@implementation CALayer (Extra)
#pragma mark —— 迎合链式语法而做的封装
-(JobsRetCALayerByCGFloatBlock _Nonnull)cornerRadiusBy{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.cornerRadius = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)borderWidthBy{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(JobsRetCALayerByCorBlock _Nonnull)borderColorBy{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.borderColor = data.CGColor;
        return self;
    };
}

-(JobsRetCALayerByBOOLBlock _Nonnull)masksToBoundsBy{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.masksToBounds = data;
        return self;
    };
}
/// 添加Layer
-(JobsRetCALayerByCALayerBlock _Nonnull)addSublayer{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CALayer *_Nullable data){
        @jobs_strongify(self)
        [self addSublayer:data];
        return data;
    };
}
/// 删除Layer
-(jobsByVoidBlock _Nonnull)remove{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self removeFromSuperlayer];
    };
}

@end
