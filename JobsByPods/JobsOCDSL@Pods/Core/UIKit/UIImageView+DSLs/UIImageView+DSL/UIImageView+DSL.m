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

@end
