//
//  UIImageView+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月10日，星期三。
//

#import "UIImageView+DSL.h"

@implementation UIImageView (DSL)

-(JobsRetImageViewByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(UIImage *_Nullable image){
        @jobs_strongify(self)
        self.image = image;
        return self;
    };
}

-(JobsRetImageViewByImageBlock _Nonnull)byHighlightedImage{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(UIImage *_Nullable image){
        @jobs_strongify(self)
        self.highlightedImage = image;
        return self;
    };
}

-(JobsRetImageViewByBOOLBlock _Nonnull)byHighlighted{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(BOOL highlighted){
        @jobs_strongify(self)
        self.highlighted = highlighted;
        return self;
    };
}

-(JobsRetImageViewByArrBlock _Nonnull)byAnimationImages{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.animationImages = data;
        return self;
    };
}

-(JobsRetImageViewByNSTimeIntervalBlock _Nonnull)byAnimationDuration{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(NSTimeInterval data){
        @jobs_strongify(self)
        self.animationDuration = data;
        return self;
    };
}

-(JobsRetImageViewByNSIntegerBlock _Nonnull)byAnimationRepeatCount{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(NSInteger data){
        @jobs_strongify(self)
        self.animationRepeatCount = data;
        return self;
    };
}

@end
