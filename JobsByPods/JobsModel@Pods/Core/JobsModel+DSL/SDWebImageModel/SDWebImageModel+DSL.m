//
//  SDWebImageModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "SDWebImageModel+DSL.h"

@implementation SDWebImageModel (DSL)

#pragma mark —— 来自 SDWebImageModel
-(__kindof SDWebImageModel *_Nonnull (^ _Nonnull)(NSURL * data))byUrl{
    @jobs_weakify(self)
    return ^__kindof SDWebImageModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(__kindof SDWebImageModel *_Nonnull (^ _Nonnull)(UIImage * data))byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof SDWebImageModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}

-(__kindof SDWebImageModel *_Nonnull (^ _Nonnull)(SDWebImageOptions data))byOptions{
    @jobs_weakify(self)
    return ^__kindof SDWebImageModel *_Nonnull(SDWebImageOptions data) {
        @jobs_strongify(self)
        self.options = data;
        return self;
    };
}

-(__kindof SDWebImageModel *_Nonnull (^ _Nonnull)(SDExternalCompletionBlock data))byCompletion{
    @jobs_weakify(self)
    return ^__kindof SDWebImageModel *_Nonnull(SDExternalCompletionBlock data) {
        @jobs_strongify(self)
        self.completion = data;
        return self;
    };
}

-(__kindof SDWebImageModel *_Nonnull (^ _Nonnull)(SDImageLoaderProgressBlock data))byProgress{
    @jobs_weakify(self)
    return ^__kindof SDWebImageModel *_Nonnull(SDImageLoaderProgressBlock data) {
        @jobs_strongify(self)
        self.progress = data;
        return self;
    };
}

@end
