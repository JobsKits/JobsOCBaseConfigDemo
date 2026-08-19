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

-(JobsRetSDWebImageModelByUIntegerBlock _Nonnull)byOptions{
    @jobs_weakify(self)
    return ^__kindof SDWebImageModel *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.options = data;
        return self;
    };
}

-(JobsRetSDWebImageModelByCompletionBlock _Nonnull)byCompletion{
    @jobs_weakify(self)
    return ^__kindof SDWebImageModel *_Nullable(SDExternalCompletionBlock _Nullable data){
        @jobs_strongify(self)
        self.completion = data;
        return self;
    };
}

-(JobsRetSDWebImageModelByProgressBlock _Nonnull)byProgress{
    @jobs_weakify(self)
    return ^__kindof SDWebImageModel *_Nullable(SDImageLoaderProgressBlock _Nullable data){
        @jobs_strongify(self)
        self.progress = data;
        return self;
    };
}

@end
