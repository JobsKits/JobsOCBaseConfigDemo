//
//  SDWebImageModel+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "SDWebImageModel+DSL.h"

@implementation SDWebImageModel (DSL)

-(JobsRetSDWebImageModelByURLBlock _Nonnull)byUrl{
    @jobs_weakify(self)
    return ^__kindof SDWebImageModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(JobsRetSDWebImageModelByImageBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof SDWebImageModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}

@end
